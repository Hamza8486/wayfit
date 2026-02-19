import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/constatns/app_spacing.dart';
import 'package:wayfit/core/utils/app_text.dart';


class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    required this.icon,
    required this.onTap,
    this.size,
    this.backColor,
    this.colorFilter,
    this.imageSize,
  });

  final String icon;
  final double? size;
  final double? imageSize;
  final VoidCallback onTap;
  final Color? backColor;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        width: size ?? 40,
        height: size ?? 40,
        decoration: BoxDecoration(
          color: backColor ?? Colors.white,
          borderRadius: BorderRadius.circular(1000),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.18),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Center(
          child: SvgPicture.asset(
            "assets/icons/$icon",
            height: imageSize,
            width: imageSize,
            colorFilter: colorFilter,
          ),
        ),
      ),
    );
  }
}
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    required this.title,
    required this.onSeeAll,
    this.padding,
  });

  final String title;
  final double? padding;
  final VoidCallback onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? AppSpacing.horizontal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            title: title,
            size: 18,
            fontWeight: FontWeight.w700,
            height: 1.4,
            letterSpacing: -0.45,
            color: AppColors.blackColor,
          ),
          GestureDetector(
            onTap: onSeeAll,
            child: AppText(
              title: "See All",
              size: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.15,
              color: AppColors.green25,
            ),
          ),
        ],
      ),
    );
  }
}

Widget searchBarDiscover({VoidCallback? onTap}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(16),
    child: Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.searchBorderColor),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            SvgPicture.asset("assets/icons/search_ic.svg"),
            const SizedBox(width: 12),
            Expanded(
              child: AppText(
                title: 'Search gyms or classes...',
                size: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}