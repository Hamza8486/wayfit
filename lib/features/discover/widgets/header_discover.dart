import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/constatns/app_spacing.dart';
import 'package:wayfit/core/constatns/app_text_sizes.dart';

import 'package:wayfit/core/utils/app_text.dart';
import 'package:wayfit/features/discover/widgets/circle_icon_button.dart';
import 'package:wayfit/features/search/search_view.dart';

Widget headerTopBarData({bool isSearch = true, required BuildContext context}) {
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
      gradient: AppColors.mainBarGradient,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.horizontal,
        vertical: 22,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        AppText(
                          title: "wayfit",
                          size: 23,
                          fontWeight: FontWeight.w700,
                        ),
                        AppText(
                          title: "co.",
                          size: 23,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.purpleF3,
                          ),
                          child: CachedNetworkImage(
                            imageUrl: "",
                            width: 52,
                            height: 52,
                            fit: BoxFit.cover,
                            placeholder: (_, __) =>
                                Container(color: Colors.black),
                            errorWidget: (_, __, ___) => Image.asset(
                              "assets/images/person.png",
                              fit: BoxFit.cover,
                              width: 52,
                              height: 52,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                title: "Laura Smith",
                                size: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              AppText(
                                title: "Good Morning",
                                size: AppTextSizes.s18,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColors.whiteColor,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/icons/noti_ic.svg",
                              height: 22,
                              width: 22,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Center(
            child: AppText(
              title: "Total Ways",
              size: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: AppText(
              title: "3,500.00",
              size: 36,
              fontWeight: FontWeight.w600,
            ),
          ),
          isSearch == false
              ? SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: searchBarDiscover(
                    onTap: () {
                      Get.to(FilterScreen());
                    },
                  ),
                ),
        ],
      ),
    ),
  );
}
