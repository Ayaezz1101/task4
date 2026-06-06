// widgets/category_list.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task4/theme/app_theme.dart';



class CategoryList extends StatefulWidget {
  final Function(String) onCategorySelected; 
  const CategoryList({super.key, required this.onCategorySelected});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedIndex = 0;
  final List<String> categories = ["All Coffee", "Machiato", "Latte", "Americano"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() => selectedIndex = index);
              widget.onCategorySelected(categories[index]);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isSelected ? AppTheme.primaryCoffee : Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : const Color(0xFF2F2D2C),
                  fontSize: 14.sp,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}