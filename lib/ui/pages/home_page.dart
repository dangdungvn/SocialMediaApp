import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/app/configs/colors.dart';
import 'package:social_media_app/app/configs/theme.dart';
import 'package:social_media_app/ui/bloc/post_cubit.dart';
import 'package:social_media_app/ui/widgets/card_post.dart';

import '../widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Column(
            children: [
              const SizedBox(height: 12),
              _buildCustomAppBar(context),
              const SizedBox(height: 18),
              BlocProvider(
                create: (context) => PostCubit()..getPosts(),
                child: BlocBuilder<PostCubit, PostState>(
                  builder: (context, state) {
                    if (state is PostError) {
                      return Center(child: Text(state.message));
                    } else if (state is PostLoaded) {
                      return Column(
                        children:
                            state.posts
                                .map(
                                  (post) => GestureDetector(
                                    child: CardPost(post: post),
                                  ),
                                )
                                .toList(),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  CustomAppBar _buildCustomAppBar(BuildContext context) {
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
              'assets/images/ic_logo.png',
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(width: 12),
          Image.asset(
            "assets/images/ic_notification.png",
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 12),
          Image.asset("assets/images/ic_search.png", width: 24, height: 24),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: AppColors.backgroundColor,
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.whiteColor, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blackColor.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 10),
                      ),
                    ],
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/img_profile.jpeg"),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  "Sajon.co",
                  style: AppTheme.blackTextStyle.copyWith(
                    fontWeight: AppTheme.bold,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 2),
                Image.asset("assets/images/ic_checklist.png", width: 16),
                const SizedBox(width: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
