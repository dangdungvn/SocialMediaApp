import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media_app/app/configs/colors.dart';
import 'package:social_media_app/app/configs/theme.dart';
import 'package:social_media_app/ui/widgets/custom_app_bar.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  int _selectedCategoryIndex = 0;
  final List<String> _categories = [
    'All',
    'Fashion',
    'Travel',
    'Food',
    'Tech',
    'Art',
  ];
  final List<String> _trendingHashtags = [
    '#fashion',
    '#style',
    '#travel',
    '#food',
    '#nature',
    '#tech',
  ];

  // Sample discover data
  final List<Map<String, dynamic>> _discoverItems = [
    {
      'image':
          'https://images.unsplash.com/photo-1614265591944-4350bf840a43?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      'title': 'Summer Fashion Trends',
      'author': 'Jenny Wilson',
      'likes': '2.1k',
      'category': 'Fashion',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1648111145086-38ee938cfa9b?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      'title': 'Modern Interior Design',
      'author': 'Jessica Alba',
      'likes': '1.8k',
      'category': 'Art',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1517530094915-500495b15ade?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      'title': 'Tech Innovation',
      'author': 'Brooklyn Beckham',
      'likes': '3.2k',
      'category': 'Tech',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1535295972055-1c762f4483e5?auto=format&fit=crop&w=500&q=60',
      'title': 'Travel Adventures',
      'author': 'Merry Smith',
      'likes': '4.5k',
      'category': 'Travel',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1544717305-2782549b5136?auto=format&fit=crop&w=500&q=60',
      'title': 'Delicious Recipes',
      'author': 'Chef Wilson',
      'likes': '2.7k',
      'category': 'Food',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1531923610693-c816870f3b44?auto=format&fit=crop&w=500&q=60',
      'title': 'Nature Photography',
      'author': 'Photo Master',
      'likes': '5.1k',
      'category': 'Art',
    },
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            child: Column(
              children: [
                const SizedBox(height: 12),
                _buildCustomAppBar(),
                const SizedBox(height: 24),
                _buildSearchBar(),
                const SizedBox(height: 24),
                _buildTrendingHashtags(),
                const SizedBox(height: 24),
                _buildCategoryTabs(),
                const SizedBox(height: 24),
                _buildDiscoverGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomAppBar() {
    return CustomAppBar(
      child: Row(
        children: [
          const SizedBox(width: 8),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackColor.withOpacity(0.2),
                  blurRadius: 35,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Image.asset(
              'assets/images/ic_discorvery.png',
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            "Discover",
            style: AppTheme.blackTextStyle.copyWith(
              fontWeight: AppTheme.bold,
              fontSize: 24,
            ),
          ),
          const Spacer(),
          Image.asset(
            "assets/images/ic_notification.png",
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for anything...',
          hintStyle: AppTheme.greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: AppTheme.medium,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.greyColor,
            size: 24,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
        ),
      ),
    );
  }

  Widget _buildTrendingHashtags() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Trending",
              style: AppTheme.blackTextStyle.copyWith(
                fontWeight: AppTheme.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.greenColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "HOT",
                style: AppTheme.whiteTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: AppTheme.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _trendingHashtags.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.purpleColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.purpleColor.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Text(
                  _trendingHashtags[index],
                  style: AppTheme.blackTextStyle.copyWith(
                    color: AppColors.purpleColor,
                    fontSize: 14,
                    fontWeight: AppTheme.medium,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryTabs() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          bool isSelected = _selectedCategoryIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategoryIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.purpleColor : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color:
                      isSelected
                          ? AppColors.purpleColor
                          : AppColors.greyColor.withOpacity(0.3),
                  width: 1.5,
                ),
              ),
              child: Text(
                _categories[index],
                style: AppTheme.blackTextStyle.copyWith(
                  color:
                      isSelected ? AppColors.whiteColor : AppColors.greyColor,
                  fontSize: 14,
                  fontWeight: AppTheme.medium,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDiscoverGrid() {
    List<Map<String, dynamic>> filteredItems =
        _selectedCategoryIndex == 0
            ? _discoverItems
            : _discoverItems
                .where(
                  (item) =>
                      item['category'] == _categories[_selectedCategoryIndex],
                )
                .toList();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        final item = filteredItems[index];
        return _buildDiscoverCard(item);
      },
    );
  }

  Widget _buildDiscoverCard(Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            // Image
            Image.network(
              item['image'],
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  color: AppColors.backgroundColor,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.purpleColor,
                      strokeWidth: 2,
                    ),
                  ),
                );
              },
            ),
            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
            // Content
            Positioned(
              bottom: 12,
              left: 12,
              right: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'],
                    style: AppTheme.whiteTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: AppTheme.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        item['author'],
                        style: AppTheme.whiteTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: AppTheme.medium,
                          color: AppColors.whiteColor.withOpacity(0.8),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.favorite,
                        color: AppColors.whiteColor,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        item['likes'],
                        style: AppTheme.whiteTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: AppTheme.medium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Category badge
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  item['category'],
                  style: AppTheme.blackTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: AppTheme.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
