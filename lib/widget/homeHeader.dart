import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task4/provider/coffeeProvidor.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  
  Widget build(BuildContext context) {
    final coffeeProvider = Provider.of<CoffeeProvider>(context);
    final textTheme = Theme.of(context).textTheme;

    return Stack(
      children: [
        Container(
          height: 280.h,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF111111), Color(0xFF313131)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Location", style: textTheme.labelSmall),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Text(coffeeProvider.addressTitle, style: textTheme.titleMedium),
                        Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 14.sp),
                      ],
                    ),
                  ],
                ),
                
              ],
            ),
          ),
        ),
      ],
    );
  }
}