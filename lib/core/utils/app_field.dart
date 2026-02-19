import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constatns/app_colors.dart' show AppColors;
class AppField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final GestureTapCallback? onTap;
  final TextInputAction? textInputAction;
  final double radius;
  final bool isPassword;
  final bool bordered;
  final bool filled;
  final bool readOnly;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final double verticalPadding;
  final IconData? suffixIcon;
  final Widget? suffix;
  final FocusNode? focusNode;
  final Color? prefixColor;
  final Color? fillColor;
  final Color? textColor;
  final FontWeight? hintFontWeight;
  final double? hintFontSize;
  final double? fontSize;
  final Color? hintColor;
  final void Function()? onSuffixTap;

  AppField({
    super.key,
    this.onTap,
    this.controller,
    this.hint,
    this.hintFontWeight,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.suffix,
    this.prefixColor,
    this.inputFormatters,
    this.textInputAction,
    this.onFieldSubmitted,
    this.radius = 14,
    this.maxLines = 1,
    this.verticalPadding = 14,
    this.hintFontSize = 14.0,
    this.fillColor,
    this.focusNode,
    this.prefixIcon,
    this.isPassword = false,
    this.filled = true,
    this.bordered = true,
    this.readOnly = false,
    this.suffixIcon,
    this.onSuffixTap,
    this.hintColor,
    this.textColor,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      onTap: onTap,
      readOnly: readOnly,
      showCursor: !readOnly,
      maxLines: maxLines,
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: textInputAction ?? TextInputAction.next,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      cursorColor: AppColors.primary,
      cursorErrorColor: Colors.red,
      cursorHeight: 15,
      controller: controller,
      style: GoogleFonts.inter(
        fontSize: fontSize ?? 15,
        fontWeight: FontWeight.w500,
        color: textColor ?? AppColors.blackColor,
      ),
      decoration: InputDecoration(
        fillColor: filled ? fillColor ?? AppColors.greyF6 : null,
        filled: filled,
        prefixIconConstraints: prefixIcon == null
            ? null
            : BoxConstraints(minWidth: 0, minHeight: 0),
        prefixIcon: prefixIcon == null
            ? null
            : Padding(
          padding: EdgeInsets.only(left: 16, right: 5),
          child: Icon(
            prefixIcon!,
            size: 20,
            color: prefixColor ?? AppColors.borderLight,
          ),
        ),
        suffixIconConstraints: suffixIcon == null || suffix == null
            ? null
            : BoxConstraints(minWidth: 0, minHeight: 0),
        suffixIcon: suffixIcon == null
            ?
        suffix == null ? SizedBox.shrink() :
        Padding(
          padding: EdgeInsets.only(left: 5, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              suffix ?? SizedBox.shrink(),
            ],
          ),
        )
            : Padding(
          padding: EdgeInsets.only(left: 5, right: 16),
          child: GestureDetector(
            onTap: onSuffixTap,
            child: Icon(suffixIcon, color: Colors.white, size: 16),
          ),
        ),
        hintText: hint?.tr,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: AppColors.greyE9, width: 1.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: bordered ? AppColors.primary : Colors.transparent,
            width: 1.2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: bordered ? AppColors.greyE9 : Colors.transparent,
            width: 1.2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: bordered ? Colors.red : Colors.transparent,
            width: 1.2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: bordered ? Colors.red : Colors.transparent,
            width: 1.2,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: 16,
        ),
        hintStyle: GoogleFonts.inter(
          fontSize: hintFontSize ?? 15,
          fontWeight: hintFontWeight ?? FontWeight.w400,
          color: hintColor ?? AppColors.black45,
        ),
      ),
    );
  }
}