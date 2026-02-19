import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/constatns/app_spacing.dart';
import 'package:wayfit/core/utils/app_text.dart';
import 'package:wayfit/features/discover/discover_controller.dart';
import 'package:wayfit/features/discover/widgets/circle_icon_button.dart';
import 'package:wayfit/features/discover/widgets/dont_miss_card.dart';
import 'package:wayfit/features/discover/widgets/dot_indicator.dart';
import 'package:wayfit/features/discover/widgets/filter_row_data.dart';
import 'package:wayfit/features/discover/widgets/header_discover.dart';
import 'package:wayfit/features/discover/widgets/popular_gym_card.dart';
import 'package:wayfit/features/discover/widgets/upcoming_class_card.dart';
import 'package:wayfit/features/discover/widgets/upcoming_class_widget.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DiscoverController>(
      builder: (c) {
        return Scaffold(
          body: Column(
            children: [
              headerTopBarData(context: context),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      SizedBox(
                        height: 102,
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSpacing.horizontal,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, i) => SizedBox(
                            width: 75,
                            height: 102,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    color: AppColors.green9F,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                    "assets/icons/cardio.svg",
                                    width: 34,
                                    height: 34,
                                  ),
                                ),
                                const SizedBox(height: 7),
                                const AppText(
                                  title: "Cardio",
                                  size: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 18),
                          itemCount: 5,
                        ),
                      ),
                      const SizedBox(height: 25),
                      SectionHeader(
                        title: "Your upcoming classes",
                        onSeeAll: () {},
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 240,
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.horizontal,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: upcoming.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 15),
                          itemBuilder: (_, i) =>
                              UpcomingClassItemCard(item: upcoming[i]),
                        ),
                      ),
                      const SizedBox(height: 25),
                      SectionHeader(
                        title: "Popular classes near you",
                        onSeeAll: () {},
                      ),
                      const SizedBox(height: 10),
                      FilterChipsRow(
                        chips: const [
                          'All',
                          'Yoga',
                          'Strength',
                          'HIIT',
                          'Cardio',
                        ],
                        initialSelected: 0,
                        backColor: AppColors.blackColor,
                        onChanged: (i) {},
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 303,
                        child: ListView.separated(
                          clipBehavior: Clip.none,
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.horizontal,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, i) => DontMissCard(),
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 14),
                          itemCount: 5,
                        ),
                      ),
                      const SizedBox(height: 25),
                      SectionHeader(title: "Featured Classes", onSeeAll: () {}),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 192,
                        width: Get.width,
                        child: PageView.builder(
                          controller: c.controllerPage,
                          itemCount: c.imageUrls.length,
                          onPageChanged: c.onPageChanged,
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSpacing.horizontal,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: Image.asset(
                                        c.imageUrls[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      left: 18,
                                      bottom: 18,
                                      child: GetBuilder<DiscoverController>(
                                        id: DiscoverController.dotsId,
                                        builder: (d) => DotsIndicator(
                                          count: d.imageUrls.length,
                                          activeIndex: d.currentIndex,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 25),
                      SectionHeader(
                        title: 'Popular gyms near you',
                        onSeeAll: () {},
                      ),
                      const SizedBox(height: 10),
                      FilterChipsRow(
                        chips: const [
                          'All',
                          'Yoga',
                          'Strength',
                          'HIIT',
                          'Cardio',
                        ],
                        initialSelected: 0,
                        backColor: AppColors.blackColor,
                        onChanged: (i) {},
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: AppSpacing.horizontal,
                          right: AppSpacing.horizontal,
                          top: 12,
                        ),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 6,
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 194 / 198,
                              ),
                          itemBuilder: (_, index) {
                            return popularCardGym(
                              width: 194,
                              height: 198,
                              textSize: 12,
                              isSmallCard: true,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
