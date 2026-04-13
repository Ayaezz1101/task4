import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class StatusStep extends StatelessWidget {
  final bool isActive;
  const StatusStep({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 71.25.w,
      height: 4.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: isActive ? const Color(0xFF36C07E) : const Color(0xFFE3E3E3),
      ),
    );
  }
}