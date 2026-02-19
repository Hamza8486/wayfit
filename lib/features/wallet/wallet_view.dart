import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/constatns/app_spacing.dart';

import 'package:wayfit/core/utils/app_text.dart';
import 'package:wayfit/features/wallet/wallet_controller.dart';

class WalletView extends StatelessWidget {
  WalletView({super.key});

  final c = Get.put(WalletController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 250,
            width: Get.width,
            decoration: BoxDecoration(
              gradient: AppColors.walletMainBarGradient,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              image: const DecorationImage(
                image: AssetImage("assets/images/wallet_back.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.horizontal),
              child: Column(
                children: [
                  const SizedBox(height: 65),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              title: "Available Credits",
                              size: 14,
                              color: AppColors.whiteColor,
                            ),
                            const SizedBox(height: 3),
                            AppText(
                              title: "120",
                              size: 48,
                              color: AppColors.whiteColor,
                              letterSpacing: 0.35,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 68,
                        width: 68,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: AppColors.walletGradient,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/icons/credit_ic.svg",
                            height: 32,
                            width: 32,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.green31,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/refresh_ic.svg"),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Obx(() {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  title: c.nextRefreshLabel.value,
                                  size: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                                const SizedBox(height: 2),
                                AppText(
                                  title: c.nextRefreshDate.value,
                                  size: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            );
                          }),
                        ),
                        Obx(() {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              AppText(
                                title: "+${c.nextRefreshAdd.value}",
                                size: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                              AppText(
                                title: "credits",
                                size: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: AppSpacing.horizontal,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _PrimaryButton(text: "Buy Credits", onTap: c.onBuyCredits),
                    const SizedBox(height: 20),
                    _PlanCard(c: c),
                    const SizedBox(height: 20),
                    AppText(
                      title: "January Summary",
                      size: 20,
                      color: AppColors.textBlackColor,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: SummaryBox(
                            tint: AppColors.addColor,
                            icon: "added_ic",
                            valueRx: c.janAdded,
                            label: "Added",
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SummaryBox(
                            tint: AppColors.usedColor,
                            icon: "use_ic",
                            valueRx: c.janUsed,
                            label: "Used",
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SummaryBox(
                            tint: AppColors.expireColor,
                            icon: "expire_ic",
                            valueRx: c.janExpired,
                            label: "Expired",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    AppText(
                      title: "Transaction History",
                      size: 20,
                      color: AppColors.textBlackColor,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(height: 16),
                    _FilterChips(c: c),
                    const SizedBox(height: 20),
                    Obx(() {
                      final list = c.filteredTx;
                      return ListView.separated(
                        itemCount: list.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        primary: false,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (_, i) => _TxTile(item: list[i]),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: AppColors.selectedBarGradient,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 18,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/add_ic.svg",
              color: AppColors.blackColor,
            ),
            const SizedBox(width: 10),
            AppText(
              title: text,
              size: 16,
              color: AppColors.blackColor,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  const _PlanCard({required this.c});

  final WalletController c;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: AppColors.whiteGradient,
          border: Border.all(color: AppColors.purpleD8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 14,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset("assets/icons/premium_ic.svg"),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        title: c.planTitle.value,
                        size: 18,
                        color: AppColors.textBlackColor,
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(height: 3),
                      AppText(
                        title: c.planSubtitle.value,
                        size: 14,
                        color: AppColors.black45,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.greenD0,
                    borderRadius: BorderRadius.circular(1000),
                    border: Border.all(color: AppColors.green5E),
                  ),
                  child: AppText(
                    title: c.planActive.value ? "Active" : "Inactive",
                    size: 12,
                    color: AppColors.green00,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/cal_ic.svg",
                  color: AppColors.green25,
                ),
                const SizedBox(width: 8),
                AppText(
                  title: c.planRenewDate.value,
                  size: 14,
                  color: AppColors.black45,
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

class _FilterChips extends StatelessWidget {
  const _FilterChips({required this.c});

  final WalletController c;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final f = c.filter.value;
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _chip(
              title: "All",
              active: f == TxFilter.all,
              onTap: () => c.setFilter(TxFilter.all),
            ),
            _chip(
              title: "Earned",
              active: f == TxFilter.earned,
              onTap: () => c.setFilter(TxFilter.earned),
            ),
            _chip(
              title: "Spent",
              active: f == TxFilter.spent,
              onTap: () => c.setFilter(TxFilter.spent),
            ),
            _chip(
              title: "Refunded",
              active: f == TxFilter.refunded,
              onTap: () => c.setFilter(TxFilter.refunded),
            ),
            _chip(
              title: "Expired",
              active: f == TxFilter.expired,
              onTap: () => c.setFilter(TxFilter.expired),
            ),
          ],
        ),
      );
    });
  }

  Widget _chip({
    required String title,
    required bool active,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: active ? AppColors.blackColor : AppColors.lightGrey,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: AppText(
              title: title,
              size: 14,
              fontWeight: FontWeight.w500,
              color: active ? AppColors.whiteColor : AppColors.black45,
            ),
          ),
        ),
      ),
    );
  }
}

class _TxTile extends StatelessWidget {
  const _TxTile({required this.item});

  final TxItem item;

  @override
  Widget build(BuildContext context) {
    final isPositive = item.amount >= 0;

    final amountColor = switch (item.kind) {
      TxKind.earned => const Color(0xFF0AA86C),
      TxKind.refunded => const Color(0xFF0AA86C),
      TxKind.spent => const Color(0xFFFF3B30),
      TxKind.expired => const Color(0xFFFF3B30),
    };

    final pillBg = amountColor.withOpacity(0.10);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.searchBorderColor),
      ),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: pillBg,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(item.icon, color: amountColor, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title: item.title,
                  size: 18,
                  color: AppColors.textBlackColor,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 7),
                AppText(
                  title: item.subtitle,
                  size: 14,
                  color: AppColors.black62,
                ),
                const SizedBox(height: 4),
                AppText(
                  title: item.date,
                  size: 12,
                  color: AppColors.unselectColor,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppText(
                title: "${isPositive ? '+' : ''}${item.amount}",
                size: 18,
                color: AppColors.redFE,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 2),
              AppText(
                title: _kindLabel(item.kind),
                size: 12,
                color: AppColors.black62,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _kindLabel(TxKind k) {
    switch (k) {
      case TxKind.earned:
        return "Earned";
      case TxKind.spent:
        return "Spent";
      case TxKind.refunded:
        return "Refunded";
      case TxKind.expired:
        return "Expired";
    }
  }
}

class SummaryBox extends StatelessWidget {
  const SummaryBox({
    required this.tint,
    required this.icon,
    required this.valueRx,
    required this.label,
  });

  final Color tint;
  final String icon;
  final RxInt valueRx;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: tint,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() {
            return AppText(
              title: "${valueRx.value}",
              size: 24,
              color: AppColors.textBlackColor,
              fontWeight: FontWeight.w700,
            );
          }),
          const SizedBox(height: 4),
          AppText(
            title: label,
            size: 12,
            color: AppColors.black45,
          ),
        ],
      ),
    );
  }
}