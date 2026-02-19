import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/features/profile/widgets/profile_widgets.dart';
import 'profile_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (c) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: Stack(
            children: [
              GetBuilder<ProfileController>(
                id: ProfileController.headerId,
                builder: (_) => ProfileHeader(controller: c),
              ),
              Column(
                children: [
                  SizedBox(height: c.sheetTopGap(context)),
                  Expanded(child: ProfileSheet(controller: c)),
                ],
              ),
              Positioned(
                top: c.badgeTop(context),
                left: 0,
                right: 0,
                child: const Center(child: PremiumBadge()),
              ),
            ],
          ),
        );
      },
    );
  }
}