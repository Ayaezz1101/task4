import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_theme.dart';

class SmallActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const SmallActionButton({
    super.key, 
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppTheme.lightGrey),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14.sp, color: AppTheme.secondaryBlack),
            SizedBox(width: 4.w),
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppTheme.secondaryBlack,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}