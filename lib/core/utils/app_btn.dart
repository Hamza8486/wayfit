import 'package:flutter/material.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/utils/app_text.dart';
class AppBtn extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double width;
  final double height;
  final Color? bgColor;
  final double radius;
  final Color? fontColor;
  final Color borderColor;
  final double fontSize;
  final double ? widthBorder;
  final FontWeight fontWeight;
  final bool loading;
  final Widget ? icon;
  final Gradient ? gradientColor;

  const AppBtn({
    super.key,
    required this.onPressed,
    required this.text,
    this.widthBorder,
    this.width = double.infinity,
    this.height = 52,
    this.bgColor,
    this.gradientColor,
    this.radius = 14,
    this.fontColor,
    this.icon,
    this.borderColor = Colors.transparent,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w700,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null || loading;
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          elevation: isDisabled ? 0 : 2,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: borderColor, width: widthBorder ?? 1),
            color: isDisabled ? Colors.white12 : bgColor,
            gradient: (!isDisabled && bgColor == null)
                ?
            gradientColor ??
                AppColors.selectedBarGradient
                : null,
          ),
          child: Container(
            alignment: Alignment.center,
            child: loading
                ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator.adaptive(
                strokeWidth: 2,
                backgroundColor: Colors.white24,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            )
                : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Padding(
                    padding: const EdgeInsets.only(right: 6.5),
                    child: icon ?? SizedBox.shrink(),
                  )
                ],
                if (text.isNotEmpty)
                  Flexible(
                    child: AppText(
                      title: text,
                      color: fontColor ?? Colors.black,
                      size: fontSize,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: fontWeight,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}