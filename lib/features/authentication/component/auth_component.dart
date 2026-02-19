import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/constatns/app_strings.dart';
import 'package:wayfit/core/constatns/app_text_sizes.dart';
import 'package:wayfit/core/utils/app_text.dart';

Widget richTextWidget({
  String title = "",
  String subtitle = "",
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            title: title,
            size: AppTextSizes.s14,
            fontWeight: FontWeight.w400,
            color: AppColors.blackColor,
          ),
          AppText(
            title: subtitle,
            size: AppTextSizes.s14,
            fontWeight: FontWeight.w700,
            color: AppColors.green25,
          ),
        ],
      ),
    ),
  );
}

Widget textFieldLabel({
  String title = "",
  String subtitle = "",
  VoidCallback? onTap,
  bool isShowOption = false,
  bool isRequired = true,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppText(
            title: title,
            size: AppTextSizes.s14,
            fontWeight: FontWeight.w500,
            color: AppColors.blackColor,
          ),
          isRequired == false
              ? const SizedBox.shrink()
              : AppText(
            title: " *",
            size: AppTextSizes.s14,
            fontWeight: FontWeight.w500,
            color: Colors.red,
          ),
          isShowOption == false
              ? const SizedBox.shrink()
              : AppText(
            title: AppStrings.optional,
            size: AppTextSizes.s12,
            fontWeight: FontWeight.w400,
            color: AppColors.unselectColor,
          ),
        ],
      ),
    ),
  );
}

class TermsCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onTapTerms;
  final VoidCallback onTapPrivacy;
  final Color accentColor;
  final Color textColor;
  final double fontSize;
  final double checkboxSize;

  const TermsCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.onTapTerms,
    required this.onTapPrivacy,
    this.accentColor = const Color(0xFF25C979),
    this.textColor = const Color(0xFF45556C),
    this.fontSize = 14,
    this.checkboxSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    final base = GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: textColor,
      height: 1.35,
    );

    final link = GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: accentColor,
      height: 1.35,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: checkboxSize,
          height: checkboxSize,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            side: const BorderSide(color: Color(0xFFD0D5DD), width: 1.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            activeColor: accentColor,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: base,
              children: [
                TextSpan(text: "${AppStrings.agreeTo} "),
                TextSpan(
                  text: AppStrings.termsOfService,
                  style: link,
                  recognizer: TapGestureRecognizer()..onTap = onTapTerms,
                ),
                TextSpan(text: " ${AppStrings.and} "),
                TextSpan(
                  text: "\n${AppStrings.privacyPolicy}",
                  style: link,
                  recognizer: TapGestureRecognizer()..onTap = onTapPrivacy,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ConfirmCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String text;

  const ConfirmCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.green25,
          checkColor: Colors.white,
          side: const BorderSide(color: Color(0xFFD0D5DD), width: 1.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        const SizedBox(width: 3),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.black45,
                height: 1.35,
              ),
            ),
          ),
        ),
      ],
    );
  }
}