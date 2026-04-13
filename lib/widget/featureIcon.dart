import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeatureIconWidget extends StatelessWidget {
  final IconData icon; 
  const FeatureIconWidget({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.w,
      height: 44.h,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEDED).withOpacity(0.35),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(icon, color: const Color(0xFFC67C4E), size: 20.sp),
    );
  }
}