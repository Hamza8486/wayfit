import 'package:flutter/material.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/constatns/app_spacing.dart';

import 'package:wayfit/core/utils/app_text.dart';

class FilterChipsRow extends StatefulWidget {
  const FilterChipsRow({
    required this.chips,
    required this.initialSelected,
    required this.onChanged,
    this.padding,
    this.backColor,
    this.gradient,
  });

  final List<String> chips;
  final int initialSelected;
  final ValueChanged<int> onChanged;
  final double? padding;
  final Gradient? gradient;
  final Color? backColor;

  @override
  State<FilterChipsRow> createState() => FilterChipsRowState();
}

class FilterChipsRowState extends State<FilterChipsRow> {
  late int selected;

  @override
  void initState() {
    super.initState();
    selected = widget.initialSelected;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: widget.padding ?? AppSpacing.horizontal,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: widget.chips.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final isSelected = selected == i;
          return InkWell(
            onTap: () {
              setState(() => selected = i);
              widget.onChanged(i);
            },
            borderRadius: BorderRadius.circular(14),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                gradient: isSelected
                    ? widget.backColor == null
                          ? widget.gradient ?? AppColors.selectedBarGradient
                          : null
                    : null,
                color: isSelected ? widget.backColor : AppColors.lightGrey,
              ),
              child: Center(
                child: AppText(
                  title: widget.chips[i],
                  size: 14,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.white : AppColors.darkGrey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
