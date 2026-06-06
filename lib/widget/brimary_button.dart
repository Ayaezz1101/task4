import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task4/theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width ?? 217.w,
        height: 56.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppTheme.primaryCoffee, // Primary Coffee
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Sora',
          ),
        ),
      ),
    );
  }
}