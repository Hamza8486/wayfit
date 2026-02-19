import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/constatns/app_strings.dart';
import 'package:wayfit/core/constatns/app_validators.dart';

import 'package:wayfit/core/utils/app_btn.dart';
import 'package:wayfit/core/utils/app_field.dart';
import 'package:wayfit/core/utils/app_text.dart';
import 'package:wayfit/features/authentication/auth_controller.dart';
import 'package:wayfit/features/authentication/component/auth_component.dart';
import 'package:wayfit/routes/pages.dart';

Future<void> showLoginPopup(BuildContext context) async {
  final AuthController controller = Get.find<AuthController>();
  controller.clearPopupLogin();

  await showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black54,
    builder: (_) {
      return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 18),
        child: _LoginPopupCard(onClose: () => Navigator.pop(context)),
      );
    },
  );
}

class _LoginPopupCard extends StatelessWidget {
  const _LoginPopupCard({required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final cardWidth = w > 420 ? 420.0 : w;

    return GetBuilder<AuthController>(
      id: 'login_popup',
      builder: (controller) {
        return Center(
          child: Container(
            width: cardWidth,
            padding: const EdgeInsets.fromLTRB(24, 18, 24, 18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  top: 0,
                  child: InkWell(
                    onTap: onClose,
                    borderRadius: BorderRadius.circular(999),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F4F6),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 18,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                Form(
                  key: controller.loginPopupKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      AppText(
                        title: AppStrings.loginContinue,
                        size: 24,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(height: 8),
                      AppText(
                        title: AppStrings.loginPopupSubtitle,
                        size: 14,
                        color: AppColors.unselectColor,
                        fontWeight: FontWeight.w400,
                      ),
                      const SizedBox(height: 18),
                      textFieldLabel(title: AppStrings.email),
                      const SizedBox(height: 8),
                      AppField(
                        controller: controller.loginEmailCtrl,
                        hint: AppStrings.emailHint,
                        keyboardType: TextInputType.emailAddress,
                        validator: AppValidators.email,
                      ),
                      const SizedBox(height: 12),
                      textFieldLabel(title: AppStrings.password),
                      const SizedBox(height: 8),
                      AppField(
                        controller: controller.loginPassCtrl,
                        hint: AppStrings.passwordHint,
                        isPassword: controller.popupHidePassword,
                        textInputAction: TextInputAction.done,
                        validator: (v) {
                          final s = (v ?? "").trim();
                          if (s.isEmpty) return AppStrings.passwordRequired;
                          if (s.length < 6) return AppStrings.passwordMin6;
                          return null;
                        },
                        onFieldSubmitted: (_) => controller.loginFromPopup(),
                        suffix: GestureDetector(
                          onTap: controller.togglePopupPassword,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 14),
                            child: Icon(
                              controller.popupHidePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              size: 18,
                              color: AppColors.unselectColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      AppBtn(
                        text: controller.popupLoading
                            ? AppStrings.loggingIn
                            : AppStrings.login,
                        onPressed: controller.popupLoading
                            ? null
                            : () {
                          Navigator.pop(context);
                          Get.toNamed(AppRoutes.mainNav);
                        },
                        /// controller.loginFromPopup,
                      ),
                      const SizedBox(height: 18),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}