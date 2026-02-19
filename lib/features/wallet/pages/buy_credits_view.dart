import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/constatns/app_spacing.dart';
import 'package:wayfit/core/constatns/app_text_sizes.dart';

import 'package:wayfit/core/utils/app_btn.dart';
import 'package:wayfit/core/utils/app_text.dart';

class BuyCreditsView extends StatelessWidget {
  const BuyCreditsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _Header(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.horizontal,
                16,
                AppSpacing.horizontal,
                110,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  _CreditPackCard(
                    sideBg: AppColors.purpleE9,
                    gradient: AppColors.walletGradient,
                    iconColor: AppColors.purple64,
                    credits: 50,
                    price: "\$49.99",
                    perCredit: "\$1.00 per credit",
                    bullets: const [
                      "Perfect for beginners",
                      "Valid for 30 days",
                    ],
                  ),
                  const SizedBox(height: 20),
                  _CreditPackCard(
                    sideBg: AppColors.greenCD,
                    gradient: AppColors.mainBarGradient,
                    iconColor: AppColors.green25,
                    bulletColor: AppColors.green25,
                    credits: 50,
                    topBadges: const [
                      _TopBadge(text: "Save 17%", dark: true),
                    ],
                    price: "\$49.99",
                    perCredit: "\$1.00 per credit",
                    bullets: const [
                      "Perfect for beginners",
                      "Most popular choice",
                      "Valid for 30 days",
                    ],
                  ),
                  SizedBox(height: 30),
                  AppText(
                    title: "Why Buy Credits?",
                    size: AppTextSizes.s20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textBlackColor,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children:  [
                      Expanded(
                        child: _WhyCard(
                          title: "Flexibility",
                          subtitle: "Use at any gym",
                          bg: AppColors.primary,
                          iconSvg: "flex_ic",
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _WhyCard(
                          title: "No Contracts",
                          subtitle: "Pay as you go",
                          bg: AppColors.expireColor,
                          iconSvg: "credit_ic",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // bottom button
          SafeArea(
            top: false,
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.horizontal,
                12,
                AppSpacing.horizontal,
                12,
              ),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, -6),
                    blurRadius: 22,
                    color: Colors.black.withOpacity(0.06),
                  )
                ],
              ),
              child: AppBtn(
                onPressed: () {},
                text: "Continue Payment",
                height: 56,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;

    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        gradient: AppColors.walletMainBarGradient,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
      ),
      child: SizedBox(
        height: 250 + topInset,
        child: Stack(
          children: [
            SvgPicture.asset(
              "assets/icons/vector_wallet.svg",
            ),
            Positioned(
              top: topInset + 16,
              left: AppSpacing.horizontal,
              child: InkWell(
                onTap: () => Get.back(),
                borderRadius: BorderRadius.circular(999),
                child: Container(
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/icons/back_ic.svg",
                      height: 18,
                      width: 18,
                      colorFilter: ColorFilter.mode(
                        AppColors.textBlackColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: topInset + 50,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  AppText(
                    title: "Buy Credits",
                    size: AppTextSizes.s18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.whiteColor,
                  ),
                  const SizedBox(height: 5),
                  AppText(
                    title: "Choose your perfect package",
                    size: AppTextSizes.s14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.whiteColor,
                  ),
                ],
              ),
            ),
            Positioned(
              left: AppSpacing.horizontal,
              right: AppSpacing.horizontal,
              bottom: 28,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.green31,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        color: AppColors.addColor,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/icons/gift_ic.svg",
                          height: 20,
                          width: 20,
                          colorFilter: ColorFilter.mode(
                            AppColors.textBlackColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            title: "Limited Time Offer",
                            size: AppTextSizes.s14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.whiteColor,
                          ),
                          const SizedBox(height: 3),
                          AppText(
                            title: "Get up to 30% off on bulk packages",
                            size: AppTextSizes.s12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.whiteColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CreditPackCard extends StatelessWidget {
  const _CreditPackCard({
    required this.sideBg,
    required this.iconColor,
    required this.credits,
    required this.price,
    required this.perCredit,
    required this.bullets,
    this.topBadges = const [],
    this.bulletColor,
    this.gradient,
  });

  final Color sideBg;
  final Color iconColor;
  final int credits;
  final String price;
  final String perCredit;
  final List<String> bullets;
  final List<_TopBadge> topBadges;
  final Color? bulletColor;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.greyCF, width: 0.8),
      ),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 240,
            padding: const EdgeInsets.fromLTRB(12, 23, 12, 12),
            decoration: BoxDecoration(
              color: sideBg,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    gradient: gradient,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/icons/credit_ic.svg",
                      height: 22,
                      width: 22,
                      colorFilter: ColorFilter.mode(
                        AppColors.whiteColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                AppText(
                  title: "$credits",
                  size: AppTextSizes.s24,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 2),
                AppText(
                  title: "Credits",
                  size: AppTextSizes.s12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black45,
                ),
                const SizedBox(height: 60),
                AppText(
                  title: perCredit,
                  size: AppTextSizes.s12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black62,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (topBadges.isNotEmpty) ...[
                    Row(
                      children: [
                        for (int i = 0; i < topBadges.length; i++) ...[
                          _badgeChip(topBadges[i]),
                          if (i != topBadges.length - 1)
                            const SizedBox(width: 5),
                        ],
                      ],
                    ),
                    const SizedBox(height: 7),
                  ],
                  AppText(
                    title: price,
                    size: AppTextSizes.s24,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 2),
                  AppText(
                    title: "one-time",
                    size: AppTextSizes.s14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black62,
                  ),
                  const SizedBox(height: 12),
                  for (final b in bullets) ...[
                    _bulletRow(
                      text: b,
                      dotColor: bulletColor ?? AppColors.purple64,
                    ),
                    const SizedBox(height: 10),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bulletRow({required String text, required Color dotColor}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: dotColor.withOpacity(0.18),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Center(
            child: Icon(
              Icons.check,
              size: 13,
              color: dotColor,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: AppText(
            title: text,
            size: AppTextSizes.s14,
            fontWeight: FontWeight.w400,
            color: AppColors.darkGrey,
          ),
        ),
      ],
    );
  }

  Widget _badgeChip(_TopBadge b) {
    final bg = b.dark ? AppColors.textBlackColor : AppColors.addColor;
    final textColor = b.dark ? AppColors.whiteColor : AppColors.textBlackColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
        border: b.dark ? null : Border.all(color: AppColors.green25, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (b.withStar) ...[
            Icon(Icons.star, size: 14, color: textColor),
            const SizedBox(width: 6),
          ],
          AppText(
            title: b.text,
            size: AppTextSizes.s12,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ],
      ),
    );
  }
}

class _TopBadge {
  final String text;
  final bool dark;
  final bool withStar;

  const _TopBadge({
    required this.text,
    this.dark = false,
    this.withStar = false,
  });
}

class _WhyCard extends StatelessWidget {
  const _WhyCard({
    required this.title,
    required this.subtitle,
    required this.bg,
    required this.iconSvg,
  });

  final String title;
  final String subtitle;
  final Color bg;
  final String iconSvg;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              "assets/icons/$iconSvg.svg",
              height: 22,
              width: 22,
              colorFilter: ColorFilter.mode(
                AppColors.textBlackColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              AppText(
                title: title,
                size: AppTextSizes.s16,
                fontWeight: FontWeight.w700,
                color: AppColors.textBlackColor,
              ),
              const SizedBox(height: 4),
              AppText(
                title: subtitle,
                size: AppTextSizes.s12,
                fontWeight: FontWeight.w400,
                color: AppColors.blackColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}