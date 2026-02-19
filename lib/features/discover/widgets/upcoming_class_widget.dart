import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/constatns/app_text_sizes.dart';
import 'package:wayfit/core/utils/app_text.dart';

class UpcomingClassItem {
  final String title;
  final String time;
  final String studio;
  final String dayTag;
  final String imageUrl;
  final Color bg;

  UpcomingClassItem({
    required this.title,
    required this.time,
    required this.studio,
    required this.dayTag,
    required this.imageUrl,
    required this.bg,
  });
}

final List<UpcomingClassItem> upcoming = [
  UpcomingClassItem(
    title: "Yoga & Mindfulness",
    time: "8:00 AM",
    studio: "ZenFit Studio",
    dayTag: "Today",
    imageUrl:
        "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=900&auto=format&fit=crop&q=60",
    bg: AppColors.green9F,
  ),
  UpcomingClassItem(
    title: "Cardio Burn",
    time: "6:00 PM",
    studio: "PowerFlex Gym",
    dayTag: "Tomorrow",
    imageUrl:
        "https://images.unsplash.com/photo-1517960413843-0aee8e2b3285?w=900&auto=format&fit=crop&q=60",
    bg: AppColors.purpleE9,
  ),
  UpcomingClassItem(
    title: "Yoga Flow",
    time: "5:30 PM",
    studio: "IronFit",
    dayTag: "Fri",
    imageUrl:
        "https://images.unsplash.com/photo-1506126613408-eca07ce68773?w=900&auto=format&fit=crop&q=60",
    bg: AppColors.expireColor,
  ),
];

class UpcomingClassItemCard extends StatelessWidget {
  const UpcomingClassItemCard({super.key, required this.item});

  final UpcomingClassItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      width: 180,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: 180,
              height: 220,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              decoration: BoxDecoration(
                color: item.bg,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 98),
                  AppText(
                    title: item.title,
                    size: AppTextSizes.s13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textBlackColor,
                  ),
                  const SizedBox(height: 2),
                  AppText(
                    title: item.time,
                    size: AppTextSizes.s12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black45,
                  ),
                  const SizedBox(height: 2),
                  AppText(
                    title: item.studio,
                    size: AppTextSizes.s12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black62,
                  ),
                  const Spacer(),
                  _DayPill(text: item.dayTag),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: -2,
            child: SizedBox(
              height: 130,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    "assets/images/dummy1.png",
                    height: 120,
                    width: 122,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.2773, 0.4659, 1.0],
                          colors: [
                            item.bg.withOpacity(0.0),
                            item.bg.withOpacity(0.3),
                            item.bg,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DayPill extends StatelessWidget {
  const _DayPill({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(999),
      ),
      child: AppText(
        title: text,
        size: AppTextSizes.s12,
        fontWeight: FontWeight.w700,
        color: AppColors.black45,
      ),
    );
  }
}
