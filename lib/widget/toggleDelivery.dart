import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/appTheme.dart';

class DeliveryToggle extends StatefulWidget {
  const DeliveryToggle({super.key});

  @override
  State<DeliveryToggle> createState() => _DeliveryToggleState();
}

class _DeliveryToggleState extends State<DeliveryToggle> {
  bool isDeliver = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 43.h,
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEDED),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          _buildButton("Deliver", isDeliver),
          _buildButton("Pick Up", !isDeliver),
        ],
      ),
    );
  }

  Widget _buildButton(String text, bool active) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isDeliver = text == "Deliver"),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: active ? AppTheme.primaryCoffee : Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: active ? Colors.white : AppTheme.secondaryBlack,
              fontWeight: active ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}