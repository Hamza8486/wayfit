import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/constatns/app_spacing.dart';

import 'package:wayfit/core/utils/app_btn.dart';
import 'package:wayfit/core/utils/app_text.dart';
import 'package:wayfit/features/class_detail_page/paages/time_slot_sheet.dart';
import 'package:wayfit/features/confirm_booking/confirm_booking.dart';
import 'package:wayfit/features/discover/widgets/circle_icon_button.dart';
import 'package:wayfit/features/gym_detail_page/widgets/components.dart';

class ClassDetailPage extends StatelessWidget {
  const ClassDetailPage({super.key});

  final bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.horizontal,
          vertical: 16,
        ),
        child: AppBtn(
          onPressed: () {
            Get.to(ConfirmBooking());
          },
          text: "Book for 12 credits",
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            stretch: true,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            elevation: 0,
            expandedHeight: 280,
            leadingWidth: 44 + AppSpacing.horizontal,
            automaticallyImplyLeading: false,
            leading: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: AppSpacing.horizontal),
                  child: CircleIconButton(
                    icon: "back_ic.svg",
                    size: 44,
                    onTap: () => Get.back(),
                  ),
                ),
              ],
            ),
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    height: 310,
                    imageUrl:
                        "https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=1200&auto=format&fit=crop&q=60",
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) =>
                        Container(color: AppColors.lightGrey),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 9,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.blackColor.withOpacity(0.6),
                                border: Border.all(
                                  color: AppColors.primary.withOpacity(0.6),
                                ),
                                borderRadius: BorderRadius.circular(1000),
                              ),
                              child: Row(
                                children: [
                                  AppText(
                                    title: "Starts from",
                                    size: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.whiteColor,
                                  ),
                                  SizedBox(width: 6),
                                  SvgPicture.asset(
                                    "assets/icons/reward_green_ic.svg",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        AppText(
                          title: "Morning Yoga Flow",
                          size: 30,
                          letterSpacing: -0.44,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/pin_ic.svg",
                              height: 16,
                              width: 16,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 5),
                            AppText(
                              title: "Zen Yoga Studio",
                              size: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              letterSpacing: -0.15,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/time_ic.svg",
                              height: 16,
                              width: 16,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 5),
                            AppText(
                              title: "60 min",
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
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.horizontal),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        title: "Available Sessions",
                        size: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      GestureDetector(
                        onTap: () {
                          showTimeSlotBottomSheet(context);
                        },
                        child: Container(
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xffA0CDB7)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                AppText(
                                  title: "February",
                                  size: 12,
                                  color: AppColors.green25,
                                  fontWeight: FontWeight.w600,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.green25,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 131,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      clipBehavior: Clip.none,
                      padding: EdgeInsets.zero,
                      separatorBuilder: (_, __) => const SizedBox(width: 10),
                      itemBuilder: (_, i) {
                        final active = i == 1;
                        return sessionDayCard(
                          day: [
                            "Sun",
                            "Mon",
                            "Tue",
                            "Wed",
                            "Thu",
                            "Fri",
                            "Sat",
                          ][i],
                          date: (i + 2).toString(),
                          month: "Feb",
                          slots: active
                              ? "9 Slots Available"
                              : "6 Slots Available",
                          active: active,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 22),
                  infoCard(
                    title: 'About',
                    child: AppText(
                      title:
                          'High-intensity CrossFit training with certified coaches. Build strength, endurance, and community in our supportive environment.',
                      size: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black45,
                      letterSpacing: -0.15,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: AppSpacing.vertical),
                  infoCard(
                    title: 'Your instructor',
                    child: Column(
                      children: [
                        SizedBox(height: 12),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CachedNetworkImage(
                              imageUrl: "",
                              width: 64,
                              height: 64,
                              fit: BoxFit.cover,
                              placeholder: (_, __) =>
                                  Container(color: Colors.black),
                              errorWidget: (_, __, ___) => Image.asset(
                                "assets/images/person.png",
                                fit: BoxFit.cover,
                                width: 64,
                                height: 64,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    title: "Sarah Johnson",
                                    size: 18,
                                    letterSpacing: -0.44,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textBlackColor,
                                  ),
                                  SizedBox(height: 4),
                                  AppText(
                                    title:
                                        "Sarah has been teaching yoga for over 8 years and specializes in vinyasa and restorative practices. Her classes blend mindfulness with physical challenge.",
                                    size: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black45,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSpacing.vertical),
                  infoCard(
                    title: 'What to expect',
                    child: Column(
                      children: [
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              height: 6,
                              width: 6,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.green25,
                              ),
                            ),
                            SizedBox(width: 12),
                            AppText(
                              title: "10-minute warm-up and centering",
                              size: 14,
                              color: AppColors.black45,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              height: 6,
                              width: 6,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.green25,
                              ),
                            ),
                            SizedBox(width: 12),
                            AppText(
                              title: "40-minute dynamic flow sequence",
                              size: 14,
                              color: AppColors.black45,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              height: 6,
                              width: 6,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.green25,
                              ),
                            ),
                            SizedBox(width: 12),
                            AppText(
                              title: "10-minute cool-down and savasana",
                              size: 14,
                              color: AppColors.black45,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSpacing.vertical),
                  infoCard(
                    title: 'What to bring',
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          chipPill(text: 'CrossFit Equipment'),
                          chipPill(text: 'Olympic Lifting Platform'),
                          chipPill(text: 'Open Gym'),
                          chipPill(text: 'Showers'),
                          chipPill(text: 'Free Parking'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  infoCard(
                    title: 'Class details',
                    child: Column(
                      children: [
                        SizedBox(height: 12),
                        iconRow(
                          icon: "pin_ic",
                          title: 'Location',
                          subtitle: '123 Fitness Ave, Downtown',
                        ),
                        SizedBox(height: 12),
                        iconRow(
                          icon: "tag_ic",
                          title: 'Prerequisites',
                          subtitle: 'Basic yoga experience recommended',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
