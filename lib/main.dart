import 'package:flutter/material.dart';
import 'package:social_media_app/app/configs/theme.dart';
import 'package:social_media_app/app/resources/constant/named_routes.dart';
import 'package:social_media_app/ui/pages/forgot_password_page.dart';
import 'package:social_media_app/ui/pages/login_page.dart';
import 'package:social_media_app/ui/pages/main_page.dart';
import 'package:social_media_app/ui/pages/otp_verification_page.dart';
import 'package:social_media_app/ui/pages/register_page.dart';
import 'package:social_media_app/ui/pages/reset_password_page.dart';
import 'package:social_media_app/ui/pages/splash_screen.dart';
import 'package:social_media_app/ui/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Media App',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(), // Sử dụng SplashScreen làm trang chính
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case NamedRoutes.splashScreen:
            return MaterialPageRoute(
              builder: (context) => const SplashScreen(),
            );
          case NamedRoutes.welcomeScreen:
            // Default case: Navigates to WelcomePage for unmatched routes.
            return MaterialPageRoute(builder: (context) => const WelcomePage());
          case NamedRoutes.loginScreen:
            return MaterialPageRoute(builder: (context) => const LoginPage());
          case NamedRoutes.registerScreen:
            return MaterialPageRoute(
              builder: (context) => const RegisterPage(),
            );
          case NamedRoutes.forgotPasswordScreen:
            return MaterialPageRoute(
              builder: (context) => const ForgotPasswordPage(),
            );
          case NamedRoutes.otpVerificationScreen:
            final args = settings.arguments as Map<String, dynamic>?;
            return MaterialPageRoute(
              builder:
                  (context) => OtpVerificationPage(
                    email: args?['email'] ?? '',
                    isRegistration: args?['isRegistration'] ?? true,
                  ),
            );
          case NamedRoutes.resetPasswordScreen:
            return MaterialPageRoute(
              builder: (context) => const ResetPasswordPage(),
            );
          case NamedRoutes.mainScreen:
            return MaterialPageRoute(builder: (context) => const MainPage());
          case NamedRoutes.homeScreen:
            return MaterialPageRoute(
              builder: (context) => const MainPage(initialPage: 0),
            );
          case NamedRoutes.discoverScreen:
            return MaterialPageRoute(
              builder: (context) => const MainPage(initialPage: 1),
            );
          case NamedRoutes.inboxScreen:
            return MaterialPageRoute(
              builder: (context) => const MainPage(initialPage: 2),
            );
          case NamedRoutes.profileScreen:
            return MaterialPageRoute(
              builder: (context) => const MainPage(initialPage: 3),
            );
          default:
            return MaterialPageRoute(builder: (context) => const WelcomePage());
        }
      },
    );
  }
}
