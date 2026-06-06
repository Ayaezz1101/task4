import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:task4/provider/coffee_providor.dart';
import 'package:task4/theme/app_theme.dart';
import 'package:task4/widget/icon_button.dart';
import 'package:task4/widget/driver_info.dart';
import 'package:task4/widget/feature_icon.dart';
import 'package:task4/widget/indicator.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  LatLng _driverPos = const LatLng(33.5138, 36.2765);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CoffeeProvider>(context);
    final userPos = provider.userLocation;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: FlutterMap(
              options: MapOptions(initialCenter: _driverPos, initialZoom: 14.0),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c', 'd'],
                ),

                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: [_driverPos, userPos],
                      color: AppTheme.primaryCoffee,
                      strokeWidth: 4.0,
                    ),
                  ],
                ),

                MarkerLayer(
                  markers: [
                    Marker(
                      point: _driverPos,
                      width: 45.w,
                      height: 45.h,
                      child: _buildDriverIcon(),
                    ),

                    Marker(
                      point: userPos,
                      width: 45.w,
                      height: 45.h,
                      child: Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 35.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _buildUIOverlays(context),
        ],
      ),
    );
  }

  Widget _buildDriverIcon() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
      ),
      child: Icon(Icons.pedal_bike, color: AppTheme.primaryCoffee, size: 24.sp),
    );
  }

  Widget _buildUIOverlays(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 68.h,
          left: 24.w,
          right: 24.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleButton(
                icon: Icons.arrow_back_ios_new,
                color: Colors.white,
                onPressed: () => Navigator.pop(context),
              ),
              CircleButton(
                icon: Icons.gps_fixed,
                color: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
        ),
        Align(alignment: Alignment.bottomCenter, child: _buildBottomSheet()),
      ],
    );
  }

  Widget _buildBottomSheet() {
    return Container(
      width: 375.w,
      height: 322.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        children: [
          SizedBox(height: 16.h),
          Container(
            width: 45.w,
            height: 5.h,
            decoration: BoxDecoration(
              color: const Color(0xFFE3E3E3),
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            "10 minutes left",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 12.sp, fontFamily: 'Sora'),
              children: [
                const TextSpan(
                  text: "Delivery to ",
                  style: TextStyle(color: Color(0xFF242424)),
                ),
                TextSpan(
                  text: "Jl. Kpg Sutoyo",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF242424),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                StatusStep(isActive: true),
                StatusStep(isActive: true),
                StatusStep(isActive: true),
                StatusStep(isActive: false),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          _buildOrderStateBox(),
          SizedBox(height: 14.h),
          const DriverInfoTile(),
        ],
      ),
    );
  }

  Widget _buildOrderStateBox() {
    return Container(
      width: 327.w,
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE3E3E3)),
      ),
      child: Row(
        children: [
          const FeatureIconWidget(icon: Icons.pedal_bike),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Delivered your order",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "We will deliver your goods to you in the shortest possible time.",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xFFA2A2A2),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
