import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task4/pages/order.dart';
import 'package:task4/theme/appTheme.dart';

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 99.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10.r)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(context, Icons.home, true),
          _buildNavItem(context, Icons.favorite_border, false),
          _buildNavItem(context, Icons.shopping_bag_outlined, false, isOrder: true),
          _buildNavItem(context, Icons.notifications_outlined, false),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, bool isSelected, {bool isOrder = false}) {
    return GestureDetector(
      onTap: () {
        if (isOrder) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const OrderScreen()),
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? AppTheme.primaryCoffee : const Color(0xFFA2A2A2),
            size: 24.sp,
          ),
          if (isSelected)
            Container(
              margin: EdgeInsets.only(top: 6.h),
              width: 10.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: AppTheme.primaryCoffee,
                borderRadius: BorderRadius.circular(18.r),
              ),
            ),
        ],
      ),
    );
  }
}