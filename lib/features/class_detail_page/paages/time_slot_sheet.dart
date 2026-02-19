import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/utils/app_btn.dart';
import 'package:wayfit/core/utils/app_text.dart';
import 'package:wayfit/features/confirm_booking/booking_sucess.dart';

Future<void> showTimeSlotBottomSheet(BuildContext context) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withOpacity(0.30),
    useSafeArea: true,
    builder: (_) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.5, sigmaY: 5.5),
        child: const TimeSlotsSelection(),
      );
    },
  );
}

class TimeSlotsSelection extends StatefulWidget {
  const TimeSlotsSelection({super.key});

  @override
  State<TimeSlotsSelection> createState() => _TimeSlotsSelectionState();
}

class _TimeSlotsSelectionState extends State<TimeSlotsSelection> {
  final Set<int> selectedIndexes = {};

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final screenH = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: screenH * 0.65),
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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 18, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                title: "Select Time Slots",
                                size: 28,
                                fontWeight: FontWeight.w700,
                                color: AppColors.blackColor,
                              ),
                              const SizedBox(height: 10),
                              AppText(
                                title: "Choose one or multiple slots",
                                size: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black45,
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          borderRadius: BorderRadius.circular(14),
                          child: const Padding(
                            padding: EdgeInsets.all(6),
                            child: Icon(Icons.close),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Expanded(
                      child: ListView.separated(
                        itemCount: 5,
                        padding: EdgeInsets.zero,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (_, index) {
                          final selected = selectedIndexes.contains(index);
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selected) {
                                  selectedIndexes.remove(index);
                                } else {
                                  selectedIndexes.add(index);
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.primary,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: AppColors.greyD9,
                                    width: 1,
                                  ),
                                ),
                                margin: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                              title: "8:00 AM - 9:00 AM",
                                              size: 16,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.textBlackColor,
                                              letterSpacing: -0.3,
                                            ),
                                            const SizedBox(height: 4),
                                            AppText(
                                              title: "3 spots left",
                                              size: 14,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.black45,
                                            ),
                                          ],
                                        ),
                                      ),
                                      AnimatedContainer(
                                        duration: const Duration(
                                          milliseconds: 200,
                                        ),
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          color: selected
                                              ? AppColors.green25
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                          border: Border.all(
                                            color: selected
                                                ? AppColors.green25
                                                : AppColors.greyB8,
                                            width: 1,
                                          ),
                                        ),
                                        child: selected
                                            ? const Icon(
                                                Icons.check,
                                                color: Colors.white,
                                                size: 16,
                                              )
                                            : null,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: AppBtn(
                            text: "Cancel",
                            bgColor: AppColors.whiteColor,
                            borderColor: AppColors.green25.withOpacity(0.4),
                            fontColor: AppColors.darkGrey,
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        const SizedBox(width: 11),
                        Expanded(
                          child: AppBtn(
                            text: "Continue",
                            onPressed: () {
                              Navigator.pop(context);
                              showSuccessBookingBottomSheet(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
