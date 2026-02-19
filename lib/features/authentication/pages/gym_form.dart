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
import 'package:wayfit/features/authentication/component/auth_component.dart' show textFieldLabel, ConfirmCheckbox;
import '../auth_controller.dart';

class GymFormView extends StatelessWidget {
  const GymFormView({super.key});

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
                          key: controller.gymFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                title: AppStrings.submitDetails,
                                size: AppTextSizes.s26,
                                fontWeight: FontWeight.w700,
                                color: AppColors.blackColor,
                              ),
                              const SizedBox(height: 5),
                              AppText(
                                title: AppStrings.ourTeamReview,
                                size: AppTextSizes.s13,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black62,
                              ),
                              const SizedBox(height: 20),
                              textFieldLabel(title: AppStrings.gymName),
                              const SizedBox(height: 8),
                              AppField(
                                controller: controller.gymNameCtrl,
                                hint: AppStrings.gymName,
                                validator: AppValidators.gymName,
                                suffix: const _SvgIcon("assets/icons/person_ic.svg"),
                              ),
                              SizedBox(height: AppSpacing.textFieldHeight),
                              textFieldLabel(title: AppStrings.cityArea),
                              const SizedBox(height: 8),
                              AppField(
                                controller: controller.cityAreaCtrl,
                                hint: AppStrings.cityArea,
                                validator: AppValidators.city,
                                suffix: const _SvgIcon("assets/icons/loc_ic.svg"),
                              ),
                              SizedBox(height: AppSpacing.textFieldHeight),
                              textFieldLabel(title: AppStrings.contactName),
                              const SizedBox(height: 8),
                              AppField(
                                controller: controller.contactNameCtrl,
                                hint: AppStrings.contactName,
                                validator: AppValidators.contactName,
                                suffix: const _SvgIcon("assets/icons/company_ic.svg"),
                              ),
                              SizedBox(height: AppSpacing.textFieldHeight),
                              textFieldLabel(title: AppStrings.email),
                              const SizedBox(height: 8),
                              AppField(
                                controller: controller.gymEmailCtrl,
                                hint: AppStrings.email,
                                keyboardType: TextInputType.emailAddress,
                                validator: AppValidators.email,
                                suffix: const _SvgIcon("assets/icons/email_ic.svg"),
                              ),
                              SizedBox(height: AppSpacing.textFieldHeight),
                              textFieldLabel(
                                title: AppStrings.phone,
                                isRequired: false,
                                isShowOption: true,
                              ),
                              const SizedBox(height: 8),
                              AppField(
                                controller: controller.gymPhoneCtrl,
                                hint: "+1 (555) 000-0000",
                                keyboardType: TextInputType.phone,
                                validator: AppValidators.phoneOptional,
                                suffix: const _SvgIcon("assets/icons/call_icon.svg"),
                              ),
                              SizedBox(height: AppSpacing.textFieldHeight),
                              textFieldLabel(
                                title: AppStrings.website,
                                isRequired: false,
                                isShowOption: true,
                              ),
                              const SizedBox(height: 8),
                              AppField(
                                controller: controller.websiteCtrl,
                                hint: "https://instagram.com/yourgym",
                                validator: AppValidators.websiteOptional,
                                suffix: const _SvgIcon("assets/icons/website.svg"),
                              ),
                              SizedBox(height: AppSpacing.textFieldHeight),
                              ConfirmCheckbox(
                                value: controller.confirmGymAuthority.value,
                                onChanged: controller.toggleConfirmGymAuthority,
                                text: AppStrings.confirmText,
                              ),
                              const SizedBox(height: 33),
                              AppBtn(
                                onPressed: controller.submitGymForm,
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