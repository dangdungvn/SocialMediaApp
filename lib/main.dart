import 'package:flutter/material.dart';
import 'package:social_media_app/app/configs/theme.dart';
import 'package:social_media_app/app/resources/constant/named_routes.dart';
import 'package:social_media_app/ui/pages/main_page.dart';

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
      home: const MainPage(), // Sử dụng MainPage làm trang chính
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
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
            return MaterialPageRoute(builder: (context) => const MainPage());
        }
      },
    );
  }
}
