import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task4/widget/iconButton.dart';
class DriverInfoTile extends StatelessWidget {
  const DriverInfoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 56.h,
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14.r),
            child: Image.asset("assets/images/Profile.png", width: 56.w, height: 56.h, fit: BoxFit.cover),
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Brooklyn Simmons", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: const Color(0xFF242424))),
              Text("Personal Courier", style: TextStyle(fontSize: 12.sp, color: const Color(0xFFA2A2A2))),
            ],
          ),
          const Spacer(),
          CircleButton(
            icon: Icons.phone_in_talk_outlined,
            color: const Color(0xFFE3E3E3),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}