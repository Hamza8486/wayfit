import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wayfit/features/wallet/pages/buy_credits_view.dart';

enum TxFilter { all, earned, spent, refunded, expired }

class WalletController extends GetxController {
  final name = "Alex".obs;
  final credits = 108.obs;

  final nextRefreshLabel = "Next Refresh".obs;
  final nextRefreshDate = "Feb 28, 2026".obs;
  final nextRefreshAdd = 100.obs;

  final planTitle = "Premium Plan".obs;
  final planSubtitle = "Company Sponsored".obs;
  final planRenewDate = "Renews on Feb 28, 2026".obs;
  final planActive = true.obs;

  final janAdded = 150.obs;
  final janUsed = 156.obs;
  final janExpired = 5.obs;

  final filter = TxFilter.all.obs;

  final transactions = <TxItem>[
    TxItem(
      title: "Morning Yoga Flow",
      subtitle: "Zen Yoga Studio",
      date: "Jan 31, 2026",
      amount: -12,
      kind: TxKind.spent,
      icon: Icons.access_time_outlined,
    ),
    TxItem(
      title: "HIIT Bootcamp",
      subtitle: "CrossFit Central",
      date: "Jan 30, 2026",
      amount: -18,
      kind: TxKind.spent,
      icon: Icons.access_time,
    ),
    TxItem(
      title: "Monthly",
      subtitle: "Premium Plan Renewal",
      date: "Jan 28, 2026",
      amount: 100,
      kind: TxKind.earned,
      icon: Icons.credit_card,
    ),
    TxItem(
      title: "Pilates Class",
      subtitle: "Refund processed",
      date: "Jan 27, 2026",
      amount: 15,
      kind: TxKind.refunded,
      icon: Icons.refresh,
    ),
    TxItem(
      title: "Boxing Fundamentals",
      subtitle: "Iron Temple",
      date: "Jan 26, 2026",
      amount: -20,
      kind: TxKind.spent,
      icon: Icons.verified_outlined,
    ),
    TxItem(
      title: "Credits Expired",
      subtitle: "From December cycle",
      date: "Jan 25, 2026",
      amount: -5,
      kind: TxKind.expired,
      icon: Icons.cancel_outlined,
    ),
    TxItem(
      title: "Credit Purchase",
      subtitle: "One-time top-up",
      date: "Jan 20, 2026",
      amount: 5,
      kind: TxKind.earned,
      icon: Icons.add,
    ),
    TxItem(
      title: "Power Yoga Fusion",
      subtitle: "Serenity Yoga",
      date: "Jan 18, 2026",
      amount: -14,
      kind: TxKind.spent,
      icon: Icons.access_time_outlined,
    ),
  ].obs;

  List<TxItem> get filteredTx {
    final f = filter.value;
    if (f == TxFilter.all) return transactions;

    return transactions.where((t) {
      switch (f) {
        case TxFilter.earned:
          return t.kind == TxKind.earned;
        case TxFilter.spent:
          return t.kind == TxKind.spent;
        case TxFilter.refunded:
          return t.kind == TxKind.refunded;
        case TxFilter.expired:
          return t.kind == TxKind.expired;
        case TxFilter.all:
          return true;
      }
    }).toList();
  }

  void setFilter(TxFilter f) => filter.value = f;

  void onBuyCredits() {
    Get.to(() => const BuyCreditsView());
  }
}

enum TxKind { earned, spent, refunded, expired }

class TxItem {
  final String title;
  final String subtitle;
  final String date;
  final int amount;
  final TxKind kind;
  final IconData icon;

  const TxItem({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.amount,
    required this.kind,
    required this.icon,
  });
}