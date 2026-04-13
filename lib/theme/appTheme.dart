import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const Color primaryCoffee = Color(0xFFC67C4E);
  static const Color lightCoffee = Color(0xFFEDD6C8);
  static const Color secondaryBlack = Color(0xFF242424);
  static const Color darkGrey = Color(0xFF313131);
  static const Color lightGrey = Color(0xFFE3E3E3);
  static const Color textGrey = Color(0xFFA2A2A2);
  static const Color backgroundBeige = Color(0xFFF9F2ED);
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color searchBackground = Color(0xFF2A2A2A);
  static const Color promoRed = Color(0xFFED5151);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Sora',

      scaffoldBackgroundColor: backgroundBeige,
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.w600, // SemiBold
          color: Colors.black,
          height: 1.5,
        ),

        displayMedium: TextStyle(
          fontSize: 64.sp,
          fontWeight: FontWeight.w700, // Bold
          color: secondaryBlack,
          height: 1.2,
        ),

        labelLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: pureWhite,
        ),

        bodyMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400, // Regular
          color: textGrey,
          height: 1.5,
        ),

        bodySmall: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF909090),
          decoration: TextDecoration.underline,
        ),
        labelSmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: textGrey,
        ),

        titleMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),

        titleLarge: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF050505),
        ),

        bodyLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: secondaryBlack,
        ),
      ),

      iconTheme: IconThemeData(color: secondaryBlack, size: 24.sp),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryCoffee,
          foregroundColor: pureWhite,
          minimumSize: Size(double.infinity, 56.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          elevation: 0,
        ),
      ),

      cardTheme: CardThemeData(
        color: const Color(0xFFF2F2F2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryCoffee,
        foregroundColor: pureWhite,
      ),
    );
  }
}
