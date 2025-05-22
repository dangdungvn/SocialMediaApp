import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media_app/app/configs/colors.dart';
import 'package:social_media_app/app/configs/theme.dart';
import 'package:social_media_app/app/resources/constant/named_routes.dart';
import 'package:social_media_app/ui/pages/login_page.dart';
import 'package:social_media_app/ui/pages/register_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              _buildHeader(),
              const Spacer(),
              _buildButtons(context),
              const SizedBox(height: 20),
              _buildTermsText(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Image.asset('assets/images/ic_logo.png', height: 90, width: 90),
        const SizedBox(height: 24),
        Text(
          'SOCIALAPP',
          style: AppTheme.blackTextStyle.copyWith(
            fontSize: 28,
            fontWeight: AppTheme.bold,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Kết nối với bạn bè và chia sẻ những khoảnh khắc đáng nhớ',
          textAlign: TextAlign.center,
          style: AppTheme.greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: AppTheme.regular,
          ),
        ),
      ],
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, NamedRoutes.loginScreen);
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
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, NamedRoutes.registerScreen);
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.purpleColor, width: 1.5),
            ),
            child: Center(
              child: Text(
                'Đăng ký',
                style: AppTheme.blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: AppTheme.semiBold,
                  color: AppColors.purpleColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTermsText() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Bằng cách tiếp tục, bạn đồng ý với ',
        style: AppTheme.greyTextStyle.copyWith(
          fontSize: 12,
          fontWeight: AppTheme.regular,
        ),
        children: [
          TextSpan(
            text: 'Điều khoản dịch vụ',
            style: AppTheme.blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: AppTheme.medium,
              color: AppColors.purpleColor,
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(
            text: ' và ',
            style: AppTheme.greyTextStyle.copyWith(
              fontSize: 12,
              fontWeight: AppTheme.regular,
            ),
          ),
          TextSpan(
            text: 'Chính sách bảo mật',
            style: AppTheme.blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: AppTheme.medium,
              color: AppColors.purpleColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
