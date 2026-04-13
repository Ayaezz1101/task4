import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task4/theme/appTheme.dart';
import 'package:task4/widget/brimaryButton.dart';

class BuyNowBottomBar extends StatelessWidget {
  final String price;
  final VoidCallback onBuyPressed;

  const BuyNowBottomBar({
    super.key,
    required this.price,
    required this.onBuyPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      height: 118.h,
      padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 46.h),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Price",
                style: theme.textTheme.labelSmall?.copyWith(fontSize: 14.sp),
              ),
              Text(
                "\$ $price",
                style: theme.textTheme.titleLarge?.copyWith(
                  color: AppTheme.primaryCoffee , 
                ),
              ),
            ],
          ),
          CustomButton(
            text: "Buy Now",
            onPressed: onBuyPressed,
            width: 217.w,
          ),
        ],
      ),
    );
  }
}