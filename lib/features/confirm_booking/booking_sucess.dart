import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/utils/app_btn.dart';
import 'package:wayfit/core/utils/app_text.dart';

Future<void> showSuccessBookingBottomSheet(BuildContext context) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withOpacity(0.30),
    useSafeArea: true,
    builder: (_) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.5, sigmaY: 5.5),
        child: const SuccessBookingSheetBottom(),
      );
    },
  );
}

class SuccessBookingSheetBottom extends StatelessWidget {
  const SuccessBookingSheetBottom({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(31),
            topRight: Radius.circular(31),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.18),
              blurRadius: 30,
              offset: const Offset(0, -10),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 18, 24, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 10),
                    AppText(
                      title: "# ID: 042342345",
                      size: 14,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black45,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Container(
                  height: 96,
                  width: 96,
                  decoration: BoxDecoration(
                    gradient: AppColors.mainBarGradient,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.18),
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: const Offset(0, 5),
                      ),
                      BoxShadow(
                        color: AppColors.green25.withOpacity(0.25),
                        blurRadius: 5,
                        spreadRadius: 0,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Center(
                    child: SvgPicture.asset("assets/icons/done_ic.svg"),
                  ),
                ),
                const SizedBox(height: 17),
                Center(
                  child: AppText(
                    title: "Bookings Confirmed!",
                    size: 24,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textBlackColor,
                  ),
                ),
                const SizedBox(height: 7),
                AppText(
                  title: "You're all set for 3 sessions of",
                  size: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black45,
                ),
                const SizedBox(height: 7),
                AppText(
                  title: "Morning Yoga Flow",
                  size: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.green25,
                ),
                const SizedBox(height: 17),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.greyF3,
                    border: Border.all(color: AppColors.greyDD),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/cal_ic.svg",
                                height: 16,
                                width: 16,
                                colorFilter: ColorFilter.mode(
                                  AppColors.green25,
                                  BlendMode.srcIn,
                                ),
                              ),
                              SizedBox(width: 10),
                              AppText(
                                title: "Date & Time",
                                size: 14,
                                color: AppColors.darkGrey,
                              ),
                            ],
                          ),
                          AppText(
                            title: "36cr",
                            size: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.green25,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        height: 1,
                        color: AppColors.searchBorderColor.withOpacity(0.8),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/credit.svg"),
                              SizedBox(width: 10),
                              AppText(
                                title: "Remaining Credits",
                                size: 14,
                                color: AppColors.darkGrey,
                              ),
                            ],
                          ),
                          AppText(
                            title: "84 credits",
                            size: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textBlackColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Column(
                  children: [
                    AppBtn(
                      text: "View Schedule",
                      fontSize: 16,
                      onPressed: () {
                        // TODO action
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(height: 12),
                    AppBtn(
                      text: "Done",
                      bgColor: AppColors.whiteColor,
                      fontColor: AppColors.darkGrey,
                      widthBorder: 2,
                      borderColor: AppColors.searchBorderColor,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
