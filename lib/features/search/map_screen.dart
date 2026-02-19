import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wayfit/core/constatns/app_colors.dart';
import 'package:wayfit/core/utils/app_text.dart';
import 'package:wayfit/core/utils/main_app_bar.dart';
import 'package:wayfit/features/discover/widgets/dont_miss_card.dart';

class MapListingScreen extends StatefulWidget {
  const MapListingScreen({super.key});

  @override
  State<MapListingScreen> createState() => _MapListingScreenState();
}

class _Venue {
  final String id;
  final LatLng latLng;
  final String title;
  const _Venue({required this.id, required this.latLng, required this.title});
}

class _MapListingScreenState extends State<MapListingScreen> {
  GoogleMapController? _mapController;
  LatLng? _currentLatLng;

  final PageController _pageController = PageController(viewportFraction: 0.86);

  final Set<Marker> _markers = {};
  final List<_Venue> _venues = [];

  Timer? _debounce;
  bool _isDragging = false;
  bool _isLoading = false;
  bool _showCountBanner = false;
  int _venueCount = 0;

  int? _selectedIndex;

  @override
  void initState() {
    super.initState();
    _initLocation();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _initLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever ||
        permission == LocationPermission.denied) {
      return;
    }

    final pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    final latLng = LatLng(pos.latitude, pos.longitude);

    setState(() {
      _currentLatLng = latLng;
    });

    _mapController?.animateCamera(CameraUpdate.newLatLngZoom(latLng, 15));
    await _refreshVenues(center: latLng);
  }

  Future<void> _goToCurrentLocation() async {
    if (_currentLatLng == null) {
      await _initLocation();
      return;
    }
    _mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(_currentLatLng!, 15),
    );
  }

  Future<void> _refreshVenues({required LatLng center}) async {
    setState(() {
      _isLoading = true;
      _showCountBanner = true;
      _selectedIndex = null;
    });

    await Future.delayed(const Duration(milliseconds: 650));

    final list = <_Venue>[
      _Venue(
        id: "v1",
        latLng: LatLng(center.latitude + 0.0015, center.longitude - 0.001),
        title: "Venue 1",
      ),
      _Venue(
        id: "v2",
        latLng: LatLng(center.latitude - 0.0012, center.longitude + 0.0013),
        title: "Venue 2",
      ),
      _Venue(
        id: "v3",
        latLng: LatLng(center.latitude + 0.0006, center.longitude + 0.0018),
        title: "Venue 3",
      ),
      _Venue(
        id: "v4",
        latLng: LatLng(center.latitude - 0.0019, center.longitude - 0.0009),
        title: "Venue 4",
      ),
    ];

    final newMarkers = list.map((v) {
      return Marker(
        markerId: MarkerId(v.id),
        position: v.latLng,
        onTap: () => _onMarkerTap(v.id),
      );
    }).toSet();

    setState(() {
      _venues
        ..clear()
        ..addAll(list);

      _markers
        ..clear()
        ..addAll(newMarkers);

      _venueCount = _venues.length;
      _isLoading = false;
      _isDragging = false;
    });
  }

  void _onMarkerTap(String id) {
    final idx = _venues.indexWhere((e) => e.id == id);
    if (idx < 0) return;

    setState(() {
      _selectedIndex = idx;
      _showCountBanner = false;
    });

    _pageController.animateToPage(
      idx,
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOut,
    );

    _mapController?.animateCamera(
      CameraUpdate.newLatLng(_venues[idx].latLng),
    );
  }

  void _onPageChanged(int index) {
    if (index < 0 || index >= _venues.length) return;
    setState(() {
      _selectedIndex = index;
      _showCountBanner = false;
    });
    _mapController?.animateCamera(
      CameraUpdate.newLatLng(_venues[index].latLng),
    );
  }

  void _onCameraMoveStarted() {
    _debounce?.cancel();
    setState(() {
      _isDragging = true;
      _isLoading = true;
      _showCountBanner = true;
      _selectedIndex = null;
    });
  }

  void _onCameraIdle() async {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 420), () async {
      final center = await _mapController?.getLatLng(
        ScreenCoordinate(
          x: (MediaQuery.of(context).size.width / 2).round(),
          y: (MediaQuery.of(context).size.height / 2).round(),
        ),
      );

      if (center == null) {
        setState(() {
          _isLoading = false;
          _isDragging = false;
        });
        return;
      }

      await _refreshVenues(center: center);
    });
  }

  @override
  Widget build(BuildContext context) {
    final initial = _currentLatLng ?? const LatLng(25.2048, 55.2708);

    return Scaffold(
      appBar: MainAppBarWidget(
        title: "Map",
        showDivider: true,
        horizontalPadding: 0,
        suffix: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.greenD0,
            borderRadius: BorderRadius.circular(1000),
            border: Border.all(color: AppColors.green5E),
          ),
          child: Row(
            children: [
              AppText(
                title: "Filter",
                size: 12,
                color: AppColors.green00,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(width: 10),
              SvgPicture.asset("assets/icons/filter_ic.svg"),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(target: initial, zoom: 14),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            markers: _markers,
            onMapCreated: (c) {
              _mapController = c;
              if (_currentLatLng != null) {
                c.animateCamera(
                  CameraUpdate.newLatLngZoom(_currentLatLng!, 15),
                );
              }
            },
            onCameraMoveStarted: _onCameraMoveStarted,
            onCameraIdle: _onCameraIdle,
          ),
          Positioned(
            left: 24,
            bottom: 210,
            child: GestureDetector(
              onTap: _goToCurrentLocation,
              child: Container(
                width: 65,
                height: 65,
                decoration:  BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.green25,
                ),
                child: const Icon(
                  Icons.near_me_rounded,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          ),
          if (_showCountBanner)
            Positioned(
              left: 16,
              right: 16,
              top: 14,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 24,
                      color: Colors.black.withOpacity(0.08),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    if (_isLoading)
                      SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.green25,
                          ),
                        ),
                      )
                    else
                      Icon(
                        Icons.check_circle_outline,
                        size: 18,
                        color: AppColors.green25,
                      ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: AppText(
                        title: _isLoading
                            ? "finding venue available near you"
                            : "We found $_venueCount venues",
                        size: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textBlackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (_selectedIndex != null && !_isDragging && _venues.isNotEmpty)
            Positioned(
              left: 0,
              right: 0,
              bottom: 18,
              child: SizedBox(
                height: 320,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _venues.length,
                  onPageChanged: _onPageChanged,
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: i == 0 ? 16 : 8,
                        right: i == _venues.length - 1 ? 16 : 8,
                      ),
                      child: DontMissCard(width: Get.width),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}