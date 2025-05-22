import 'package:flutter/material.dart';
import 'package:social_media_app/app/configs/colors.dart';
import 'package:social_media_app/app/configs/theme.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(right: 24, left: 24, bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildItemBottomNavBar("assets/images/ic_home.png", "Home", 0),
          _buildItemBottomNavBar(
            "assets/images/ic_discorvery.png",
            "Discover",
            1,
          ),
          _buildItemBottomNavBar("assets/images/ic_inbox.png", "Inbox", 2),
          _buildItemBottomNavBar("assets/images/ic_profile.png", "Profile", 3),
        ],
      ),
    );
  }

  Widget _buildItemBottomNavBar(String icon, String title, int index) {
    bool selected = selectedIndex == index;
    return InkWell(
      onTap: () => onItemTapped(index),
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: selected ? AppColors.whiteColor : Colors.transparent,
          boxShadow: [
            if (selected)
              BoxShadow(
                color: AppColors.blackColor.withOpacity(0.1),
                blurRadius: 35,
                offset: const Offset(0, 10),
              ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 24,
              height: 24,
              color: selected ? AppColors.purpleColor : AppColors.blackColor,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: AppTheme.blackTextStyle.copyWith(
                fontWeight: AppTheme.bold,
                fontSize: 12,
                color: selected ? AppColors.purpleColor : AppColors.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
