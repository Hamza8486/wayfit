import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GymDetailsController extends GetxController {
  final scrollController = ScrollController();
  final selectedTab = 0.obs;

  double safeTopInset = 0;

  final aboutKey = GlobalKey();
  final contactKey = GlobalKey();
  final mapKey = GlobalKey();
  final amenitiesKey = GlobalKey();
  final classesKey = GlobalKey();

  List<GlobalKey> get keys => [
    aboutKey,
    contactKey,
    mapKey,
    amenitiesKey,
    classesKey,
  ];

  double pinnedHeaderHeight = 0;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_onScroll);
  }

  @override
  void onClose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.onClose();
  }

  void onTabTap(int index) async {
    selectedTab.value = index;

    final ctx = keys[index].currentContext;
    if (ctx == null) return;

    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeOutCubic,
      alignment: 0.0,
    );

    final target = scrollController.offset - pinnedHeaderHeight;
    if (target < 0) return;

    scrollController.animateTo(
      target,
      duration: const Duration(milliseconds: 1),
      curve: Curves.linear,
    );
  }

  void _onScroll() {
    final topY = pinnedHeaderHeight + 6;

    int bestIndex = selectedTab.value;
    double bestDistance = double.infinity;

    for (int i = 0; i < keys.length; i++) {
      final ctx = keys[i].currentContext;
      if (ctx == null) continue;

      final box = ctx.findRenderObject() as RenderBox?;
      if (box == null || !box.hasSize) continue;

      final pos = box.localToGlobal(Offset.zero).dy;
      final dist = (pos - topY).abs();

      if (pos <= topY + 90 && dist < bestDistance) {
        bestDistance = dist;
        bestIndex = i;
      }
    }

    if (bestIndex != selectedTab.value) {
      selectedTab.value = bestIndex;
    }
  }
}
