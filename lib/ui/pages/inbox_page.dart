import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media_app/app/configs/colors.dart';
import 'package:social_media_app/app/configs/theme.dart';
import 'package:social_media_app/ui/widgets/custom_app_bar.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  int _selectedTabIndex = 0;
  final List<String> _tabs = ['All', 'Unread', 'Archived'];

  // Sample conversations data
  final List<Map<String, dynamic>> _conversations = [
    {
      'id': '1',
      'name': 'Jenny Wilson',
      'avatar':
          'https://images.unsplash.com/photo-1535295972055-1c762f4483e5?auto=format&fit=crop&w=500&q=60',
      'lastMessage': 'Hey! How are you doing today? 😊',
      'time': '2m',
      'unreadCount': 2,
      'isOnline': true,
      'isUnread': true,
    },
    {
      'id': '2',
      'name': 'Jessica Alba',
      'avatar':
          'https://images.unsplash.com/photo-1592573390440-64a8a2349e3f?auto=format&fit=crop&w=500&q=60',
      'lastMessage': 'Thank you for the amazing photos! I love your work.',
      'time': '15m',
      'unreadCount': 0,
      'isOnline': true,
      'isUnread': false,
    },
    {
      'id': '3',
      'name': 'Brooklyn Beckham',
      'avatar':
          'https://images.unsplash.com/photo-1500917293891-ef795e70e1f6?auto=format&fit=crop&w=500&q=60',
      'lastMessage': 'Can we schedule a photoshoot next week?',
      'time': '1h',
      'unreadCount': 1,
      'isOnline': false,
      'isUnread': true,
    },
    {
      'id': '4',
      'name': 'Merry Smith',
      'avatar':
          'https://images.unsplash.com/photo-1544717305-2782549b5136?auto=format&fit=crop&w=500&q=60',
      'lastMessage':
          'The event was amazing! Thanks for capturing those moments.',
      'time': '2h',
      'unreadCount': 0,
      'isOnline': false,
      'isUnread': false,
    },
    {
      'id': '5',
      'name': 'Jennifer Lawrence',
      'avatar':
          'https://images.unsplash.com/photo-1531923610693-c816870f3b44?auto=format&fit=crop&w=500&q=60',
      'lastMessage': 'Looking forward to our collaboration! 🎬',
      'time': '3h',
      'unreadCount': 0,
      'isOnline': true,
      'isUnread': false,
    },
    {
      'id': '6',
      'name': 'Design Team',
      'avatar':
          'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=500&q=60',
      'lastMessage': 'New project updates are ready for review.',
      'time': '1d',
      'unreadCount': 3,
      'isOnline': false,
      'isUnread': true,
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  _buildCustomAppBar(),
                  const SizedBox(height: 24),
                  _buildSearchBar(),
                  const SizedBox(height: 24),
                  _buildTabBar(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            Expanded(child: _buildConversationsList()),
          ],
        ),
      ),
      floatingActionButton: _buildComposeButton(),
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
              'assets/images/ic_inbox.png',
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            "Messages",
            style: AppTheme.blackTextStyle.copyWith(
              fontWeight: AppTheme.bold,
              fontSize: 24,
            ),
          ),
          const Spacer(),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.backgroundColor,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz_rounded,
                color: AppColors.blackColor,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 8),
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
          hintText: 'Search conversations...',
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

  Widget _buildTabBar() {
    return Row(
      children:
          _tabs.map((tab) {
            int index = _tabs.indexOf(tab);
            bool isSelected = _selectedTabIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(right: 24),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color:
                          isSelected
                              ? AppColors.purpleColor
                              : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  tab,
                  style: AppTheme.blackTextStyle.copyWith(
                    color:
                        isSelected
                            ? AppColors.purpleColor
                            : AppColors.greyColor,
                    fontSize: 16,
                    fontWeight: isSelected ? AppTheme.bold : AppTheme.medium,
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }

  Widget _buildConversationsList() {
    List<Map<String, dynamic>> filteredConversations =
        _getFilteredConversations();

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: filteredConversations.length,
      itemBuilder: (context, index) {
        final conversation = filteredConversations[index];
        return _buildConversationItem(conversation);
      },
    );
  }

  List<Map<String, dynamic>> _getFilteredConversations() {
    switch (_selectedTabIndex) {
      case 1: // Unread
        return _conversations
            .where((conv) => conv['isUnread'] == true)
            .toList();
      case 2: // Archived
        return []; // Empty for demo, could have archived conversations
      default: // All
        return _conversations;
    }
  }

  Widget _buildConversationItem(Map<String, dynamic> conversation) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // Handle conversation tap
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color:
                  conversation['isUnread']
                      ? AppColors.purpleColor.withOpacity(0.05)
                      : Colors.transparent,
            ),
            child: Row(
              children: [
                // Avatar with online indicator
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network(
                        conversation['avatar'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            width: 50,
                            height: 50,
                            color: AppColors.backgroundColor,
                            child: const Icon(
                              Icons.person,
                              color: AppColors.greyColor,
                            ),
                          );
                        },
                      ),
                    ),
                    if (conversation['isOnline'])
                      Positioned(
                        bottom: 2,
                        right: 2,
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            color: AppColors.greenColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.whiteColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 12),
                // Conversation details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              conversation['name'],
                              style: AppTheme.blackTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight:
                                    conversation['isUnread']
                                        ? AppTheme.bold
                                        : AppTheme.semiBold,
                              ),
                            ),
                          ),
                          Text(
                            conversation['time'],
                            style: AppTheme.greyTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: AppTheme.medium,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              conversation['lastMessage'],
                              style: AppTheme.greyTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight:
                                    conversation['isUnread']
                                        ? AppTheme.medium
                                        : AppTheme.regular,
                                color:
                                    conversation['isUnread']
                                        ? AppColors.blackColor.withOpacity(0.7)
                                        : AppColors.greyColor,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (conversation['unreadCount'] > 0)
                            Container(
                              margin: const EdgeInsets.only(left: 8),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.purpleColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                conversation['unreadCount'].toString(),
                                style: AppTheme.whiteTextStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: AppTheme.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildComposeButton() {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.purpleColor,
            AppColors.purpleColor.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: AppColors.purpleColor.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed: () {
          // Handle compose new message
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: const Icon(Icons.edit, color: AppColors.whiteColor, size: 24),
      ),
    );
  }
}
