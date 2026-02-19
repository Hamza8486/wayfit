import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/utils/app_text.dart';
class MainAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBarWidget({
    super.key,
    this.title,
    this.child,
    this.size,
    this.suffix,
    this.onTap,
    this.icon = 'assets/icons/back_ic.svg',
    this.showDivider = true,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    this.height = 65,
    this.backgroundColor = Colors.transparent,
  });

  final String? title;
  final Widget? child;
  final double? size;
  final Widget? suffix;
  final VoidCallback? onTap;
  final String icon;
  final bool showDivider;
  final double horizontalPadding;
  final double verticalPadding;
  final double height;
  final Color backgroundColor;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: onTap ?? () => Get.back(),
                  child: SvgPicture.asset(
                    icon,
                    height: 36,
                    width: 36,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child:
                  child ??
                      AppText(
                        title: title ?? '',
                        fontWeight: FontWeight.w700,
                        size: size ?? 18,
                        color: AppColors.textBlackColor,
                      ),
                ),
                if (suffix != null) suffix!,
              ],
            ),
          ),
          const SizedBox(height: 16),
          if (showDivider)
            Container(
              height: 1,
              width: double.infinity,
              color: AppColors.searchBorderColor,
            ),
        ],
      ),
    );
  }
}