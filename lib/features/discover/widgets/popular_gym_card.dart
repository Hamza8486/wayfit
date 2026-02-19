import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/utils/app_text.dart';

import 'package:wayfit/features/discover/widgets/circle_icon_button.dart';
import 'package:wayfit/features/gym_detail_page/gym_detail.dart';

Widget popularCardGym({
  double? width,
  double? height,
  double? textSize,
  bool isSmallCard = false,
}) {
  final w = width ?? Get.width;
  final h = height ?? 192;
  final isGridTiny = h <= 90;

  return GestureDetector(
    onTap: () => Get.to(GymDetailsView()),
    child: SizedBox(
      width: w,
      height: h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              "https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=1200&auto=format&fit=crop&q=60",
              fit: BoxFit.cover,
            ),
            // gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.45),
                    Colors.black.withOpacity(0.75),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                isGridTiny ? 10 : (isSmallCard ? 12 : 16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // top row
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isGridTiny ? 8 : (isSmallCard ? 10 : 12),
                          vertical: isGridTiny ? 3 : (isSmallCard ? 4 : 6),
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
                              color: Color(0x40000000),
                            ),
                          ],
                        ),
                        child: AppText(
                          title: "Yoga",
                          size: isGridTiny ? 10 : 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      const Spacer(),
                      CircleIconButton(
                        icon: "un_fav_ic.svg",
                        backColor: Colors.black.withOpacity(0.4),
                        colorFilter: ColorFilter.mode(
                          AppColors.whiteColor,
                          BlendMode.srcIn,
                        ),
                        size: isGridTiny ? 30 : (isSmallCard ? 32 : 40),
                        imageSize: isGridTiny ? 14 : (isSmallCard ? 16 : null),
                        onTap: () {},
                      ),
                    ],
                  ),
                  if (!isGridTiny) const Spacer(),
                  if (isGridTiny) const SizedBox(height: 6),
                  AppText(
                    title: "PowerHouse Gym",
                    size: isGridTiny ? 13 : 18,
                    letterSpacing: -0.44,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    maxLines: 1,
                    overFlow: TextOverflow.ellipsis,
                  ),
                  if (!isGridTiny) const SizedBox(height: 8),
                  if (!isGridTiny)
                    Row(
                      children: [
                        Expanded(
                          child: AppText(
                            title: "Strength Training\nPower Lifting",
                            size: textSize ?? 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            letterSpacing: -0.15,
                            maxLines: 1,
                            overFlow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
