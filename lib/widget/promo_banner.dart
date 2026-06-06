// promo_banner.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 140.h,
      clipBehavior: Clip.antiAlias, //منشان ما يطلع عن حدود البوردر
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: const DecorationImage(
          image: AssetImage('assets/images/Property 1=Coffee, Property 2=1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24.w, top: 13.h), 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFED5151),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    "Promo",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 15.h), 
                        Container(width: 200.w, height: 27.h, color: const Color(0xFF111111)),
                        SizedBox(height: 12.h), 
                        Container(width: 149.w, height: 23.h, color: const Color(0xFF111111)),
                      ],
                    ),
                    Text(
                      "Buy one get\none FREE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.25, // متوافق مع قياسات فيغما
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}