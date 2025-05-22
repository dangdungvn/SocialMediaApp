import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media_app/app/configs/colors.dart';
import 'package:social_media_app/ui/pages/discover_page.dart';
import 'package:social_media_app/ui/pages/home_page.dart';
import 'package:social_media_app/ui/pages/inbox_page.dart';
import 'package:social_media_app/ui/pages/profile_page.dart';
import 'package:social_media_app/ui/widgets/bottom_nav_bar.dart';
import 'package:social_media_app/ui/widgets/clip_status_bar.dart';

class MainPage extends StatefulWidget {
  final int initialPage;

  const MainPage({super.key, this.initialPage = 0});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int _currentIndex;
  late PageController _pageController;

  // Các trang chính của ứng dụng
  final List<Widget> _pages = [
    const HomePage(),
    const DiscoverPage(),
    const InboxPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialPage;
    _pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
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
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // PageView để hiển thị các trang con
          PageView(
            controller: _pageController,
            // physics:
            //     const NeverScrollableScrollPhysics(), // Tắt vuốt ngang để chuyển trang
            children: _pages,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),

          // Gradient overlay phía dưới
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.whiteColor.withOpacity(0),
                    AppColors.whiteColor.withOpacity(0.8),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          // Nút thêm bài viết
          Positioned(
            bottom: 91,
            child: Transform.rotate(
              angle: 11,
              child: ClipPath(
                clipper: ClipStatusBar(),
                child: Container(
                  height: 110,
                  width: 40,
                  color: AppColors.blackColor,
                  child: const Icon(
                    Icons.add,
                    size: 24,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),

          // Bottom Navigation Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavBar(
              selectedIndex: _currentIndex,
              onItemTapped: _onItemTapped,
            ),
          ),
        ],
      ),
    );
  }
}
