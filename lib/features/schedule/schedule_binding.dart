import 'package:get/get.dart';
import 'package:wayfit/features/schedule/schedule_controller.dart';

class ScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScheduleController>(() => ScheduleController(), fenix: true);

  }
}