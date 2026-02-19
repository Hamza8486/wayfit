import 'package:get/get.dart';

class MainNavController extends GetxController {
  static const String mainNavId = 'main_nav';

  int currentIndex = 0;

  void changeTab(int index) {
    if (currentIndex == index) return;
    currentIndex = index;
    update([mainNavId]);
  }
}