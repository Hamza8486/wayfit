import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/constatns/app_spacing.dart';

import 'package:wayfit/core/utils/app_text.dart';
import 'package:wayfit/features/discover/widgets/filter_row_data.dart';
import 'package:wayfit/features/discover/widgets/upcoming_class_card.dart';
import 'package:wayfit/features/gym_detail_page/gym_detail_controller.dart';
import 'package:wayfit/features/gym_detail_page/widgets/components.dart'
    show infoCard, iconRow, chipPill;
import 'package:wayfit/features/gym_detail_page/widgets/gym_detail_header.dart';
import '../discover/widgets/circle_icon_button.dart';

class GymDetailsView extends StatelessWidget {
  const GymDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GymDetailsController>(
      init: GymDetailsController(),
      builder: (c) {
        final topInset = MediaQuery.of(context).padding.top;
        c.safeTopInset = topInset;

        const tabHeight = 50.0;
        c.pinnedHeaderHeight = topInset + tabHeight;

        return Scaffold(
          body: CustomScrollView(
            controller: c.scrollController,
            slivers: [
              SliverAppBar(
                pinned: false,
                floating: false,
                stretch: true,
                expandedHeight: 320 - topInset,
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                elevation: 0,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      gymDetailHeader(context),
                      Positioned(
                        top: topInset + 10,
                        left: AppSpacing.horizontal,
                        child: CircleIconButton(
                          icon: "back_ic.svg",
                          size: 44,
                          onTap: () => Get.back(),
                        ),
                      ),
                      Positioned(
                        top: topInset + 10,
                        right: AppSpacing.horizontal,
                        child: CircleIconButton(
                          icon: "un_fav_ic.svg",
                          size: 44,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: GymDetailTabsHeader(
                  controller: c,
                  tabs: const [
                    "About",
                    "Contact",
                    "Map",
                    "Amenities",
                    "Classes",
                  ],
                  height: tabHeight,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.horizontal,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      _SectionAnchor(
                        key: c.aboutKey,
                        child: infoCard(
                          title: 'About',
                          backColor: AppColors.purpleEC,
                          borderColor: AppColors.purpleC9,
                          child: AppText(
                            title:
                                'High-intensity CrossFit training with certified coaches. Build strength, endurance, and community in our supportive environment.',
                            size: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black45,
                            letterSpacing: -0.15,
                            height: 1.4,
                          ),
                        ),
                      ),
                      SizedBox(height: AppSpacing.vertical),

                      // CONTACT
                      _SectionAnchor(
                        key: c.contactKey,
                        child: infoCard(
                          title: 'Contact & Hours',
                          child: Column(
                            children: [
                              const SizedBox(height: 12),
                              iconRow(
                                icon: "pin_ic",
                                title: 'Address',
                                subtitle: '123 Fitness Ave, Downtown',
                              ),
                              const SizedBox(height: 12),
                              iconRow(
                                icon: "call_ic",
                                title: 'Phone',
                                subtitle: '+1 (555) 345-6789',
                              ),
                              const SizedBox(height: 12),
                              iconRow(
                                icon: "website_ic",
                                title: 'Website',
                                subtitle: 'crossfitcentral.com',
                                isLink: true,
                              ),
                              const SizedBox(height: 12),
                              iconRow(
                                icon: "time_ic",
                                title: 'Hours',
                                subtitle:
                                    'Mon-Fri: 5:00 AM - 10:00 PM\nSat-Sun: 7:00 AM - 8:00 PM',
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: AppSpacing.vertical),

                      _SectionAnchor(
                        key: c.mapKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: GoogleMap(
                                  initialCameraPosition: const CameraPosition(
                                    target: LatLng(33.6844, 73.0479),
                                    zoom: 14,
                                  ),
                                  markers: {
                                    const Marker(
                                      markerId: MarkerId("gym"),
                                      position: LatLng(33.6844, 73.0479),
                                    ),
                                  },
                                  myLocationButtonEnabled: false,
                                  zoomControlsEnabled: false,
                                  gestureRecognizers:
                                      <Factory<OneSequenceGestureRecognizer>>{}
                                          .toSet(),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: AppText(
                                    title:
                                        "1345 Parkview Avenue Manhattan Beach, CA, USA, 90266",
                                    size: 14,
                                    color: AppColors.black45,
                                  ),
                                ),
                                SvgPicture.asset(
                                  "assets/icons/direction_ic.svg",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppSpacing.vertical),

                      // AMENITIES
                      _SectionAnchor(
                        key: c.amenitiesKey,
                        child: infoCard(
                          title: 'Amenities',
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                chipPill(text: 'CrossFit Equipment'),
                                chipPill(text: 'Olympic Lifting Platform'),
                                chipPill(text: 'Open Gym'),
                                chipPill(text: 'Showers'),
                                chipPill(text: 'Free Parking'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // CLASSES
                      _SectionAnchor(
                        key: c.classesKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              title: "Available Classes",
                              size: 18,
                              letterSpacing: -0.44,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textBlackColor,
                            ),
                            const SizedBox(height: 16),
                            FilterChipsRow(
                              chips: const [
                                'All',
                                'Yoga',
                                'Strength',
                                'HIIT',
                                'Cardio',
                              ],
                              initialSelected: 0,
                              onChanged: (i) {},
                              backColor: AppColors.blackColor,
                              padding: 0,
                            ),
                            const SizedBox(height: 16),
                            ListView.builder(
                              itemCount: 5,
                              shrinkWrap: true,
                              primary: false,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    top: index == 0 ? 4 : 12,
                                  ),
                                  child: UpcomingClassCard(),
                                );
                              },
                            ),
                            const SizedBox(height: 14),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SectionAnchor extends StatelessWidget {
  const _SectionAnchor({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.topLeft,
      child: child,
    );
  }
}
