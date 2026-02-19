import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/constatns/app_spacing.dart';
import 'package:wayfit/core/constatns/app_strings.dart';
import 'package:wayfit/core/constatns/app_text_sizes.dart';

import 'package:wayfit/core/utils/app_btn.dart';
import 'package:wayfit/core/utils/app_text.dart';
import 'package:wayfit/features/authentication/component/auth_component.dart';
import 'package:wayfit/features/authentication/pages/login_popup.dart';

import 'package:wayfit/routes/pages.dart';
import '../auth_controller.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/landing_back.png",
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Positioned(
                      top: 60,
                      left: 35,
                      right: 45,
                      child: Image.asset(
                        "assets/images/landing_group.png",
                        width: 378,
                        height: 319,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 50,
                left: 24,
                child: Row(
                  children: [
                    AppText(
                      title: AppStrings.wayFit,
                      size: AppTextSizes.s23,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackColor,
                    ),
                    AppText(
                      title: "${AppStrings.co}.",
                      size: AppTextSizes.s23,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackColor,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(height: AppSpacing.topLandingHeight),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 45,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              title: AppStrings.loginContinue,
                              size: AppTextSizes.s26,
                              fontWeight: FontWeight.w700,
                              color: AppColors.blackColor,
                            ),
                            const SizedBox(height: 5),
                            AppText(
                              title: AppStrings.createAccount,
                              size: AppTextSizes.s13,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black62,
                            ),
                            const SizedBox(height: 22),
                            AppBtn(
                              onPressed: () {
                                showLoginPopup(context);
                              },
                              text: AppStrings.login,
                            ),
                            const SizedBox(height: 20),
                            richTextWidget(
                              title: AppStrings.dntHaveAccount,
                              subtitle: AppStrings.submitInquiry,
                              onTap: () {
                                Get.toNamed(AppRoutes.submitInquiry);
                              },
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 0.99,
                                    color: AppColors.searchBorderColor,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                AppText(
                                  title: AppStrings.or,
                                  size: AppTextSizes.s14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.unselectColor,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    height: 0.99,
                                    color: AppColors.searchBorderColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            AppBtn(
                              onPressed: () {
                                Get.toNamed(AppRoutes.gymForm);
                              },
                              text: AppStrings.gymOwner,
                              fontColor: AppColors.blackColor,
                              bgColor: Colors.white,
                              borderColor: AppColors.greenA0,
                              widthBorder: 0.8,
                            ),
                            const SizedBox(height: 20),
                            Center(
                              child: AppText(
                                title: AppStrings.gymRequest,
                                size: AppTextSizes.s14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black62,
                                textAlign: TextAlign.center,
                              ),
                            ),
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
      },
    );
  }
}