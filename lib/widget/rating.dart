import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingWidget extends StatelessWidget {
  final double rating;
  final int reviews;

  const RatingWidget({super.key, required this.rating, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star_rounded, color: const Color(0xFFFBBE21), size: 20.sp),
        SizedBox(width: 4.w),
        Text(
          rating.toString(),
          style: TextStyle(
            fontFamily: 'Sora',
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: const Color(0xFF242424),
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          "($reviews)",
          style: TextStyle(
            fontFamily: 'Sora',
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            color: const Color(0xFF909090),
          ),
        ),
      ],
    );
  }
}