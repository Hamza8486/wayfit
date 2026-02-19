import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/constatns/app_spacing.dart';

import 'package:wayfit/core/utils/app_btn.dart';
import 'package:wayfit/core/utils/app_field.dart';
import 'package:wayfit/core/utils/app_text.dart';
import 'package:wayfit/core/utils/main_app_bar.dart';
import 'package:wayfit/features/search/map_screen.dart';
import 'package:wayfit/features/search/search_controller.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({super.key});

  final SearchFilterController c = Get.put(SearchFilterController());

  Future<DateTime?> showWayfitDatePicker(BuildContext context) {
    const primary = Color(0xFF6CFEB7);
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: primary,
              onPrimary: Colors.black,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBarWidget(
        title: "Search Filters",
        showDivider: true,
        horizontalPadding: 0,
        suffix: GestureDetector(
          onTap: c.clearAll,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.greenD0,
              borderRadius: BorderRadius.circular(1000),
              border: Border.all(color: AppColors.green5E),
            ),
            child: AppText(
              title: "Reset Filter",
              size: 12,
              color: AppColors.green00,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: AppField(
                      hint: "Search for gyms..",
                      fillColor: const Color(0xffF0F1F5),
                      radius: 16,
                      readOnly: true,
                      filled: true,
                      suffix: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: SvgPicture.asset(
                              "assets/icons/search_ic.svg",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: Get.width,
                    decoration: BoxDecoration(color: AppColors.purpleEC),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.horizontal,
                        vertical: 24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            title: "What are you looking for?",
                            size: 20,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w700,
                          ),
                          const SizedBox(height: 5),
                          AppText(
                            title: "Choose one to get started",
                            size: 14,
                            color: AppColors.black45,
                            fontWeight: FontWeight.w400,
                          ),
                          const SizedBox(height: 14),
                          Obx(() {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: chooseSection(
                                    title: "Gyms",
                                    subtitle: "Find gyms and\nfitness centers",
                                    icon: "gym_icon",
                                    isSelected: c.selectedIndex.value == 0,
                                    onTap: () => c.selectedIndex.value = 0,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: chooseSection(
                                    title: "Classes",
                                    subtitle: "Browse fitness\nclasses",
                                    icon: "calendar",
                                    isSelected: c.selectedIndex.value == 1,
                                    onTap: () => c.selectedIndex.value = 1,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: chooseSection(
                                    title: "Instructors",
                                    subtitle: "Find expert\ntrainers",
                                    icon: "profile",
                                    isSelected: c.selectedIndex.value == 2,
                                    onTap: () => c.selectedIndex.value = 2,
                                  ),
                                ),
                              ],
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSpacing.horizontal),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.greyFF,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: AppColors.greyE5,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/icons/loc_fill_icon.svg"),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      title: "Select Location",
                                      size: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textBlackColor,
                                    ),
                                    const SizedBox(height: 6),
                                    AppText(
                                      title: "Choose your area",
                                      size: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.grey6A,
                                    ),
                                  ],
                                ),
                              ),
                              SvgPicture.asset("assets/icons/forwad_ic.svg"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildFilterSection(
                          title: "Type",
                          options: const [
                            "Gym",
                            "Studio",
                            "Yoga Center",
                            "Spin Studio",
                            "CrossFit Box",
                            "Pilates Studio",
                          ],
                          selectedList: c.selectedTypes,
                          onChanged: c.toggleType,
                        ),
                        const SizedBox(height: 24),
                        Obx(() {
                          return DistanceRangeSlider(
                            min: c.minDistance,
                            max: c.maxDistance,
                            value: c.selectedDistance.value,
                            gradient: AppColors.mainBarGradient,
                            onChanged: c.setDistance,
                          );
                        }),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            AppText(
                              title: "Date",
                              size: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textBlackColor,
                            ),
                            const SizedBox(width: 5),
                            AppText(
                              title: "(optional)",
                              size: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.blackColor,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        AppField(
                          hint: "Last 7 Days",
                          fillColor: const Color(0xffF0F1F5),
                          radius: 16,
                          readOnly: true,
                          filled: true,
                          onTap: () async {
                            final picked = await showWayfitDatePicker(context);
                            if (picked == null) return;
                          },
                          suffix: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 0),
                                child: SvgPicture.asset(
                                  "assets/icons/calendar_outline.svg",
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        _buildFilterSection(
                          title: "Class Timing",
                          options: const [
                            "10:00 AM",
                            "8:30 AM",
                            "9:00 AM",
                            "9:30 AM",
                          ],
                          selectedList: c.selectedDates,
                          onChanged: c.toggleDate,
                        ),
                        const SizedBox(height: 24),
                        _buildFilterSection(
                          title: "Duration",
                          options: const [
                            "30 Mins",
                            "40 Mins",
                            "50 Mins",
                            "60 Mins",
                          ],
                          selectedList: c.selectedDates,
                          onChanged: c.toggleDate,
                        ),
                        const SizedBox(height: 18),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: AppBtn(
                    onPressed: c.clearAll,
                    text: "Clear",
                    fontColor: AppColors.textBlackColor,
                    bgColor: Colors.white,
                    borderColor: AppColors.searchBorderColor,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: AppBtn(
                    onPressed: () => Get.to(const MapListingScreen()),
                    text: "Apply Filter",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection({
    required String title,
    required List<String> options,
    required RxList<String> selectedList,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title: title,
          size: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.textBlackColor,
        ),
        const SizedBox(height: 12),
        Obx(() {
          return SizedBox(
            width: Get.width,
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 10,
              runSpacing: 10,
              children: options.map((option) {
                final selected = selectedList.contains(option);
                return GestureDetector(
                  onTap: () => onChanged(option),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 9,
                    ),
                    decoration: BoxDecoration(
                      gradient: selected ? AppColors.classChipGradient : null,
                      borderRadius: BorderRadius.circular(14),
                      color: selected ? null : AppColors.lightGrey,
                    ),
                    child: AppText(
                      title: option,
                      size: 14,
                      letterSpacing: -0.15,
                      color: AppColors.darkGrey,
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        }),
      ],
    );
  }
}

Widget chooseSection({
  String title = "",
  String subtitle = "",
  String icon = "",
  VoidCallback? onTap,
  bool isSelected = false,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 150,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? Colors.transparent : AppColors.greyD9,
          width: 1,
        ),
        gradient: isSelected ? AppColors.selectedBarGradient : null,
        color: isSelected ? null : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/$icon.svg", height: 28, width: 28),
            const SizedBox(height: 14),
            AppText(
              title: title,
              size: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textBlackColor,
            ),
            const SizedBox(height: 7),
            AppText(title: subtitle, size: 10, color: AppColors.black45),
          ],
        ),
      ),
    ),
  );
}

class DistanceRangeSlider extends StatelessWidget {
  const DistanceRangeSlider({
    super.key,
    this.min = 1,
    this.max = 10,
    required this.value,
    required this.gradient,
    this.onChanged,
  });

  final double min;
  final double max;
  final double value;
  final Gradient gradient;
  final ValueChanged<double>? onChanged;

  @override
  Widget build(BuildContext context) {
    final clamped = value.clamp(min, max);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            AppText(
              title: "Distance",
              size: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textBlackColor,
            ),
            const SizedBox(width: 5),
            AppText(
              title: "(optional)",
              size: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
          ],
        ),
        const SizedBox(height: 10),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 8,
            activeTrackColor: AppColors.blackColor,
            inactiveTrackColor: AppColors.lightGrey,
            overlayColor: Colors.transparent,
            thumbShape: GradientSliderThumbShape(
              radius: 16,
              gradient: gradient,
            ),
          ),
          child: Slider(
            min: min,
            max: max,
            value: clamped,
            onChanged: (v) => onChanged?.call(v),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              title: "${min.toInt()} KM",
              size: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.green58,
            ),
            AppText(
              title: "${max.toInt()} KM",
              size: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.green58,
            ),
          ],
        ),
      ],
    );
  }
}

class GradientSliderThumbShape extends SliderComponentShape {
  const GradientSliderThumbShape({required this.radius, required this.gradient});
  final double radius;
  final Gradient gradient;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => Size.fromRadius(radius);

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final canvas = context.canvas;
    final rect = Rect.fromCircle(center: center, radius: radius);
    final p = Paint()..shader = gradient.createShader(rect);
    canvas.drawCircle(center, radius, p);

    final border = Paint()
      ..color = Colors.white.withOpacity(0.85)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(center, radius - 1, border);
  }
}