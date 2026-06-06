import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_theme.dart';

class OrderItemCard extends StatelessWidget {
  final String name;
  final String type;
  final String imageUrl;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const OrderItemCard({
    super.key,
    required this.name,
    required this.type,
    required this.imageUrl,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    if (quantity == 0) return const SizedBox.shrink();

    return Container(
      width: 327.w,
      height: 54.h,
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(imageUrl, width: 54.w, height: 54.h, fit: BoxFit.cover),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: AppTheme.secondaryBlack)),
                Text(type, style: TextStyle(fontSize: 12.sp, color: AppTheme.textGrey)),
              ],
            ),
          ),
          Row(
            children: [
              _buildCounterBtn(Icons.remove, onDecrement),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Text("$quantity", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
              ),
              _buildCounterBtn(Icons.add, onIncrement),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCounterBtn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4.r),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFF9F2ED)),
          color: Colors.white,
        ),
        child: Icon(icon, size: 16.sp, color: AppTheme.secondaryBlack),
      ),
    );
  }
}