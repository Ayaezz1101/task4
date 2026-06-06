import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task4/theme/app_theme.dart';

class SizeCardWidget extends StatelessWidget {
  final String size;
  final bool isSelected;
  final VoidCallback onTap;

  const SizeCardWidget({
    super.key,
    required this.size,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 96.w,
        height: 41.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.backgroundBeige : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppTheme.primaryCoffee : AppTheme.lightGrey,
            width: 1.w,
          ),
        ),
        child: Text(
          size,
          style: TextStyle(
            fontFamily: 'Sora',
            fontSize: 14.sp,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected ? AppTheme.primaryCoffee : AppTheme.secondaryBlack,
          ),
        ),
      ),
    );
  }
}