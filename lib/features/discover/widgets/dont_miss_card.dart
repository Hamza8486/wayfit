import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/utils/app_text.dart';

class DontMissCard extends StatelessWidget {
  const DontMissCard({super.key, this.width});

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 320,
      height: 303,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE9EEF5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            child: Stack(
              children: [
                SizedBox(
                  height: 128,
                  width: double.infinity,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1517832207067-4db24a2ae47c?w=1200&auto=format&fit=crop&q=60",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 12,
                  top: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.blackColor.withOpacity(0.6),
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.6),
                        width: 1.2,
                      ),
                      borderRadius: BorderRadius.circular(1000),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          spreadRadius: 0,
                          color: Color(0x40000000),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        AppText(
                          title: "12",
                          size: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.whiteColor,
                        ),
                        SizedBox(width: 6),
                        SvgPicture.asset(
                          "assets/icons/reward_green_ic.svg",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 11,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.purpleDF,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppText(
                                title: "Strength",
                                size: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.purple64,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        AppText(
                          title: "55 min",
                          size: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black62,
                        ),
                      ],
                    ),
                    Container(
                      height: 32,
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              title: "Today",
                              size: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black62,
                            ),
                            AppText(
                              title: "7 Slot Avail",
                              size: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textBlackColor,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                AppText(
                  title: "Pilates Core Strengthening",
                  size: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.31,
                  color: AppColors.textBlackColor,
                ),
                const SizedBox(height: 4),
                AppText(
                  title: "Iron Temple",
                  size: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black62,
                ),
                SizedBox(height: 12),
                Container(height: 1, color: Colors.grey.shade200),
                const SizedBox(height: 7),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.purpleF3,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CachedNetworkImage(
                          imageUrl: "",
                          width: 32,
                          height: 32,
                          fit: BoxFit.cover,
                          placeholder: (_, __) => Container(color: Colors.black),
                          errorWidget: (_, __, ___) => Image.asset(
                            "assets/images/person.png",
                            fit: BoxFit.cover,
                            width: 32,
                            height: 32,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            title: "Laura Smith",
                            size: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black45,
                          ),
                          AppText(
                            title: "Instructor",
                            size: 10,
                            fontWeight: FontWeight.w400,
                            color: AppColors.unselectColor,
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset("assets/icons/next_gradient_icon.svg")
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}