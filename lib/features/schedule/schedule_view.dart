import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/constatns/app_spacing.dart';
import 'package:wayfit/core/constatns/app_text_sizes.dart';

import 'package:wayfit/core/utils/app_text.dart';
import 'package:wayfit/features/schedule/pages/schedule_detail_view.dart';
import 'schedule_controller.dart';

class MyScheduleView extends StatelessWidget {
  const MyScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<ScheduleController>();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              gradient: AppColors.mainBarGradient,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: SizedBox(
              height: 210,
              child: Stack(
                children: [
                  SvgPicture.asset("assets/images/vector.svg"),
                   Positioned(
                    top: 50,
                    left: 24,
                    child: AppText(
                      title: "Schedule",
                      size: AppTextSizes.s18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                  Positioned(
                    bottom: 6,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        const AppText(
                          title: "Available Credits",
                          size: AppTextSizes.s14,
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(height: 8),
                        Obx(() {
                          return AppText(
                            title: "${c.credits.value}",
                            size: AppTextSizes.s44,
                            fontWeight: FontWeight.w600,
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.horizontal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                 AppText(
                  title: "My Schedule",
                  size: AppTextSizes.s20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textBlackColor,
                  letterSpacing: 0.07,
                ),
                const SizedBox(height: 9),
                 AppText(
                  title: "View and manage your booked classes",
                  size: AppTextSizes.s14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black45,
                ),
                const SizedBox(height: 12),
                Obx(() {
                  final tab = c.tab.value;
                  return Row(
                    children: [
                      _segButton(
                        title: "Upcoming",
                        active: tab == ScheduleTab.upcoming,
                        onTap: () => c.setTab(ScheduleTab.upcoming),
                      ),
                      const SizedBox(width: 10),
                      _segButton(
                        title: "Past",
                        active: tab == ScheduleTab.past,
                        onTap: () => c.setTab(ScheduleTab.past),
                      ),
                      const SizedBox(width: 10),
                      _segButton(
                        title: "Cancelled",
                        active: tab == ScheduleTab.cancelled,
                        onTap: () => c.setTab(ScheduleTab.cancelled),
                      ),
                    ],
                  );
                }),
                const SizedBox(height: 12),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              final list = c.currentList;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.horizontal),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 14),
                      if (list.isEmpty)
                         Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Center(
                            child: AppText(
                              title: "No classes found",
                              size: AppTextSizes.s14,
                              color: AppColors.black62,
                            ),
                          ),
                        )
                      else
                        ListView.separated(
                          itemCount: list.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (_, __) => const SizedBox(height: 14),
                          itemBuilder: (_, i) {
                            return const _ClassCard(
                              tag: "Vinyasa",
                              credits: 5,
                              title: "Morning Yoga Flow",
                              studio: "Zen Yoga Studio",
                              time: "8:00 AM",
                              duration: "60 min",
                              instructorName: "Sarah",
                              imageUrl:
                              "https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=1200&auto=format&fit=crop&q=60",
                            );
                          },
                        ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _segButton({
    required String title,
    required bool active,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: active ? AppColors.blackColor : AppColors.greyE8,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: AppText(
          title: title,
          size: AppTextSizes.s14,
          fontWeight: FontWeight.w500,
          color: active ? AppColors.whiteColor : AppColors.black45,
        ),
      ),
    );
  }
}

class _ClassCard extends StatelessWidget {
  const _ClassCard({
    required this.tag,
    required this.credits,
    required this.title,
    required this.studio,
    required this.time,
    required this.duration,
    required this.instructorName,
    required this.imageUrl,
  });

  final String tag;
  final int credits;
  final String title;
  final String studio;
  final String time;
  final String duration;
  final String instructorName;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(const ScheduleBookedDetailView());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 20,
              spreadRadius: 0,
              color: AppColors.black26,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
              child: Stack(
                children: [
                  Image.network(
                    imageUrl,
                    height: 128,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.blackColor.withOpacity(0.6),
                        border: Border.all(
                          color: AppColors.primary.withOpacity(0.6),
                          width: 1.2,
                        ),
                        borderRadius: BorderRadius.circular(1000),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            spreadRadius: 0,
                            color: Color(0x40000000),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                           AppText(
                            title: "12",
                            size: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.whiteColor,
                          ),
                          const SizedBox(width: 6),
                          SvgPicture.asset("assets/icons/reward_green_ic.svg"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                            decoration: BoxDecoration(
                              color: AppColors.purpleDF,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:  AppText(
                              title: "Yoga",
                              size: AppTextSizes.s12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.purple64,
                            ),
                          ),
                          const SizedBox(width: 10),
                           AppText(
                            title: "55 min",
                            size: AppTextSizes.s12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black62,
                          ),
                        ],
                      ),
                      Container(
                        width: 94,
                        height: 32,
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/time_ic.svg",
                              height: 16,
                              width: 16,
                              colorFilter:  ColorFilter.mode(
                                AppColors.green25,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 8),
                             AppText(
                              title: "6 spots",
                              size: AppTextSizes.s12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.darkGrey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  AppText(
                    title: title,
                    size: AppTextSizes.s16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textBlackColor,
                  ),
                  const SizedBox(height: 4),
                  AppText(
                    title: studio,
                    size: AppTextSizes.s12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black62,
                  ),
                  const SizedBox(height: 12),
                  Container(height: 1, color: Colors.grey.shade100),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(999),
                        child: CachedNetworkImage(
                          imageUrl: "",
                          width: 32,
                          height: 32,
                          fit: BoxFit.cover,
                          placeholder: (_, __) => Container(color: Colors.black12),
                          errorWidget: (_, __, ___) => Image.asset(
                            "assets/images/person.png",
                            width: 32,
                            height: 32,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              title: instructorName,
                              size: AppTextSizes.s12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.darkGrey,
                            ),
                             AppText(
                              title: "Instructor",
                              size: AppTextSizes.s10,
                              fontWeight: FontWeight.w400,
                              color: AppColors.unselectColor,
                            ),
                          ],
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/icons/next_gradient_icon.svg",
                        height: 32,
                        width: 32,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}