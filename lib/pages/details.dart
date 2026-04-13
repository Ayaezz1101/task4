import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task4/model/productModel.dart';
import 'package:task4/pages/order.dart';
import 'package:task4/provider/coffeeProvidor.dart';
import 'package:task4/widget/iconButton.dart';
import 'package:task4/widget/buttonBar.dart';
import 'package:task4/widget/featureIcon.dart';
import 'package:task4/widget/rating.dart';
import 'package:task4/widget/sizeCard.dart';
import 'package:task4/theme/appTheme.dart';

class CoffeeDetailsScreen extends StatefulWidget {
  final CoffeeModel product;

  const CoffeeDetailsScreen({super.key, required this.product});

  @override
  State<CoffeeDetailsScreen> createState() => _CoffeeDetailsScreenState();
}

class _CoffeeDetailsScreenState extends State<CoffeeDetailsScreen> {
  bool isFavorite = false;
  bool isExpanded = false;
  String selectedSize = "M";

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 68.h),
              // App Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleButton(
                    icon: Icons.arrow_back_ios_new,
                    color: Colors.white,
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text("Detail", style: textTheme.bodyLarge),
                  CircleButton(
                    icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.white,
                    onPressed: () => setState(() => isFavorite = !isFavorite),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.network(
                  widget.product.imageUrl,
                  width: 327.w,
                  height: 202.h,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      width: 327.w,
                      height: 202.h,
                      color: Colors.grey[200],
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 327.w,
                    height: 202.h,
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image, size: 50),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: textTheme.displayLarge?.copyWith(
                          fontSize: 20.sp,
                        ),
                      ),
                      Text(widget.product.type, style: textTheme.labelSmall),
                      SizedBox(height: 16.h),
                      RatingWidget(rating: widget.product.rating, reviews: 230),
                    ],
                  ),
                  Row(
                    children: [
                      const FeatureIconWidget(icon: Icons.directions_bike),
                      SizedBox(width: 12.w),
                      const FeatureIconWidget(icon: Icons.coffee_maker),
                      SizedBox(width: 12.w),
                      const FeatureIconWidget(icon: Icons.water_drop_outlined),
                    ],
                  ),
                ],
              ),
              const Divider(height: 32, color: Color(0xFFE3E3E3)),
              Text("Description", style: textTheme.bodyLarge),
              SizedBox(height: 8.h),
              GestureDetector(
                onTap: () => setState(() => isExpanded = !isExpanded),
                child: RichText(
                  text: TextSpan(
                    style: textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: isExpanded
                            ? widget.product.description
                            : "${widget.product.description.substring(0, 80)}... ",
                      ),
                      TextSpan(
                        text: isExpanded ? " Read Less" : " Read More",
                        style: TextStyle(
                          color: AppTheme.primaryCoffee,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Text("Size", style: textTheme.bodyLarge),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ["S", "M", "L"].map((size) {
                  return SizeCardWidget(
                    size: size,
                    isSelected: selectedSize == size,
                    onTap: () => setState(() => selectedSize = size),
                  );
                }).toList(),
              ),
              SizedBox(height: 140.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BuyNowBottomBar(
        price: widget.product.price.toString(),
        onBuyPressed: () {
  final provider = context.read<CoffeeProvider>();
  final productId = widget.product.id.toString();

  provider.addToCart(productId); 

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const OrderScreen()),
  );
},
      ),
    );
  }
}
