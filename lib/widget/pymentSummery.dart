import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/appTheme.dart';
class PaymentSummary extends StatelessWidget {
  final double price;
  final double deliveryFee;

  const PaymentSummary({super.key, required this.price, required this.deliveryFee});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Payment Summary", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
          SizedBox(height: 16.h),
          _buildSummaryRow("Price", "\$ $price"),
          SizedBox(height: 8.h),
          _buildSummaryRow("Delivery Fee", "\$ $deliveryFee", isDelivery: true),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value, {bool isDelivery = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 14.sp, color: AppTheme.darkGrey)),
        if (isDelivery)
          Row(
            children: [
              Text("\$ 2.0", style: TextStyle(fontSize: 14.sp, decoration: TextDecoration.lineThrough, color: AppTheme.secondaryBlack)),
              SizedBox(width: 8.w),
              Text("Free", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppTheme.secondaryBlack)),
            ],
          )
        else
          Text(value, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
      ],
    );
  }
}