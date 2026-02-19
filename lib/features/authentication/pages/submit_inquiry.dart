import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/constatns/app_spacing.dart';
import 'package:wayfit/core/constatns/app_strings.dart';
import 'package:wayfit/core/constatns/app_text_sizes.dart';
import 'package:wayfit/core/constatns/app_validators.dart';

import 'package:wayfit/core/utils/app_btn.dart';
import 'package:wayfit/core/utils/app_field.dart';
import 'package:wayfit/core/utils/app_text.dart';
import 'package:wayfit/features/authentication/component/auth_component.dart';
import '../auth_controller.dart';

class SubmitInquiryView extends StatelessWidget {
  const SubmitInquiryView({super.key});

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
                      top: 5,
                      right: 5,
                      child: Image.asset(
                        "assets/images/photo_room.png",
                        width: 150,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 130),
                          child: Image.asset(
                            "assets/images/bottle.png",
                            width: 150,
                            fit: BoxFit.contain,
                          ),
                        ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSpacing.topSubmitInquiry),
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
                          horizontal: 24,
                          vertical: 33,
                        ),
                        child: Form(
                          key: controller.submitInquiryFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                title: AppStrings.submitInterest,
                                size: AppTextSizes.s26,
                                fontWeight: FontWeight.w700,
                                color: AppColors.blackColor,
                              ),
                              const SizedBox(height: 5),
                              AppText(
                                title: AppStrings.fillDetail,
                                size: AppTextSizes.s13,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black62,
                              ),
                              const SizedBox(height: 20),
                              textFieldLabel(title: AppStrings.fullName),
                              const SizedBox(height: 8),
                              AppField(
                                controller: controller.fullNameCtrl,
                                hint: AppStrings.hintFullName,
                                validator: AppValidators.fullName,
                                suffix: const _SvgIcon(
                                  "assets/icons/person_ic.svg",
                                ),
                              ),
                              SizedBox(height: AppSpacing.textFieldHeight),
                              textFieldLabel(title: AppStrings.email),
                              const SizedBox(height: 8),
                              AppField(
                                controller: controller.emailCtrl,
                                hint: AppStrings.hintEmail,
                                keyboardType: TextInputType.emailAddress,
                                validator: AppValidators.email,
                                suffix: const _SvgIcon(
                                  "assets/icons/email_ic.svg",
                                ),
                              ),
                              SizedBox(height: AppSpacing.textFieldHeight),
                              textFieldLabel(title: AppStrings.companyEmployee),
                              const SizedBox(height: 8),
                              AppField(
                                controller: controller.companyCtrl,
                                hint: AppStrings.hintCompany,
                                validator: AppValidators.company,
                                suffix: const _SvgIcon(
                                  "assets/icons/company_ic.svg",
                                ),
                              ),
                              SizedBox(height: AppSpacing.textFieldHeight),
                              textFieldLabel(title: AppStrings.city),
                              const SizedBox(height: 8),
                              AppField(
                                controller: controller.cityCtrl,
                                hint: AppStrings.hintCity,
                                validator: AppValidators.city,
                                suffix: const _SvgIcon(
                                  "assets/icons/loc_ic.svg",
                                ),
                              ),
                              SizedBox(height: AppSpacing.textFieldHeight),
                              textFieldLabel(
                                title: AppStrings.phone,
                                isRequired: false,
                                isShowOption: true,
                              ),
                              const SizedBox(height: 8),
                              AppField(
                                controller: controller.phoneCtrl,
                                hint: AppStrings.hintPhone,
                                keyboardType: TextInputType.phone,
                                validator: AppValidators.phoneOptional,
                                suffix: const _SvgIcon(
                                  "assets/icons/call_icon.svg",
                                ),
                              ),
                              SizedBox(height: AppSpacing.textFieldHeight),
                              Obx(() {
                                return TermsCheckbox(
                                  value: controller.agreeTerms.value,
                                  onChanged: controller.toggleAgree,
                                  onTapTerms: controller.openTerms,
                                  onTapPrivacy: controller.openPrivacy,
                                );
                              }),
                              const SizedBox(height: 33),
                              AppBtn(
                                onPressed: () => controller.submitInquiry(),
                                text: AppStrings.submit,
                              ),
                            ],
                          ),
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

class _SvgIcon extends StatelessWidget {
  final String path;

  const _SvgIcon(this.path);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(path, height: 19, width: 19);
  }
}
