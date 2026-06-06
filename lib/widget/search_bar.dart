// widgets/coffee_search_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeSearchBar extends StatelessWidget {
  final Function(String) onSearch; 
  final VoidCallback onFilterTap; 

  const CoffeeSearchBar({super.key, required this.onSearch, required this.onFilterTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 52.h,
            decoration: BoxDecoration(
              color: const Color(0xFF2A2A2A),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: TextField(
              onChanged: onSearch,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search coffee",
                hintStyle: const TextStyle(color: Color(0xFFA2A2A2)),
                prefixIcon: Icon(Icons.search, color: Colors.white, size: 20.sp),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 15.h),
              ),
            ),
          ),
        ),
        SizedBox(width: 16.w),
        GestureDetector(
          onTap: onFilterTap, 
          child: Container(
            width: 52.w,
            height: 52.h,
            decoration: BoxDecoration(
              color: const Color(0xFFC67C4E),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(Icons.tune, color: Colors.white, size: 20.sp),
          ),
        ),
      ],
    );
  }
}