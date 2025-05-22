import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media_app/app/configs/colors.dart';
import 'package:social_media_app/app/configs/theme.dart';
import 'package:social_media_app/app/resources/constant/named_routes.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAppBar(),
                  const SizedBox(height: 30),
                  _buildHeader(),
                  const SizedBox(height: 40),
                  _buildPasswordInput(),
                  const SizedBox(height: 20),
                  _buildConfirmPasswordInput(),
                  const SizedBox(height: 40),
                  _buildResetButton(),
                ],
              ),
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
          'Đặt lại mật khẩu',
          style: AppTheme.blackTextStyle.copyWith(
            fontSize: 26,
            fontWeight: AppTheme.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Tạo mật khẩu mới và an toàn cho tài khoản của bạn',
          style: AppTheme.greyTextStyle.copyWith(
            fontSize: 14,
            fontWeight: AppTheme.regular,
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mật khẩu mới',
          style: AppTheme.blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: AppTheme.medium,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _passwordController,
          obscureText: _obscurePassword,
          decoration: InputDecoration(
            hintText: 'Nhập mật khẩu mới',
            hintStyle: AppTheme.greyTextStyle.copyWith(
              fontSize: 14,
              fontWeight: AppTheme.regular,
            ),
            filled: true,
            fillColor: AppColors.backgroundColor,
            contentPadding: const EdgeInsets.all(16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            prefixIcon: const Icon(
              Icons.lock_outline,
              color: AppColors.greyColor,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: AppColors.greyColor,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Vui lòng nhập mật khẩu mới';
            }
            if (value.length < 6) {
              return 'Mật khẩu phải có ít nhất 6 ký tự';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildConfirmPasswordInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Xác nhận mật khẩu',
          style: AppTheme.blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: AppTheme.medium,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _confirmPasswordController,
          obscureText: _obscureConfirmPassword,
          decoration: InputDecoration(
            hintText: 'Nhập lại mật khẩu mới',
            hintStyle: AppTheme.greyTextStyle.copyWith(
              fontSize: 14,
              fontWeight: AppTheme.regular,
            ),
            filled: true,
            fillColor: AppColors.backgroundColor,
            contentPadding: const EdgeInsets.all(16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            prefixIcon: const Icon(
              Icons.lock_outline,
              color: AppColors.greyColor,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureConfirmPassword
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: AppColors.greyColor,
              ),
              onPressed: () {
                setState(() {
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                });
              },
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Vui lòng xác nhận mật khẩu';
            }
            if (value != _passwordController.text) {
              return 'Mật khẩu không khớp';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildResetButton() {
    return GestureDetector(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          _showSuccessDialog();
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
            'Đặt lại mật khẩu',
            style: AppTheme.whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: AppTheme.semiBold,
            ),
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Text(
              'Đặt lại mật khẩu thành công',
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
                  'Bạn đã đặt lại mật khẩu thành công. Vui lòng đăng nhập lại với mật khẩu mới.',
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
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    NamedRoutes.loginScreen,
                    (route) => false,
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
                    'Đăng nhập',
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
