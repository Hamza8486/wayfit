import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  final int count;
  final int activeIndex;

  const DotsIndicator({
    super.key,
    required this.count,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(count, (i) {
        final bool active = i == activeIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.only(right: 8),
          width: active ? 15 : 7,
          height: 7,
          decoration: BoxDecoration(
            color: active ? Colors.white : Colors.white.withOpacity(0.35),
            borderRadius: BorderRadius.circular(999),
          ),
        );
      }),
    );
  }
}
