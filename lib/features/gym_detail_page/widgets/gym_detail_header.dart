import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/constatns/app_spacing.dart';
import 'package:wayfit/core/utils/app_text.dart';
import 'package:wayfit/features/gym_detail_page/gym_detail_controller.dart';

Widget gymDetailHeader(BuildContext context, {bool isClass = false}) {
  return Stack(
    fit: StackFit.expand,
    children: [
      CachedNetworkImage(
        height: 304,
        imageUrl:
            "https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=1200&auto=format&fit=crop&q=60",
        fit: BoxFit.cover,
        errorWidget: (_, __, ___) => Container(color: AppColors.lightGrey),
      ),
      Positioned.fill(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.10),
                Colors.black.withOpacity(0.65),
              ],
            ),
          ),
        ),
      ),
      Positioned(
        left: AppSpacing.horizontal,
        right: AppSpacing.horizontal,
        bottom: 20,
        child: isClass
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(1000),
                        ),
                        child: AppText(
                          title: "Strength",
                          size: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkGrey,
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(1000),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/rating_ic.svg"),
                            SizedBox(width: 6),
                            AppText(
                              title: "4.8",
                              size: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.darkGrey,
                            ),
                          ],
                        ),
                      ),
                      isClass == false
                          ? SizedBox.shrink()
                          : Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.yellowFE,
                                  border: Border.all(color: AppColors.yellowFF),
                                  borderRadius: BorderRadius.circular(1000),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset("assets/icons/tag_ic.svg"),
                                    SizedBox(width: 6),
                                    AppText(
                                      title: "12 credits",
                                      size: 12,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.darkGrey,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  AppText(
                    title: isClass ? "Morning Yoga Flow" : "PowerHouse Gym",
                    size: 30,
                    letterSpacing: -0.44,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  isClass == false
                      ? SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/pin_ic.svg",
                                color: Colors.white,
                              ),
                              const SizedBox(width: 6),
                              AppText(
                                title: "Zen Yoga Studio",
                                size: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                letterSpacing: -0.15,
                              ),
                            ],
                          ),
                        ),
                  const SizedBox(height: 8),
                  isClass == false
                      ? Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/pin_ic.svg",
                              color: Colors.white,
                            ),
                            const SizedBox(width: 6),
                            AppText(
                              title: "1.2 miles",
                              size: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: -0.15,
                            ),
                            const SizedBox(width: 16),
                            SvgPicture.asset(
                              "assets/icons/group_ic.svg",
                              color: Colors.white,
                            ),
                            const SizedBox(width: 6),
                            AppText(
                              title: "189 members",
                              size: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: -0.15,
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/cal_ic.svg",
                              color: Colors.white,
                            ),
                            const SizedBox(width: 5),
                            AppText(
                              title: "Today, 8:00 AM",
                              size: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: -0.15,
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.black62,
                              ),
                            ),
                            const SizedBox(width: 10),
                            SvgPicture.asset(
                              "assets/icons/time_ic.svg",
                              color: Colors.white,
                            ),
                            const SizedBox(width: 5),
                            AppText(
                              title: "60 min",
                              size: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: -0.15,
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.black62,
                              ),
                            ),
                            const SizedBox(width: 10),
                            SvgPicture.asset(
                              "assets/icons/group_ic.svg",
                              color: Colors.white,
                            ),
                            const SizedBox(width: 5),
                            AppText(
                              title: "5 spots left",
                              size: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: -0.15,
                            ),
                          ],
                        ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(1000),
                    ),
                    child: AppText(
                      title: "Strength",
                      size: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkGrey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  AppText(
                    title: "Zen Yoga Studio",
                    size: 30,
                    letterSpacing: -0.44,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      AppText(
                        title: "Vinyasa",
                        size: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: -0.15,
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 3.5,
                        width: 3.5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      AppText(
                        title: "Hatha",
                        size: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: -0.15,
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 3.5,
                        width: 3.5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      AppText(
                        title: "Yin",
                        size: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: -0.15,
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 3.5,
                        width: 3.5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      AppText(
                        title: "Restorative",
                        size: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: -0.15,
                      ),
                    ],
                  ),
                ],
              ),
      ),
    ],
  );
}

class GymDetailTabsHeader extends SliverPersistentHeaderDelegate {
  GymDetailTabsHeader({
    required this.controller,
    required this.tabs,
    required this.height,
  });

  final GymDetailsController controller;
  final List<String> tabs;
  final double height;

  double get _topSafe => controller.safeTopInset;

  @override
  double get minExtent => height + _topSafe;

  @override
  double get maxExtent => height + _topSafe;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: AppColors.whiteColor,
      child: Column(
        children: [
          SizedBox(height: 20),
          SizedBox(
            height: height,
            child: Obx(() {
              final active = controller.selectedTab.value;
              return LayoutBuilder(
                builder: (context, constraints) {
                  final tabW = constraints.maxWidth / tabs.length;
                  return Stack(
                    children: [
                      Row(
                        children: List.generate(tabs.length, (i) {
                          final isActive = i == active;
                          return Expanded(
                            child: InkWell(
                              onTap: () => controller.onTabTap(i),
                              child: Container(
                                height: double.infinity,
                                alignment: Alignment.center,
                                child: AppText(
                                  title: tabs[i],
                                  size: 14,
                                  fontWeight: isActive
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                  color: isActive
                                      ? AppColors.green25
                                      : AppColors.black45,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(height: 1, color: AppColors.greyD9),
                      ),
                      Positioned(
                        left: tabW * active,
                        bottom: 0,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 220),
                          curve: Curves.easeOut,
                          width: tabW,
                          height: 3,
                          decoration: BoxDecoration(
                            color: AppColors.green25,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }),
          ),
          if (overlapsContent)
            Container(
              height: 10,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black.withOpacity(0.06), Colors.transparent],
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant GymDetailTabsHeader oldDelegate) {
    return oldDelegate.tabs != tabs ||
        oldDelegate.height != height ||
        oldDelegate.controller != controller;
  }
}
