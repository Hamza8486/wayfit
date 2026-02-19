import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/utils/app_text.dart';
import 'package:wayfit/features/class_detail_page/class_detil_page.dart';

class UpcomingClassCard extends StatelessWidget {
  const UpcomingClassCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ClassDetailPage());
      },
      child: Container(
        height: 158,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: const Color(0xFFE9EEF5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 18,
              offset: const Offset(3, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        "https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=1200&auto=format&fit=crop&q=60",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
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
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AppText(
                          title: "Today: 3 spots left",
                          size: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textBlackColor,
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          "assets/icons/un_fav_ic.svg",
                          color: AppColors.green25,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    AppText(
                      title: "Morning Yoga Flow",
                      size: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.44,
                      color: AppColors.textBlackColor,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        AppText(
                          title: "Vinyasa",
                          size: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black45,
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 4,
                          width: 4,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.black62,
                          ),
                        ),
                        const SizedBox(width: 10),
                        AppText(
                          title: "45 min",
                          size: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black45,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(height: 1, color: Colors.grey.shade200),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: "",
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                          placeholder: (_, __) =>
                              Container(color: Colors.black),
                          errorWidget: (_, __, ___) => Image.asset(
                            "assets/images/person.png",
                            fit: BoxFit.cover,
                            width: 24,
                            height: 24,
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: AppText(
                            title: "Sarah",
                            size: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black45,
                          ),
                        ),
                        Container(
                          height: 28,
                          width: 59,
                          decoration: BoxDecoration(
                            gradient: AppColors.selectedBarGradient,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: AppText(
                              title: "View",
                              letterSpacing: 0,
                              size: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
