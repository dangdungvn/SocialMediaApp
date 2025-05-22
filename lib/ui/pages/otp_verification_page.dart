import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media_app/app/configs/colors.dart';
import 'package:social_media_app/app/configs/theme.dart';
import 'package:social_media_app/app/resources/constant/named_routes.dart';

class OtpVerificationPage extends StatefulWidget {
  final String email;
  final bool isRegistration;

  const OtpVerificationPage({
    super.key,
    required this.email,
    this.isRegistration = true,
  });

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final List<TextEditingController> _otpControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  Timer? _timer;
  int _secondsRemaining = 60;
  bool _canResendOtp = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _canResendOtp = true;
          _timer?.cancel();
        });
      }
    });
  }

  void _resendOtp() {
    if (_canResendOtp) {
      setState(() {
        _secondsRemaining = 60;
        _canResendOtp = false;
      });
      _startTimer();

      // Hiển thị snackbar thông báo đã gửi lại OTP
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Đã gửi lại mã OTP đến ${widget.email}',
            style: AppTheme.whiteTextStyle,
          ),
          backgroundColor: AppColors.purpleColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAppBar(),
                const SizedBox(height: 30),
                _buildHeader(),
                const SizedBox(height: 40),
                _buildOtpFields(),
                const SizedBox(height: 30),
                _buildResendOtp(),
                const SizedBox(height: 40),
                _buildVerifyButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.blackColor,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Xác thực OTP',
          style: AppTheme.blackTextStyle.copyWith(
            fontSize: 26,
            fontWeight: AppTheme.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Chúng tôi đã gửi mã OTP đến ${widget.email}',
          style: AppTheme.greyTextStyle.copyWith(
            fontSize: 14,
            fontWeight: AppTheme.regular,
          ),
        ),
      ],
    );
  }

  Widget _buildOtpFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(4, (index) => _buildOtpField(index)),
    );
  }

  Widget _buildOtpField(int index) {
    return SizedBox(
      width: 70,
      child: TextFormField(
        controller: _otpControllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: AppTheme.blackTextStyle.copyWith(
          fontSize: 22,
          fontWeight: AppTheme.bold,
        ),
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: AppColors.backgroundColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            _focusNodes[index + 1].requestFocus();
          }
          // Kiểm tra nếu tất cả các ô đã được điền
          if (_isOtpComplete()) {
            FocusScope.of(context).unfocus();
          }
        },
      ),
    );
  }

  bool _isOtpComplete() {
    for (var controller in _otpControllers) {
      if (controller.text.isEmpty) {
        return false;
      }
    }
    return true;
  }

  Widget _buildResendOtp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Không nhận được mã? ',
          style: AppTheme.greyTextStyle.copyWith(
            fontSize: 14,
            fontWeight: AppTheme.regular,
          ),
        ),
        GestureDetector(
          onTap: _resendOtp,
          child: Text(
            _canResendOtp
                ? 'Gửi lại OTP'
                : 'Gửi lại sau $_secondsRemaining giây',
            style: AppTheme.blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: AppTheme.bold,
              color:
                  _canResendOtp ? AppColors.purpleColor : AppColors.greyColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVerifyButton() {
    return GestureDetector(
      onTap: () {
        if (_isOtpComplete()) {
          // Nếu là trong luồng đăng ký
          if (widget.isRegistration) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              NamedRoutes.mainScreen,
              (route) => false,
            );
          } else {
            // Nếu là trong luồng khôi phục mật khẩu
            _showResetPasswordDialog();
          }
        } else {
          // Hiển thị thông báo nếu người dùng chưa nhập đủ mã OTP
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Vui lòng nhập đầy đủ mã OTP')),
          );
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.purpleColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            'Xác nhận',
            style: AppTheme.whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: AppTheme.semiBold,
            ),
          ),
        ),
      ),
    );
  }

  void _showResetPasswordDialog() {
    // Hiển thị dialog khôi phục mật khẩu thành công
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Text(
              'Xác thực thành công',
              style: AppTheme.blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: AppTheme.bold,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle,
                  color: AppColors.greenColor,
                  size: 70,
                ),
                const SizedBox(height: 16),
                Text(
                  'Bạn đã xác thực thành công. Vui lòng đặt lại mật khẩu mới.',
                  style: AppTheme.greyTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: AppTheme.regular,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Đóng dialog
                  Navigator.pushReplacementNamed(
                    context,
                    NamedRoutes.resetPasswordScreen,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.purpleColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Tiếp tục',
                    style: AppTheme.whiteTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: AppTheme.semiBold,
                    ),
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
