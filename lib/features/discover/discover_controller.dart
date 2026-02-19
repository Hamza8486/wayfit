import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscoverController extends GetxController {
  static const String dotsId = 'discover_dots';

  final PageController controllerPage = PageController();

  final List<String> imageUrls = [
    "assets/images/featured_1.png",
    "assets/images/featured_2.png",
    "assets/images/featured_3.png",
  ];

  int currentIndex = 0;

  void onPageChanged(int i) {
    currentIndex = i;
    update([dotsId]);
  }

  @override
  void onClose() {
    controllerPage.dispose();
    super.onClose();
  }
}