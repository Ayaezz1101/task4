import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const CircleButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 44.w,
        height: 44.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: const Color(0xFFE3E3E3), width: 1.w),
        ),
        child: Icon(
          icon,
          size: 20.sp,
          color: const Color(0xFF242424),
        ),
      ),
    );
  }
}