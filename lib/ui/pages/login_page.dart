import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media_app/app/configs/colors.dart';
import 'package:social_media_app/app/configs/theme.dart';
import 'package:social_media_app/app/resources/constant/named_routes.dart';
import 'package:social_media_app/ui/pages/forgot_password_page.dart';
import 'package:social_media_app/ui/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                  const SizedBox(height: 40),
                  _buildHeader(),
                  const SizedBox(height: 40),
                  _buildEmailInput(),
                  const SizedBox(height: 20),
                  _buildPasswordInput(),
                  const SizedBox(height: 14),
                  _buildForgotPassword(),
                  const SizedBox(height: 30),
                  _buildLoginButton(),
                  const SizedBox(height: 20),
                  _buildOrDivider(),
                  const SizedBox(height: 20),
                  _buildSocialLoginButtons(),
                  const SizedBox(height: 30),
                  _buildRegisterLink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/images/ic_logo.png', height: 60, width: 60),
        const SizedBox(height: 20),
        Text(
          'Đăng nhập',
          style: AppTheme.blackTextStyle.copyWith(
            fontSize: 26,
            fontWeight: AppTheme.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Chào mừng bạn trở lại! Vui lòng đăng nhập để tiếp tục',
          style: AppTheme.greyTextStyle.copyWith(
            fontSize: 14,
            fontWeight: AppTheme.regular,
          ),
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

  Widget _buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, NamedRoutes.forgotPasswordScreen);
        },
        child: Text(
          'Quên mật khẩu?',
          style: AppTheme.blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: AppTheme.medium,
            color: AppColors.purpleColor,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return GestureDetector(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          // Xử lý đăng nhập
          Navigator.pushReplacementNamed(context, NamedRoutes.mainScreen);
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
            'Đăng nhập',
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
            'Hoặc đăng nhập với',
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
            // Xử lý đăng nhập Google
          },
          icon: Icons.g_mobiledata,
          backgroundColor: Colors.red.shade50,
          iconColor: Colors.red,
        ),
        const SizedBox(width: 20),
        _buildSocialButton(
          onTap: () {
            // Xử lý đăng nhập Facebook
          },
          icon: Icons.facebook,
          backgroundColor: Colors.blue.shade50,
          iconColor: Colors.blue,
        ),
        const SizedBox(width: 20),
        _buildSocialButton(
          onTap: () {
            // Xử lý đăng nhập Twitter
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

  Widget _buildRegisterLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Chưa có tài khoản? ',
          style: AppTheme.greyTextStyle.copyWith(
            fontSize: 14,
            fontWeight: AppTheme.regular,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegisterPage()),
            );
          },
          child: Text(
            'Đăng ký',
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
