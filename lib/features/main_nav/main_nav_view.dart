import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/utils/app_text.dart';
import 'package:wayfit/features/discover/discover_view.dart';
import 'package:wayfit/features/home/home_view.dart';
import 'package:wayfit/features/main_nav/main_nav_controller.dart';
import 'package:wayfit/features/profile/profile_view.dart';
import 'package:wayfit/features/schedule/schedule_view.dart';
import 'package:wayfit/features/wallet/wallet_view.dart';


class MainNavView extends StatelessWidget {
  const MainNavView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainNavController>();
    final pages = [
      const DiscoverView(),
       WalletView(),
      HomeView(),
      const MyScheduleView(),
      const ProfileView(),
    ];

    return GetBuilder<MainNavController>(
      id: MainNavController.mainNavId,
      builder: (_) {
        final index = controller.currentIndex;
        return Scaffold(
          body: IndexedStack(index: index, children: pages),
          bottomNavigationBar: _BottomBar(
            currentIndex: index,
            onTap: controller.changeTab,
          ),
        );
      },
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.currentIndex, required this.onTap});

  final int currentIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border(
          top: BorderSide(color: AppColors.searchBorderColor, width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _NavItem(
                label: 'Discover',
                asset: 'assets/icons/discover.svg',
                isSelected: currentIndex == 0,
                onTap: () => onTap(0),
              ),
              _NavItem(
                label: 'Wallet',
                asset: 'assets/icons/wallet_ic.svg',
                isSelected: currentIndex == 1,
                onTap: () => onTap(1),
              ),
              _NavItem(
                label: 'Home',
                asset: 'assets/icons/home_ic.svg',
                isSelected: currentIndex == 2,
                onTap: () => onTap(2),
              ),
              _NavItem(
                label: 'Schedule',
                asset: 'assets/icons/schedule_ic.svg',
                isSelected: currentIndex == 3,
                onTap: () => onTap(3),
              ),
              _NavItem(
                label: 'Profile',
                asset: 'assets/icons/profile_ic.svg',
                isSelected: currentIndex == 4,
                onTap: () => onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.label,
    required this.asset,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final String asset;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final labelColor = isSelected ? Colors.black : AppColors.unselectColor;
    final iconColor = isSelected ? Colors.white : AppColors.unselectColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 34,
              height: 34,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: isSelected ? AppColors.selectedBarGradient : null,
                color: isSelected ? null : Colors.transparent,
              ),
              child: SvgPicture.asset(
                asset,
                width: 22,
                height: 22,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              ),
            ),
            const SizedBox(height: 2),
            AppText(
              title: label,
              size: 12,
              fontWeight: FontWeight.w400,
              color: labelColor,
            ),
          ],
        ),
      ),
    );
  }
}