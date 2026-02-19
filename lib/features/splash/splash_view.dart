import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wayfit/core/utils/app_text.dart';
import 'package:wayfit/features/splash/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return const Scaffold(
          body: Center(
            child: AppText(
              title: "WayFit",
              size: 24,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      },
    );
  }
}