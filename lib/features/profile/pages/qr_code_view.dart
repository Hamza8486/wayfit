import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/constatns/app_spacing.dart';
import 'package:wayfit/core/constatns/app_text_sizes.dart';

import 'package:wayfit/core/utils/app_text.dart';

class QrCodesView extends StatelessWidget {
  const QrCodesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          const _Header(),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.horizontal,
                18,
                AppSpacing.horizontal,
                24,
              ),
              itemCount: _demo.length,
              separatorBuilder: (_, __) => const SizedBox(height: 18),
              itemBuilder: (_, i) {
                final d = _demo[i];
                return _QrCard(
                  imageUrl: d.imageUrl,
                  title: d.title,
                  studio: d.studio,
                  time: d.time,
                  duration: d.duration,
                  qrData: d.qrData,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.only(
        top: topInset + 13,
        left: AppSpacing.horizontal,
        right: AppSpacing.horizontal,
        bottom: 14,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 15,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.10),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () => Get.back(),
        child: Container(
          color: Colors.transparent,
          child: Row(
            children: [
              SvgPicture.asset("assets/icons/back_ic.svg"),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      title: "Your QR Codes",
                      size: AppTextSizes.s18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textBlackColor,
                    ),
                    const SizedBox(height: 5),
                    AppText(
                      title: "Scan to check-in",
                      size: AppTextSizes.s14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black45,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QrCard extends StatelessWidget {
  const _QrCard({
    required this.imageUrl,
    required this.title,
    required this.studio,
    required this.time,
    required this.duration,
    required this.qrData,
  });

  final String imageUrl;
  final String title;
  final String studio;
  final String time;
  final String duration;
  final String qrData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
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
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                    placeholder: (_, __) => Container(
                      width: 90,
                      height: 90,
                      color: AppColors.lightGrey,
                    ),
                    errorWidget: (_, __, ___) => Container(
                      width: 90,
                      height: 90,
                      color: AppColors.lightGrey,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        title: title,
                        size: AppTextSizes.s18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textBlackColor,
                      ),
                      const SizedBox(height: 5),
                      _InfoRow(icon: "pin_ic", text: studio),
                      const SizedBox(height: 5),
                      _InfoRow(
                        icon: "time_ic",
                        text: "$time \n$duration",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(height: 1, color: AppColors.lightGrey),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
            child: Column(
              children: [
                _QrBox(data: qrData),
                const SizedBox(height: 34),
                AppText(
                  title: "Present this QR code at check-in",
                  size: AppTextSizes.s12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.unselectColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.text});

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/$icon.svg",
          height: 18,
          width: 18,
          colorFilter: ColorFilter.mode(AppColors.green25, BlendMode.srcIn),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: AppText(
            title: text,
            size: AppTextSizes.s14,
            fontWeight: FontWeight.w400,
            color: AppColors.black45,
          ),
        ),
      ],
    );
  }
}

class _QrBox extends StatelessWidget {
  const _QrBox({required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(9),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 24,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.10),
          ),
        ],
      ),
      child: QrImageView(
        data: data,
        version: QrVersions.auto,
        size: 180,
        gapless: true,
        backgroundColor: Colors.white,
      ),
    );
  }
}

class _QrDemo {
  final String title;
  final String studio;
  final String time;
  final String duration;
  final String imageUrl;
  final String qrData;

  const _QrDemo({
    required this.title,
    required this.studio,
    required this.time,
    required this.duration,
    required this.imageUrl,
    required this.qrData,
  });
}

const _demo = <_QrDemo>[
  _QrDemo(
    title: "Morning Yoga Flow",
    studio: "Zen Yoga Studio",
    time: "8:00 AM",
    duration: "60 min",
    imageUrl:
    "https://images.unsplash.com/photo-1517836357463-d25dfeac3438?w=900&auto=format&fit=crop&q=60",
    qrData: "booking_id=YOGA_001&user=william",
  ),
  _QrDemo(
    title: "HIIT Bootcamp",
    studio: "CrossFit Central",
    time: "8:00 AM",
    duration: "60 min",
    imageUrl:
    "https://images.unsplash.com/photo-1517836357463-d25dfeac3438?w=900&auto=format&fit=crop&q=60",
    qrData: "booking_id=HIIT_002&user=william",
  ),
  _QrDemo(
    title: "Pilates Core",
    studio: "Serenity Yoga",
    time: "8:00 AM",
    duration: "60 min",
    imageUrl:
    "https://images.unsplash.com/photo-1517836357463-d25dfeac3438?w=900&auto=format&fit=crop&q=60",
    qrData: "booking_id=PILATES_003&user=william",
  ),
];