import 'package:flutter/material.dart';
import 'package:myshop/data/products.dart';

import '../../constants/colors.dart';
import '../../ui/product_show.dart';

/// Articles mis de côté par l'utilisateur.
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = ['watch', 'sunglasses', 'headphone', 'shoes'].map(productById).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Wishlist', style: TextStyle(color: AppColors.ternary, fontSize: 20)),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(12, 4, 12, 24),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              '${favorites.length} saved items',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 8),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final p = favorites[index];
              return ProductShow(
                imagePath: p.image,
                price: p.priceLabel,
                productName: p.name,
                category: p.category,
                rating: p.rating,
                onTap: () => Navigator.pushNamed(context, '/productDetail', arguments: p.id),
              );
            },
          ),
        ],
      ),
    );
  }
}
