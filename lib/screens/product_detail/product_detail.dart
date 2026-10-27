import 'package:flutter/material.dart';
import 'package:myshop/data/products.dart';
import 'package:myshop/screens/product_detail/product_banner.dart';
import 'package:myshop/ui/text.dart';

import '../../constants/colors.dart';
import '../../ui/size_selector.dart';
import 'section_detail.dart';

/// Fiche produit : l'identifiant du produit arrive en argument de route.
class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String? ?? products.first.id;
    final product = productById(id);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text(
          'Product Detail',
          style: TextStyle(color: AppColors.ternary, fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.grayFineColor.withOpacity(0.7),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.favorite_border_rounded, color: AppColors.ternary, size: 20),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductBanner(price: product.priceLabel, imagePath: product.image),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    product.category.toUpperCase(),
                    style: const TextStyle(fontSize: 12, color: Colors.grey, letterSpacing: 0.6),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star_rounded, color: Colors.amber, size: 20),
                      const SizedBox(width: 2),
                      TextWidget(
                        '${product.rating}',
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      TextWidget(
                        '  (${product.reviews})',
                        style: const TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 6, 16, 18),
              child: TextWidget(
                product.name,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.ternary),
              ),
            ),
            SectionDetail(description: product.description, rating: product.rating, reviews: product.reviews),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 22, 16, 10),
              child: TextWidget(
                product.sizeLabel,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.ternary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: SizeSelector(sizes: product.sizes, initialSelected: product.sizes[product.sizes.length ~/ 2]),
            ),
          ],
        ),
      ),
      // Barre d'achat : prix et ajout au panier, toujours visibles.
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: AppColors.grayFineColor)),
          ),
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Total price', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text(
                    product.priceLabel,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.ternary),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Expanded(
                child: SizedBox(
                  height: 54,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_bag_outlined),
                    label: const Text('Add to cart', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
