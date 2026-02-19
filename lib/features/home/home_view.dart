import 'dart:math' as math;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/constatns/app_spacing.dart';
import 'package:wayfit/core/constatns/app_text_sizes.dart';

import 'package:wayfit/core/utils/app_text.dart';
import 'package:wayfit/features/discover/widgets/circle_icon_button.dart';
import 'package:wayfit/features/discover/widgets/dont_miss_card.dart';
import 'package:wayfit/features/discover/widgets/filter_row_data.dart';
import 'package:wayfit/features/home/home_controller.dart';
import 'package:wayfit/features/gym_detail_page/widgets/components.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController c = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 275,
            width: Get.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ).copyWith(
              gradient: AppColors.walletMainBarGradient,
              image: const DecorationImage(
                image: AssetImage("assets/images/wallet_back.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.horizontal),
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
                            Obx(() {
                              return AppText(
                                title: "${c.credits.value}",
                                size: 48,
                                color: AppColors.whiteColor,
                                letterSpacing: 0.35,
                                fontWeight: FontWeight.w700,
                              );
                            }),
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
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
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
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: c.onBuyCredits,
                    behavior: HitTestBehavior.opaque,
                    child: AppText(
                      title: "+ Add Credits",
                      size: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.horizontal,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 14),
                    AppText(
                      title: "Quick actions",
                      size: 20,
                      color: AppColors.textBlackColor,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: SummaryBox(
                            tint: AppColors.addColor,
                            icon: "qr_ic",
                            valueRx: c.janAdded,
                            label: "Scan QR",
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SummaryBox(
                            tint: AppColors.usedColor,
                            icon: "cal_ic",
                            valueRx: c.janUsed,
                            label: "Book class",
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SummaryBox(
                            tint: AppColors.expireColor,
                            icon: "wallet",
                            valueRx: c.janExpired,
                            label: "Wallet",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const _StreakCard(
                      streakDays: 4,
                      maxDays: 7,
                      subtitle: "Keep going\nbook a class to continue your streak",
                    ),
                    const SizedBox(height: 20),
                    SectionHeader(
                      title: "Your Schedule",
                      onSeeAll: () {},
                      padding: 0,
                    ),
                    const SizedBox(height: 16),
                    Obx(() {
                      final list = c.filteredTx;
                      return ListView.separated(
                        itemCount: list.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        primary: false,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (_, i) {
                          final t = list[i];
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: const Color(0xFFE9EEF5)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.06),
                                  blurRadius: 18,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 15, 10, 14),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                      "https://images.unsplash.com/photo-1517836357463-d25dfeac3438?w=900&auto=format&fit=crop&q=60",
                                      width: 100,
                                      height: 120,
                                      fit: BoxFit.cover,
                                      placeholder: (_, __) => Container(
                                        width: 100,
                                        height: 120,
                                        color: AppColors.lightGrey,
                                      ),
                                      errorWidget: (_, __, ___) => Container(
                                        width: 100,
                                        height: 120,
                                        color: AppColors.lightGrey,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 11),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.purpleDF,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 6,
                                          ),
                                          child: AppText(
                                            title: t.date,
                                            size: AppTextSizes.s12,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.purple64,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        AppText(
                                          title: t.title,
                                          size: AppTextSizes.s18,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.textBlackColor,
                                          maxLines: 1,
                                          overFlow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 5),
                                        _InfoRow(
                                          icon: "pin_ic",
                                          text: t.subtitle,
                                        ),
                                        const SizedBox(height: 5),
                                        _InfoRow(
                                          icon: "time_ic",
                                          text: "${t.amount.abs()} credits",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }),
                    const SizedBox(height: 20),
                    AppText(
                      title: "January Summary",
                      size: 20,
                      color: AppColors.textBlackColor,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: YearBox(
                            tint: AppColors.addColor,
                            icon: "added_ic",
                            valueRx: c.janAdded,
                            label: "8.5",
                            subTitle: "Hrs Active",
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: YearBox(
                            tint: AppColors.expireColor,
                            icon: "credit_ic",
                            valueRx: c.janUsed,
                            label: "156",
                            subTitle: "Credits Used",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    AppText(
                      title: "Insights",
                      size: 20,
                      color: AppColors.textBlackColor,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(height: 10),
                    const _InsightsCard(
                      title: "Monthly Check-ins",
                      subtitle: "Compare recent monthly",
                      points: [2, 4, 1, 5, 2, 3, 0, 2, 1, 2, 2, 3],
                      footerLeftLabel: "This week",
                      footerLeftValue: "3",
                      footerMidLabel: "Last week",
                      footerMidValue: "2",
                      footerRightLabel: "Change",
                      footerRightValue: "+1",
                    ),
                    const SizedBox(height: 10),
                    const _MonthlyGoalCard(
                      title: "Monthly Goal",
                      current: 6,
                      total: 8,
                      bottomText: "2 classes to go",
                      hintText: "Resets next month",
                    ),
                    const SizedBox(height: 20),
                    SectionHeader(
                      padding: 0,
                      title: "Popular classes near you",
                      onSeeAll: () {},
                    ),
                    const SizedBox(height: 10),
                    FilterChipsRow(
                      chips: const ['All', 'Yoga', 'Strength', 'HIIT', 'Cardio'],
                      initialSelected: 0,
                      padding: 0,
                      backColor: AppColors.blackColor,
                      onChanged: (i) {},
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 303,
                      child: ListView.separated(
                        clipBehavior: Clip.none,
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, i) => const DontMissCard(),
                        separatorBuilder: (_, __) => const SizedBox(width: 14),
                        itemCount: 5,
                      ),
                    ),
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

class SummaryBox extends StatelessWidget {
  const SummaryBox({
    super.key,
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
      height: 88,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: tint,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/$icon.svg",
            height: 20,
            width: 20,
            colorFilter: const ColorFilter.mode(
              Colors.black,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 5),
          AppText(
            title: label,
            size: 12,
            color: AppColors.black45,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}

class YearBox extends StatelessWidget {
  const YearBox({
    super.key,
    required this.tint,
    required this.icon,
    required this.valueRx,
    required this.label,
    required this.subTitle,
  });

  final Color tint;
  final String icon;
  final RxInt valueRx;
  final String label;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
      decoration: BoxDecoration(
        color: tint,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                "assets/icons/$icon.svg",
                height: 24,
                width: 24,
                colorFilter: const ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          AppText(
            title: label,
            size: 24,
            color: AppColors.blackColor,
            fontWeight: FontWeight.w700,
          ),
          const SizedBox(height: 4),
          AppText(
            title: subTitle,
            size: 12,
            color: AppColors.blackColor,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.text});

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/$icon.svg",
          height: 18,
          width: 18,
          colorFilter: ColorFilter.mode(AppColors.green25, BlendMode.srcIn),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: AppText(
            title: text,
            size: AppTextSizes.s14,
            fontWeight: FontWeight.w400,
            color: AppColors.black45,
            maxLines: 2,
            overFlow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _StreakCard extends StatelessWidget {
  const _StreakCard({
    required this.streakDays,
    required this.maxDays,
    required this.subtitle,
  });

  final int streakDays;
  final int maxDays;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.expireColor.withOpacity(0.45),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 65),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(14, 22, 14, 14),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE9EEF5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 18,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  AppText(
                    title: "${streakDays}-day streak",
                    size: 18,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textBlackColor,
                  ),
                  const SizedBox(height: 4),
                  AppText(
                    title: subtitle,
                    size: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black45,
                    textAlign: TextAlign.center,
                    height: 1.35,
                  ),
                  const SizedBox(height: 12),
                  _StreakBars(
                    filled: streakDays,
                    total: maxDays,
                    gap: 4,
                    cellSize: 20,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: SvgPicture.asset("assets/icons/streak_header.svg"),
            ),
          ),
        ],
      ),
    );
  }
}

class _StreakBars extends StatelessWidget {
  const _StreakBars({
    required this.filled,
    required this.total,
    this.cellSize = 20,
    this.gap = 8,
  });

  final int filled;
  final int total;
  final double cellSize;
  final double gap;

  @override
  Widget build(BuildContext context) {
    final days = const ["M", "T", "W", "T", "F", "S", "S"];
    final count = math.min(7, total);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(count, (i) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: gap / 2),
              child: SizedBox(
                width: cellSize,
                child: Center(
                  child: AppText(
                    title: days[i],
                    size: 11,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black62,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(count, (i) {
            final active = i < filled;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: gap / 2),
              child: SizedBox(
                width: cellSize,
                height: cellSize,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 240),
                  decoration: BoxDecoration(
                    color: active ? AppColors.green25 : const Color(0xFFE7EDF5),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(count, (i) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: gap / 2),
              child: SizedBox(
                width: cellSize,
                child: Center(
                  child: AppText(
                    title: "${10 - i}",
                    size: 10,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black62,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _InsightsCard extends StatelessWidget {
  const _InsightsCard({
    required this.title,
    required this.subtitle,
    required this.points,
    required this.footerLeftLabel,
    required this.footerLeftValue,
    required this.footerMidLabel,
    required this.footerMidValue,
    required this.footerRightLabel,
    required this.footerRightValue,
  });

  final String title;
  final String subtitle;
  final List<double> points;
  final String footerLeftLabel;
  final String footerLeftValue;
  final String footerMidLabel;
  final String footerMidValue;
  final String footerRightLabel;
  final String footerRightValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.addColor.withOpacity(0.55),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 31,
                width: 31,
                decoration: BoxDecoration(
                  color: AppColors.green25,
                  borderRadius: BorderRadius.circular(1000),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/icons/added_ic.svg",
                    height: 16,
                    width: 16,
                    colorFilter: ColorFilter.mode(
                      AppColors.whiteColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      title: title,
                      size: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBlackColor,
                    ),
                    const SizedBox(height: 2),
                    AppText(
                      title: subtitle,
                      size: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black62,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 140,
            width: double.infinity,
            child: CustomPaint(
              painter: _LineChartPainter(
                points: points,
                lineColor: AppColors.green25,
                gridColor: Colors.black.withOpacity(0.06),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _MiniStat(label: footerLeftLabel, value: footerLeftValue),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _MiniStat(label: footerMidLabel, value: footerMidValue),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _MiniStat(label: footerRightLabel, value: footerRightValue),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  const _MiniStat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61,
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withOpacity(0.65),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE9EEF5)),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              title: label,
              size: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.black62,
            ),
            const SizedBox(height: 2),
            AppText(
              title: value,
              size: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textBlackColor,
            ),
          ],
        ),
      ),
    );
  }
}

class _LineChartPainter extends CustomPainter {
  _LineChartPainter({
    required this.points,
    required this.lineColor,
    required this.gridColor,
  });

  final List<double> points;
  final Color lineColor;
  final Color gridColor;

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isEmpty) return;

    final pad = 12.0;
    final w = size.width - pad * 2;
    final h = size.height - pad * 2;

    final maxV = points.reduce(math.max);
    final minV = points.reduce(math.min);
    final range = (maxV - minV).abs() < 0.0001 ? 1.0 : (maxV - minV);

    final gridPaint = Paint()
      ..color = gridColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    for (int i = 0; i < 4; i++) {
      final y = pad + (h / 3) * i;
      canvas.drawLine(Offset(pad, y), Offset(pad + w, y), gridPaint);
    }

    final path = Path();
    for (int i = 0; i < points.length; i++) {
      final x = pad + (w * (i / (points.length - 1)));
      final norm = (points[i] - minV) / range;
      final y = pad + h - (norm * h);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        final prevX = pad + (w * ((i - 1) / (points.length - 1)));
        final prevNorm = (points[i - 1] - minV) / range;
        final prevY = pad + h - (prevNorm * h);
        final cx = (prevX + x) / 2;
        path.cubicTo(cx, prevY, cx, y, x, y);
      }
    }

    final linePaint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(path, linePaint);

    final lastX = pad + w;
    final lastNorm = (points.last - minV) / range;
    final lastY = pad + h - (lastNorm * h);

    final dotPaint = Paint()..color = lineColor;
    canvas.drawCircle(Offset(lastX, lastY), 4.5, dotPaint);

    final outline = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(Offset(lastX, lastY), 6.5, outline);
  }

  @override
  bool shouldRepaint(covariant _LineChartPainter oldDelegate) {
    return oldDelegate.points != points ||
        oldDelegate.lineColor != lineColor ||
        oldDelegate.gridColor != gridColor;
  }
}

class _MonthlyGoalCard extends StatelessWidget {
  const _MonthlyGoalCard({
    required this.title,
    required this.current,
    required this.total,
    required this.bottomText,
    required this.hintText,
  });

  final String title;
  final int current;
  final int total;
  final String bottomText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final progress = total == 0 ? 0.0 : (current / total).clamp(0.0, 1.0);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.purpleDF.withOpacity(0.85),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(1000),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/icons/fitness_ic.svg",
                    height: 16,
                    width: 16,
                    colorFilter: ColorFilter.mode(
                      AppColors.purple64,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: AppText(
                  title: title,
                  size: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlackColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 118,
            width: 118,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: const Size(118, 118),
                  painter: _RingPainter(
                    progress: progress,
                    trackColor: Colors.white.withOpacity(0.45),
                    progressColor: AppColors.purple64.withOpacity(0.6),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText(
                      title: "$current",
                      size: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBlackColor,
                    ),
                    AppText(
                      title: "$total classes",
                      size: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black62,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          AppText(
            title: bottomText,
            size: 14,
            fontWeight: FontWeight.w900,
            color: AppColors.textBlackColor,
          ),
          const SizedBox(height: 3),
          AppText(
            title: hintText,
            size: 11,
            fontWeight: FontWeight.w500,
            color: AppColors.black62,
          ),
        ],
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter({
    required this.progress,
    required this.trackColor,
    required this.progressColor,
  });

  final double progress;
  final Color trackColor;
  final Color progressColor;

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = 12.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (math.min(size.width, size.height) / 2) - stroke;

    final track = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;

    final prog = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      math.pi * 2,
      false,
      track,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      (math.pi * 2) * progress,
      false,
      prog,
    );

    final angle = -math.pi / 2 + (math.pi * 2) * progress;
    final knob = Offset(
      center.dx + radius * math.cos(angle),
      center.dy + radius * math.sin(angle),
    );

    final knobPaint = Paint()..color = Colors.white.withOpacity(0.95);
    canvas.drawCircle(knob, 6, knobPaint);

    final knobOutline = Paint()
      ..color = Colors.black.withOpacity(0.08)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(knob, 6, knobOutline);
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.trackColor != trackColor ||
        oldDelegate.progressColor != progressColor;
  }
}