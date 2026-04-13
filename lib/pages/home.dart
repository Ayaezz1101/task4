import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task4/provider/coffeeProvidor.dart';
import 'package:task4/widget/category.dart';
import 'package:task4/widget/homeBottomNav.dart';
import 'package:task4/widget/homeHeader.dart';
import 'package:task4/widget/promoBanner.dart';
import 'package:task4/widget/productCard.dart';
import 'package:task4/widget/searchBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final coffeeProvider = Provider.of<CoffeeProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          const HomeHeader(),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 80.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: CoffeeSearchBar(
                      onSearch: (value) => coffeeProvider.updateSearch(value),
                      onFilterTap: () => coffeeProvider.updateMaxPrice(5.0),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  const PromoBanner(),
                  SizedBox(height: 24.h),
                  CategoryList(
                    onCategorySelected: (cat) => coffeeProvider.updateCategory(cat),
                  ),
                  SizedBox(height: 24.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: coffeeProvider.isLoading 
                      ? const CircularProgressIndicator()
                      : coffeeProvider.products.isEmpty
                        ? const Text("No Products")
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16.h,
                                crossAxisSpacing: 16.w,
                                mainAxisExtent: 238.h,
                              ),
                            itemCount: coffeeProvider.products.length,
                            itemBuilder: (context, index) {
                              return ProductCard(product: coffeeProvider.products[index]);
                            },
                          ),
                  ),
                  SizedBox(height: 100.h),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const HomeBottomNav(),
    );
  }
}