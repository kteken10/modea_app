import 'package:flutter/material.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/data/products.dart';
import 'package:myshop/ui/text.dart';

import '../../ui/category_circle.dart';
import '../../ui/product_category.dart';
import '../../ui/product_show.dart';
import '../../ui/promo_carousel.dart';
import '../../ui/search_zone.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.grayFineColor.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColors.ternary,
                  size: 20,
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'Shop',
                  style: TextStyle(
                    color: AppColors.ternary,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
                    
            GestureDetector(
             
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.grayFineColor.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.notifications_none, // Icône de notification
                  color: AppColors.ternary,
                ),
              ),
            ),
           
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchZone(
                controller: searchController,
                onCameraPressed: () {},
                onMicPressed: () {},
                spacing: 12.0,
              ),
              const SizedBox(height: 20),
              const ProductCategory(
                categories: ["All", "women", "men", "sport", "Laptop"],
              ),
              const SizedBox(height: 20),
              const PromoCarousel(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextWidget(
                      'Categories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.ternary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Action pour "See All"
                      },
                      child: const TextWidget(
                        'See All',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.ternary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const CategoryCircle(
                categories: ["shoes", "bag", "headphone", "cosmetics", "sunglasses"],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      'Top Selling',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.ternary,
                      ),
                    ),
                    // Le GestureDetector ici n'est pas nécessaire car il n'y a pas d'action
                  ],
                ),
              ),
              GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductShow(
                    imagePath: product.image,
                    price: product.priceLabel,
                    productName: product.name,
                    category: product.category,
                    rating: product.rating,
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/productDetail',
                      arguments: product.id,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}