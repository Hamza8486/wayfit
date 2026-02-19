import 'package:get/get.dart';

class SearchFilterController extends GetxController {
  RxList<String> selectedTypes = <String>[].obs;
  RxList<String> selectedDates = <String>[].obs;

  final double minDistance = 1;
  final double maxDistance = 10;

  RxDouble selectedDistance = 6.0.obs;

  var selectedIndex = 0.obs;

  void setDistance(double value) {
    selectedDistance.value = value.clamp(minDistance, maxDistance);
  }

  void toggleType(String type) {
    if (selectedTypes.contains(type)) {
      selectedTypes.remove(type);
    } else {
      selectedTypes.add(type);
    }
  }

  void toggleDate(String date) {
    if (selectedDates.contains(date)) {
      selectedDates.remove(date);
    } else {
      selectedDates.add(date);
    }
  }

  void clearAll() {
    selectedTypes.clear();
    selectedDates.clear();
    selectedDistance.value = 6.0;
    selectedIndex.value = 0;
  }
}