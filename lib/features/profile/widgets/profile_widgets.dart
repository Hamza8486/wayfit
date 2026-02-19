import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/constatns/app_spacing.dart';
import 'package:wayfit/core/constatns/app_text_sizes.dart';

import 'package:wayfit/core/utils/app_text.dart';
import 'package:wayfit/features/discover/widgets/circle_icon_button.dart';
import 'package:wayfit/features/profile/pages/qr_code_view.dart';
import 'package:wayfit/features/profile/profile_controller.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.controller});
  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;
    final avatar = controller.avatarSize(context);

    return SizedBox(
      height: 378,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(gradient: AppColors.mainBarGradient),
              child: Stack(
                children: [
                  SvgPicture.asset(
                    "assets/images/vector.svg",
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: AppSpacing.horizontal,
                    top: topInset + 16,
                    child: AppText(
                      title: "Profile",
                      size: AppTextSizes.s18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textBlackColor,
                    ),
                  ),
                  Positioned(
                    right: AppSpacing.horizontal,
                    top: topInset + 10,
                    child: CircleIconButton(
                      icon: "edit_ic.svg",
                      size: 44,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: topInset + 46,
            child: Column(
              children: [
                Container(
                  height: avatar,
                  width: avatar,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: controller.avatarUrl,
                      fit: BoxFit.cover,
                      errorWidget: (_, __, ___) =>
                          Container(color: AppColors.lightGrey),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                AppText(
                  title: controller.name,
                  size: AppTextSizes.s30,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlackColor,
                ),
                const SizedBox(height: 8),
                AppText(
                  title: controller.email,
                  size: AppTextSizes.s14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black45,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileSheet extends StatelessWidget {
  const ProfileSheet({super.key, required this.controller});
  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.horizontal,
          18,
          AppSpacing.horizontal,
          22,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            GetBuilder<ProfileController>(
              id: ProfileController.statsId,
              builder: (c) => LayoutBuilder(
                builder: (context, box) {
                  final isNarrow = box.maxWidth < 360;
                  final gap = isNarrow ? 8.0 : 12.0;
                  return Row(
                    children: [
                      Expanded(
                        child: StatCard(
                          bg: AppColors.addColor,
                          value: "${c.credits}",
                          label: "Available",
                          compact: isNarrow,
                        ),
                      ),
                      SizedBox(width: gap),
                      Expanded(
                        child: StatCard(
                          bg: AppColors.usedColor,
                          value: "${c.classes}",
                          label: "Classes",
                          compact: isNarrow,
                        ),
                      ),
                      SizedBox(width: gap),
                      Expanded(
                        child: StatCard(
                          bg: AppColors.expireColor,
                          value: "${c.streak}",
                          label: "Day Streak",
                          compact: isNarrow,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            AppText(
              title: "Settings",
              size: AppTextSizes.s20,
              fontWeight: FontWeight.w700,
              color: AppColors.textBlackColor,
            ),
            const SizedBox(height: 16),
            const SectionLabel("ACCOUNT"),
            const SizedBox(height: 12),
            GroupCard(
              children: [
                SettingRow(
                  iconSvg: "personal",
                  title: "Personal Information",
                  onTap: () {
                    Get.to(const QrCodesView());
                  },
                ),
                const DividerLine(),
                SettingRow(
                  iconSvg: "email_ic",
                  title: "Email & Password",
                  onTap: () {},
                ),
                const DividerLine(),
                SettingRow(
                  iconSvg: "pin_ic",
                  title: "Location Preferences",
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            const SectionLabel("PREFERENCES"),
            const SizedBox(height: 10),
            GroupCard(
              children: [
                SettingRow(iconSvg: "bells_ic", title: "Notifications", onTap: () {}),
                const DividerLine(),
                SettingRow(iconSvg: "cal_ic", title: "Workout Reminders", onTap: () {}),
                const DividerLine(),
                SettingRow(iconSvg: "fitness_ic", title: "Fitness Goals", onTap: () {}),
              ],
            ),
            const SizedBox(height: 20),
            const SectionLabel("BILLING"),
            const SizedBox(height: 10),
            GroupCard(
              children: [
                SettingRow(iconSvg: "card_ic", title: "Payment Methods", onTap: () {}),
                const DividerLine(),
                SettingRow(iconSvg: "subscription", title: "Subscription Plan", onTap: () {}),
              ],
            ),
            const SizedBox(height: 20),
            const SectionLabel("SUPPORT"),
            const SizedBox(height: 10),
            GroupCard(
              children: [
                SettingRow(iconSvg: "help_ic", title: "Help Center", onTap: () {}),
                const DividerLine(),
                SettingRow(iconSvg: "privacy", title: "Privacy & Security", onTap: () {}),
              ],
            ),
            const SizedBox(height: 24),
            SignOutButton(onTap: () {}),
            const SizedBox(height: 14),
          ],
        ),
      ),
    );
  }
}

class PremiumBadge extends StatelessWidget {
  const PremiumBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.purple98,
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 24,
            color: Colors.black.withOpacity(0.08),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            "assets/icons/subscription.svg",
            height: 18,
            width: 18,
            colorFilter: ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn),
          ),
          const SizedBox(width: 10),
          AppText(
            title: "Premium Member",
            size: AppTextSizes.s12,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteColor,
          ),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.bg,
    required this.value,
    required this.label,
    this.compact = false,
  });

  final Color bg;
  final String value;
  final String label;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final pad = compact ? 14.0 : 18.0;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: pad, vertical: pad),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title: value,
            size: AppTextSizes.s24,
            fontWeight: FontWeight.w700,
            color: AppColors.textBlackColor,
          ),
          const SizedBox(height: 4),
          AppText(
            title: label,
            size: AppTextSizes.s12,
            fontWeight: FontWeight.w400,
            color: AppColors.black45,
          ),
        ],
      ),
    );
  }
}

class SectionLabel extends StatelessWidget {
  const SectionLabel(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return AppText(
      title: text,
      size: AppTextSizes.s12,
      fontWeight: FontWeight.w500,
      color: AppColors.black45,
      letterSpacing: 0.8,
    );
  }
}

class GroupCard extends StatelessWidget {
  const GroupCard({super.key, required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 20,
            spreadRadius: 0,
            color: AppColors.black26,
          ),
        ],
      ),
      child: Column(children: children),
    );
  }
}

class SettingRow extends StatelessWidget {
  const SettingRow({
    super.key,
    required this.iconSvg,
    required this.title,
    required this.onTap,
  });

  final String iconSvg;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 62,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/icons/$iconSvg.svg",
              height: 20,
              width: 20,
              colorFilter: ColorFilter.mode(AppColors.green25, BlendMode.srcIn),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: AppText(
                title: title,
                size: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.textBlackColor,
              ),
            ),
            SvgPicture.asset("assets/icons/next_ic.svg"),
          ],
        ),
      ),
    );
  }
}

class DividerLine extends StatelessWidget {
  const DividerLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 1, color: AppColors.lightGrey);
  }
}

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.searchBorderColor, width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/logout_ic.svg",
              height: 18,
              width: 18,
              colorFilter: ColorFilter.mode(AppColors.green25, BlendMode.srcIn),
            ),
            const SizedBox(width: 10),
            AppText(
              title: "Sign Out",
              size: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.darkGrey,
            ),
          ],
        ),
      ),
    );
  }
}