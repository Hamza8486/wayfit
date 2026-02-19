import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static const headerId = 'profile_header';
  static const statsId = 'profile_stats';
  static const listId = 'profile_list';

  String name = "William John";
  String email = "alex.rivera@email.com";
  String avatarUrl =
      "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=600&auto=format&fit=crop&q=60";

  int credits = 120;
  int classes = 47;
  int streak = 12;

  double avatarSize(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return (w * 0.34).clamp(110.0, 150.0);
  }

  double headerHeight(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return (h * 0.44).clamp(320.0, 390.0);
  }

  double sheetTopGap(BuildContext context) {
    return 340;
  }

  double badgeTop(BuildContext context) {
    return 317;
  }

  void setCredits(int v) {
    credits = v;
    update([statsId]);
  }
}