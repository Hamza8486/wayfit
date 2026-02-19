import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/constatns/app_spacing.dart';

import 'package:wayfit/core/utils/app_btn.dart';
import 'package:wayfit/core/utils/app_text.dart';
import 'package:wayfit/core/utils/main_app_bar.dart';
import 'package:wayfit/features/class_detail_page/paages/time_slot_sheet.dart';
import 'package:wayfit/features/confirm_booking/booking_sucess.dart';
import 'package:wayfit/features/gym_detail_page/widgets/components.dart';

class ConfirmBooking extends StatelessWidget {
  const ConfirmBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBarWidget(
        title: "Confirm Booking",
        showDivider: true,
        horizontalPadding: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.horizontal,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(21),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.purpleD8),
                        gradient: AppColors.confirmBookCardGradient,
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=1200&auto=format&fit=crop&q=60",
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              placeholder: (_, __) => Container(
                                width: 68,
                                height: 68,
                                color: const Color(0xFFEFF4FF),
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  title: "Morning Yoga Flow",
                                  size: 18,
                                  letterSpacing: -0.44,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textBlackColor,
                                ),
                                const SizedBox(height: 4),
                                AppText(
                                  title: "Zen Yoga Studio",
                                  size: 14,
                                  color: AppColors.black45,
                                ),
                                const SizedBox(height: 3),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/time_ic.svg",
                                      color: AppColors.black45,
                                    ),
                                    const SizedBox(width: 8),
                                    AppText(
                                      title: "Today, 8:00 AM",
                                      size: 12,
                                      color: AppColors.black45,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(21),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 20,
                            spreadRadius: 0,
                            color: AppColors.black26,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                title: "Available Sessions",
                                size: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                              GestureDetector(
                                onTap: () => showTimeSlotBottomSheet(context),
                                child: Container(
                                  height: 32,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: const Color(0xffA0CDB7),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      AppText(
                                        title: "February",
                                        size: 12,
                                        color: AppColors.green25,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      const SizedBox(width: 4),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: AppColors.green25,
                                        size: 18,
                                      ),
                                    ],
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
                              itemCount: 2,
                              clipBehavior: Clip.none,
                              padding: EdgeInsets.zero,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(width: 10),
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
                          SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppColors.purpleD8),
                              color: AppColors.purpleEC,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 13,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          title: "1 session selected",
                                          size: 12,
                                          color: AppColors.black45,
                                        ),
                                        SizedBox(height: 4),
                                        AppText(
                                          title: "12 credits",
                                          size: 14,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.black45,
                                        ),
                                      ],
                                    ),
                                  ),
                                  AppText(
                                    title: "Clear all",
                                    size: 12,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    color: AppColors.black45,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        color: AppColors.black31,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 11,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/confirm_fill.svg"),
                            SizedBox(width: 11),
                            AppText(
                              title: "Selected Sessions (1)",
                              size: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.whiteColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.searchBorderColor,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 56,
                              height: 88,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppText(
                                    title: "Tue",
                                    size: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(height: 3),
                                  AppText(
                                    title: "3",
                                    size: 24,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(height: 4),
                                  AppText(
                                    title: "Feb",
                                    size: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        size: 18,
                                        color: AppColors.green25,
                                      ),
                                      const SizedBox(width: 8),
                                      AppText(
                                        title: "Feb",
                                        size: 14,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.textBlackColor,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/group_ic.svg",
                                        color: AppColors.green25,
                                      ),
                                      const SizedBox(width: 8),
                                      AppText(
                                        title: "8",
                                        size: 14,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.textBlackColor,
                                      ),
                                      const SizedBox(width: 10),
                                      AppText(
                                        title: "spots available",
                                        size: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black45,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  behavior: HitTestBehavior.opaque,
                                  child: const Padding(
                                    padding: EdgeInsets.all(6),
                                    child: Icon(
                                      Icons.close,
                                      size: 26,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 24),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.blackColor.withOpacity(
                                      0.6,
                                    ),
                                    borderRadius: BorderRadius.circular(1000),
                                  ),
                                  child: Row(
                                    children: [
                                      AppText(
                                        title: "12",
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
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(21),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.whiteColor,
                        border: Border.all(color: AppColors.searchBorderColor),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 20,
                            spreadRadius: 0,
                            color: AppColors.black26,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            title: "Credit Summary",
                            size: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkGrey,
                          ),
                          const SizedBox(height: 16),
                          _RowText(
                            left: "Current Balance",
                            right: "12 credits",
                            rightColor: AppColors.textBlackColor,
                            boldRight: false,
                          ),
                          const SizedBox(height: 12),
                          _RowText(
                            left: "Class Cost",
                            right: "-76 credits",
                            rightColor: AppColors.redFE,
                            boldRight: false,
                          ),
                          const SizedBox(height: 16),
                          Container(
                            height: 1,
                            color: AppColors.searchBorderColor,
                          ),
                          const SizedBox(height: 10),
                          _RowText(
                            left: "New Balance",
                            right: "44 credits",
                            rightColor: AppColors.primary,
                            boldLeft: true,
                            boldRight: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 20,
                  spreadRadius: 0,
                  color: AppColors.black26,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: AppBtn(
                text: "Confirm Booking",
                onPressed: () {
                  showSuccessBookingBottomSheet(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RowText extends StatelessWidget {
  const _RowText({
    required this.left,
    required this.right,
    required this.rightColor,
    this.boldLeft = false,
    this.boldRight = false,
  });

  final String left;
  final String right;
  final Color rightColor;
  final bool boldLeft;
  final bool boldRight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppText(
            title: left,
            size: 16,
            fontWeight: boldLeft ? FontWeight.w600 : FontWeight.w400,
            color: boldLeft ? AppColors.darkGrey : AppColors.black45,
          ),
        ),
        AppText(
          title: right,
          size: 16,
          fontWeight: boldRight ? FontWeight.w600 : FontWeight.w400,
          color: rightColor,
        ),
      ],
    );
  }
}
