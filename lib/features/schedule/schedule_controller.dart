import 'package:get/get.dart';

enum ScheduleTab { upcoming, past, cancelled }

class ScheduleController extends GetxController {
  final Rx<ScheduleTab> tab = ScheduleTab.upcoming.obs;
  final RxInt credits = 108.obs;

  final List<String> upcoming = List.generate(10, (i) => "Upcoming $i");
  final List<String> past = List.generate(6, (i) => "Past $i");
  final List<String> cancelled = List.generate(3, (i) => "Cancelled $i");

  void setTab(ScheduleTab t) {
    if (tab.value == t) return;
    tab.value = t;
  }

  List<String> get currentList {
    switch (tab.value) {
      case ScheduleTab.upcoming:
        return upcoming;
      case ScheduleTab.past:
        return past;
      case ScheduleTab.cancelled:
        return cancelled;
    }
  }

  void setCredits(int v) => credits.value = v;
}