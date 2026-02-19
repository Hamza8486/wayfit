import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/constatns/app_text_sizes.dart';

import 'package:wayfit/core/utils/app_text.dart';

Widget infoCard({
  String title = "",
  Color? backColor,
  Color? borderColor,
  Widget? child,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(21),
    decoration: BoxDecoration(
      color: backColor ?? AppColors.whiteColor,
      border: borderColor == null
          ? null
          : Border.all(color: borderColor, width: 1),
      borderRadius: BorderRadius.circular(16),
      boxShadow: borderColor != null
          ? null
          : [
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
          title: title,
          size: AppTextSizes.s20,
          letterSpacing: -0.44,
          fontWeight: FontWeight.w700,
          color: AppColors.textBlackColor,
        ),
        const SizedBox(height: 16),
        child ?? SizedBox.shrink(),
      ],
    ),
  );
}

Widget iconRow({
  String icon = "",
  String title = "",
  String subtitle = "",
  double? size,
  Color? color,
  bool isLink = false,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SvgPicture.asset(
        "assets/icons/$icon.svg",
        height: 20,
        width: 20,
        colorFilter: ColorFilter.mode(AppColors.green25, BlendMode.srcIn),
      ),
      SizedBox(width: 12),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              title: title,
              size: size ?? AppTextSizes.s14,
              fontWeight: FontWeight.w400,
              color: color ?? AppColors.black62,
            ),
            subtitle == "" ? SizedBox.shrink() : SizedBox(height: 4),
            subtitle == ""
                ? SizedBox.shrink()
                : AppText(
                    title: subtitle,
                    size: AppTextSizes.s16,
                    letterSpacing: -0.15,
                    height: 1.3,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textBlackColor,
                  ),
          ],
        ),
      ),
    ],
  );
}

Widget chipPill({String text = ""}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: AppColors.lightBlue),
    ),
    child: AppText(
      title: text,
      size: 14,
      letterSpacing: -0.15,
      color: AppColors.darkGrey,
    ),
  );
}

Widget sessionDayCard({
  required String day,
  required String date,
  required String month,
  required String slots,
  required bool active,
}) {
  return Container(
    width: 105,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    decoration: BoxDecoration(
      color: active ? AppColors.primary : Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: active ? AppColors.primary.withOpacity(0.35) : AppColors.greyD9,
      ),
      boxShadow: [
        BoxShadow(
          blurRadius: 18,
          offset: const Offset(0, 10),
          color: Colors.black.withOpacity(0.05),
        ),
      ],
    ),
    child: Column(
      children: [
        AppText(
          title: day,
          size: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.textBlackColor,
        ),
        const SizedBox(height: 4),
        Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: active ? AppColors.whiteColor : AppColors.primary,
          ),
          child: AppText(
            title: date,
            size: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(height: 5),
        AppText(
          title: month,
          size: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.black45,
        ),
        Divider(color: Colors.grey.withOpacity(0.3)),
        AppText(
          title: slots,
          size: 9,
          fontWeight: FontWeight.w400,
          color: AppColors.black45,
        ),
      ],
    ),
  );
}
