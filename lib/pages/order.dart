import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task4/pages/tracking.dart';
import 'package:task4/provider/coffee_providor.dart';
import 'package:task4/theme/app_theme.dart';
import 'package:task4/widget/address_section.dart';
import 'package:task4/widget/brimary_button.dart';
import 'package:task4/widget/discount_widget.dart';
import 'package:task4/widget/order_item_card.dart';
import 'package:task4/widget/pyment_summery.dart';
import 'package:task4/widget/toggle_delivery.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CoffeeProvider>(context);
    if (provider.products.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    final allProducts = provider.products.where((product) {
      return provider.getProductQuantity(product.id.toString()) > 0;
    }).toList();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Order", style: Theme.of(context).textTheme.bodyLarge),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            DeliveryToggle(),
            SizedBox(height: 24.h),
            AddressSection(),
            SizedBox(height: 20.h),

            Column(
              children: allProducts.map((product) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: OrderItemCard(
                    name: product.name,
                    type: product.type,
                    imageUrl: product.imageUrl,
                    quantity: provider.getProductQuantity(
                      product.id.toString(),
                    ),
                    onIncrement: () =>
                        provider.addToCart(product.id.toString()),
                    onDecrement: () =>
                        provider.removeFromCart(product.id.toString()),
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 20.h),
            Container(height: 4.h, color: const Color(0xFFF9F2ED)),
            SizedBox(height: 20.h),

            const DiscountTile(),

            SizedBox(height: 24.h),
            PaymentSummary(price: provider.getTotalPrice(), deliveryFee: 1.0),

            SizedBox(height: 24.h),
            _buildPaymentMethod(provider),

            SizedBox(height: 24.h),

            CustomButton(
              text: "Order",
              width: 327.w,
              onPressed: () async {
                final provider = context.read<CoffeeProvider>();

                await provider.placeOrder();
                if (!context.mounted) return;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => TrackingScreen()),
                );
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethod(CoffeeProvider provider) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          Icon(
            Icons.account_balance_wallet_outlined,
            color: AppTheme.primaryCoffee,
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cash/Wallet",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                "\$ ${provider.getTotalPrice().toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primaryCoffee,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}
