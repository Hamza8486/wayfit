import 'package:get/get.dart';
import 'package:wayfit/features/home/home_controller.dart';
import 'package:wayfit/features/profile/profile_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);

  }
}