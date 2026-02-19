import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/constatns/app_spacing.dart';
import 'package:wayfit/core/constatns/app_text_sizes.dart';

import 'package:wayfit/core/utils/app_btn.dart';
import 'package:wayfit/core/utils/app_text.dart';
import 'package:wayfit/features/discover/widgets/circle_icon_button.dart';
import 'package:wayfit/features/gym_detail_page/widgets/components.dart';

class ScheduleBookedDetailView extends StatelessWidget {
  const ScheduleBookedDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final String countdown = "2 hours 15 mins";
    final String instructorName = "Alex Rivera";
    final String instructorRole = "Certified WOD Instructor";
    final int filled = 12;
    final int total = 15;

    final topInset = MediaQuery.of(context).padding.top;
    final expanded = 360.0 - topInset;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
            "https://images.unsplash.com/photo-1545205597-3d9d02c29597?w=1400&auto=format&fit=crop&q=60",
            height: expanded,
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
            top: 170,
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
                      child: AppText(
                        title: "WOD",
                        size: AppTextSizes.s14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                AppText(
                  title: "HIIT Bootcamp",
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
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            right: 24,
            child: CircleIconButton(
              icon: "un_fav_ic.svg",
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              backColor: AppColors.blackColor.withOpacity(0.35),
              size: 44,
              onTap: () {},
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 24,
            child: CircleIconButton(
              icon: "back_ic.svg",
              size: 44,
              onTap: () => Get.back(),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 320),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black26,
                        blurRadius: 25,
                        spreadRadius: 0,
                        offset: const Offset(0, -15),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        _checkinCard(countdown: countdown, onShowQr: () {}),
                        const SizedBox(height: 20),
                        infoCard(
                          title: 'Contact & Hours',
                          child: Column(
                            children: [
                              const SizedBox(height: 12),
                              iconRow(
                                icon: "cal_ic",
                                title: 'Date & Time',
                                subtitle: 'Wed, Feb 4, 8:00 PM',
                              ),
                              const SizedBox(height: 12),
                              iconRow(
                                icon: "time_ic",
                                title: 'Duration',
                                subtitle: '50 Min',
                              ),
                              const SizedBox(height: 12),
                              iconRow(
                                icon: "tag_ic",
                                title: 'Credits Used',
                                subtitle: '18 credits',
                              ),
                              const SizedBox(height: 12),
                              iconRow(
                                icon: "time_ic",
                                title: 'Location',
                                subtitle: '789 Athletic Dr, East Side',
                              ),
                              const SizedBox(height: 24),
                              AppBtn(onPressed: () {}, text: "Get Directions"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        infoCard(
                          title: 'Your Instructor',
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(999),
                                    child: CachedNetworkImage(
                                      imageUrl: "",
                                      width: 64,
                                      height: 64,
                                      fit: BoxFit.cover,
                                      placeholder: (_, __) =>
                                          Container(color: AppColors.lightGrey),
                                      errorWidget: (_, __, ___) => Image.asset(
                                        "assets/images/person.png",
                                        fit: BoxFit.cover,
                                        width: 64,
                                        height: 64,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          title: instructorName,
                                          size: AppTextSizes.s18,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.textBlackColor,
                                        ),
                                        const SizedBox(height: 2),
                                        AppText(
                                          title: instructorRole,
                                          size: AppTextSizes.s14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.black62,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: AppBtn(
                                      onPressed: () {},
                                      text: "Call",
                                      height: 48,
                                      icon: SvgPicture.asset(
                                        "assets/icons/call_ic.svg",
                                        height: 16,
                                        width: 16,
                                        colorFilter: ColorFilter.mode(
                                          AppColors.whiteColor,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      fontColor: AppColors.whiteColor,
                                      gradientColor: AppColors.walletGradient,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: AppBtn(
                                      onPressed: () {},
                                      text: "Message",
                                      height: 48,
                                      icon: SvgPicture.asset(
                                        "assets/icons/message_ic.svg",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        infoCard(
                          title: 'What to Bring',
                          child: Column(
                            children: [
                              const SizedBox(height: 12),
                              iconRow(
                                icon: "towel_ic",
                                title: 'Water bottle',
                                subtitle: '',
                                size: AppTextSizes.s16,
                                color: AppColors.darkGrey,
                              ),
                              const SizedBox(height: 14),
                              iconRow(
                                icon: "yoga_ic",
                                title: 'Yoga mat (optional)',
                                size: AppTextSizes.s16,
                                color: AppColors.darkGrey,
                              ),
                              const SizedBox(height: 14),
                              iconRow(
                                icon: "towel_ic",
                                title: 'Towel',
                                size: AppTextSizes.s16,
                                color: AppColors.darkGrey,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        _capacityCard(filled: filled, total: total),
                        const SizedBox(height: 20),
                        _warningCard(
                          title: "Cancellation Policy",
                          text:
                          "Cancel up to 2 hours before class starts for a full credit refund. Late cancellations will not be refunded.",
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: AppBtn(
                                onPressed: () {},
                                text: "Cancel Booking",
                                fontColor: AppColors.darkGrey,
                                bgColor: Colors.white,
                                borderColor: AppColors.searchBorderColor,
                                width: 2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _checkinCard({
    required String countdown,
    required VoidCallback onShowQr,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: AppColors.checkInGradient,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 8),
            blurRadius: 24,
            color: Colors.black.withOpacity(0.08),
          ),
        ],
      ),
      child: Stack(
        children: [
          SvgPicture.asset("assets/icons/vector_checkin.svg"),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            title: "Check-in opens in",
                            size: AppTextSizes.s14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.whiteColor,
                          ),
                          const SizedBox(height: 8),
                          AppText(
                            title: countdown,
                            size: AppTextSizes.s26,
                            fontWeight: FontWeight.w700,
                            color: AppColors.whiteColor,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 72,
                      width: 72,
                      decoration: BoxDecoration(
                        gradient: AppColors.walletGradient,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/icons/time_ic.svg",
                          height: 32,
                          width: 32,
                          colorFilter: ColorFilter.mode(
                            AppColors.whiteColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                AppBtn(
                  onPressed: onShowQr,
                  text: "Show QR Code",
                  icon: SvgPicture.asset("assets/icons/qr_ic.svg"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _capacityCard({required int filled, required int total}) {
    final progress = total == 0 ? 0.0 : (filled / total).clamp(0.0, 1.0);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        gradient: AppColors.capacityGradient,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/group_ic.svg",
                height: 24,
                width: 24,
                colorFilter: ColorFilter.mode(
                  AppColors.purple64,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 12),
              AppText(
                title: "Class Capacity",
                size: AppTextSizes.s20,
                fontWeight: FontWeight.w700,
                color: AppColors.textBlackColor,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppText(
                title: "$filled",
                size: AppTextSizes.s30,
                fontWeight: FontWeight.w700,
                color: AppColors.textBlackColor,
              ),
              const SizedBox(width: 6),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: AppText(
                  title: "/ $total spots filled",
                  size: AppTextSizes.s16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black45,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: Colors.white.withOpacity(0.9),
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.purple64),
            ),
          ),
        ],
      ),
    );
  }

  Widget _warningCard({required String title, required String text}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.expireColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.yellowE5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: AppColors.yellow7B),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title: title,
                  size: AppTextSizes.s18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.yellow7B,
                ),
                const SizedBox(height: 4),
                AppText(
                  title: text,
                  size: AppTextSizes.s13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.yellow7B,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}