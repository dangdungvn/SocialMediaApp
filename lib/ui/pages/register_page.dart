import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media_app/app/configs/colors.dart';
import 'package:social_media_app/app/configs/theme.dart';
import 'package:social_media_app/app/resources/constant/named_routes.dart';
import 'package:social_media_app/ui/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _acceptTerms = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
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
                  const SizedBox(height: 25),
                  _buildNameInput(),
                  const SizedBox(height: 16),
                  _buildEmailInput(),
                  const SizedBox(height: 16),
                  _buildPasswordInput(),
                  const SizedBox(height: 16),
                  _buildConfirmPasswordInput(),
                  const SizedBox(height: 20),
                  _buildTermsAndConditions(),
                  const SizedBox(height: 30),
                  _buildRegisterButton(),
                  const SizedBox(height: 20),
                  _buildOrDivider(),
                  const SizedBox(height: 20),
                  _buildSocialLoginButtons(),
                  const SizedBox(height: 30),
                  _buildLoginLink(),
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
          'Đăng ký tài khoản',
          style: AppTheme.blackTextStyle.copyWith(
            fontSize: 26,
            fontWeight: AppTheme.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Tạo tài khoản mới để khám phá tất cả tính năng',
          style: AppTheme.greyTextStyle.copyWith(
            fontSize: 14,
            fontWeight: AppTheme.regular,
          ),
        ),
      ],
    );
  }

  Widget _buildNameInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tên đầy đủ',
          style: AppTheme.blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: AppTheme.medium,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _nameController,
          decoration: InputDecoration(
            hintText: 'Nhập tên đầy đủ',
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
              Icons.person_outline,
              color: AppColors.greyColor,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Vui lòng nhập tên đầy đủ';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildEmailInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: AppTheme.blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: AppTheme.medium,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Nhập email của bạn',
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
              Icons.email_outlined,
              color: AppColors.greyColor,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Vui lòng nhập email';
            }
            if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'Email không hợp lệ';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildPasswordInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mật khẩu',
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
            hintText: 'Nhập mật khẩu của bạn',
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
              return 'Vui lòng nhập mật khẩu';
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
            hintText: 'Nhập lại mật khẩu của bạn',
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

  Widget _buildTermsAndConditions() {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: _acceptTerms,
            activeColor: AppColors.purpleColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            onChanged: (value) {
              setState(() {
                _acceptTerms = value!;
              });
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'Tôi đồng ý với ',
              style: AppTheme.greyTextStyle.copyWith(
                fontSize: 14,
                fontWeight: AppTheme.regular,
              ),
              children: [
                TextSpan(
                  text: 'Điều khoản dịch vụ',
                  style: AppTheme.blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: AppTheme.medium,
                    color: AppColors.purpleColor,
                  ),
                ),
                TextSpan(
                  text: ' và ',
                  style: AppTheme.greyTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: AppTheme.regular,
                  ),
                ),
                TextSpan(
                  text: 'Chính sách bảo mật',
                  style: AppTheme.blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: AppTheme.medium,
                    color: AppColors.purpleColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton() {
    return GestureDetector(
      onTap: () {
        if (_formKey.currentState!.validate() && _acceptTerms) {
          // Xử lý đăng ký, chuyển đến trang xác thực OTP
          Navigator.pushNamed(
            context,
            NamedRoutes.otpVerificationScreen,
            arguments: {'email': _emailController.text, 'isRegistration': true},
          );
        } else if (!_acceptTerms) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Vui lòng đồng ý với điều khoản dịch vụ'),
            ),
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
            'Đăng ký',
            style: AppTheme.whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: AppTheme.semiBold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOrDivider() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.greyColor.withOpacity(0.2),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Hoặc đăng ký với',
            style: AppTheme.greyTextStyle.copyWith(
              fontSize: 14,
              fontWeight: AppTheme.medium,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.greyColor.withOpacity(0.2),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(
          onTap: () {
            // Xử lý đăng ký Google
          },
          icon: Icons.g_mobiledata,
          backgroundColor: Colors.red.shade50,
          iconColor: Colors.red,
        ),
        const SizedBox(width: 20),
        _buildSocialButton(
          onTap: () {
            // Xử lý đăng ký Facebook
          },
          icon: Icons.facebook,
          backgroundColor: Colors.blue.shade50,
          iconColor: Colors.blue,
        ),
        const SizedBox(width: 20),
        _buildSocialButton(
          onTap: () {
            // Xử lý đăng ký Apple
          },
          icon: Icons.apple,
          backgroundColor: Colors.grey.shade100,
          iconColor: Colors.black,
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required VoidCallback onTap,
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: iconColor, size: 30),
      ),
    );
  }

  Widget _buildLoginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Đã có tài khoản? ',
          style: AppTheme.greyTextStyle.copyWith(
            fontSize: 14,
            fontWeight: AppTheme.regular,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
          child: Text(
            'Đăng nhập',
            style: AppTheme.blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: AppTheme.bold,
              color: AppColors.purpleColor,
            ),
          ),
        ),
      ],
    );
  }
}
