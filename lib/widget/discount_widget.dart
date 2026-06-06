import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_theme.dart';

class DiscountTile extends StatelessWidget {
  const DiscountTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 56.h,
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFEDEDED)),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Icon(Icons.discount_outlined, color: AppTheme.primaryCoffee, size: 20.sp),
          SizedBox(width: 12.w),
          Text("1 Discount is Applied", 
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppTheme.darkGrey)),
          const Spacer(),
          Icon(Icons.arrow_forward_ios, size: 16.sp, color: AppTheme.secondaryBlack),
        ],
      ),
    );
  }
}