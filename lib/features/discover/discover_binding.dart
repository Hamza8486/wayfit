import 'package:get/get.dart';
import 'package:wayfit/features/discover/discover_controller.dart';
import 'package:wayfit/features/home/home_controller.dart';

class DiscoverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiscoverController>(() => DiscoverController(), fenix: true);

  }
}