import 'package:get/get.dart';
import 'main_nav_controller.dart';
import 'package:wayfit/features/home/home_controller.dart';
import 'package:wayfit/features/wallet/wallet_controller.dart';
import 'package:wayfit/features/discover/discover_controller.dart';
import 'package:wayfit/features/schedule/schedule_controller.dart';
import 'package:wayfit/features/profile/profile_controller.dart';

class MainNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainNavController>(() => MainNavController(), fenix: true);
    Get.lazyPut<DiscoverController>(() => DiscoverController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<WalletController>(() => WalletController(), fenix: true);
    Get.lazyPut<ScheduleController>(() => ScheduleController(), fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
  }
}