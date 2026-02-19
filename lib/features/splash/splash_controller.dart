import 'package:get/get.dart';
import 'package:wayfit/routes/pages.dart';

class SplashController extends GetxController {
  bool _navigated = false;

  Future<void> _navigateToNext() async {
    if (_navigated) return;
    _navigated = true;

    await Future.delayed(const Duration(seconds: 3));

    if (isClosed) return;

    Get.offAllNamed(AppRoutes.landing);
  }

  @override
  void onInit() {
    super.onInit();
    _navigateToNext();
  }
}
