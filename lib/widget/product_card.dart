import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task4/pages/details.dart';
import 'package:task4/provider/coffee_providor.dart';
import 'package:task4/theme/app_theme.dart';

class ProductCard extends StatelessWidget {
  final dynamic product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CoffeeDetailsScreen(product: product),
          ),
        );
      },
      child: Container(
        width: 156.w,
        height: 238.h,
        padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    height: 128.h,
                    width: 140.w,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 51.w,
                    height: 28.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF111111).withOpacity(0.3),
                          const Color(0xFF313131).withOpacity(0.3),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24.r),
                        topRight: Radius.circular(12.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: const Color(0xFFFBBE21),
                          size: 12.sp,
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          product.rating.toString(),
                          style: textTheme.labelSmall?.copyWith(
                            color: Colors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              product.name,
              style: textTheme.bodyLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            Text(product.type, style: textTheme.labelSmall),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "\$ ${product.price}",
                  style: textTheme.titleLarge?.copyWith(fontSize: 18.sp),
                ),
                Container(
                  width: 32.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryCoffee,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),

                    icon: Icon(Icons.add, color: Colors.white, size: 16.sp),

                    onPressed: () {
                      final provider = Provider.of<CoffeeProvider>(
                        context,
                        listen: false,
                      );

                      provider.addToCart(product.id.toString());
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
