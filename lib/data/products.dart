/// Catalogue de démonstration : partagé par l'accueil, la fiche produit,
/// le panier et les favoris, pour que tous les écrans racontent la même boutique.
class Product {
  final String id;
  final String name;
  final String category;
  final String image;
  final double price;
  final double rating;
  final int reviews;
  final String description;
  final String sizeLabel;
  final List<String> sizes;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.description,
    required this.sizeLabel,
    required this.sizes,
  });

  String get priceLabel => '\$${price.toStringAsFixed(0)}';
}

const products = <Product>[
  Product(
    id: 'shoes',
    name: 'Running Shoes',
    category: 'Sport · Shoes',
    image: 'assets/images/categories/shoes.jpg',
    price: 100,
    rating: 4.8,
    reviews: 312,
    description:
        'Lightweight running shoes with a breathable mesh upper and a responsive foam sole, built for daily training and long runs.',
    sizeLabel: 'Size (EU)',
    sizes: ['39', '40', '41', '42', '43'],
  ),
  Product(
    id: 'bag',
    name: 'Leather Bag',
    category: 'Women · Bags',
    image: 'assets/images/categories/bag.jpeg',
    price: 80,
    rating: 4.6,
    reviews: 184,
    description:
        'Structured handbag in grained leather with a detachable shoulder strap and three inner compartments.',
    sizeLabel: 'Color',
    sizes: ['Taupe', 'Black', 'Camel'],
  ),
  Product(
    id: 'headphone',
    name: 'Wireless Headphones',
    category: 'Tech · Audio',
    image: 'assets/images/categories/headphone.jpg',
    price: 120,
    rating: 4.7,
    reviews: 529,
    description:
        'Over-ear wireless headphones with active noise cancelling, 40 hours of battery life and fast charging.',
    sizeLabel: 'Color',
    sizes: ['Black', 'Green'],
  ),
  Product(
    id: 'cosmetics',
    name: 'Cosmetics Set',
    category: 'Women · Beauty',
    image: 'assets/images/categories/cosmetics.jpg',
    price: 60,
    rating: 4.5,
    reviews: 97,
    description:
        'Complete make-up set: foundation, lipstick, mascara and brushes, in a travel case.',
    sizeLabel: 'Format',
    sizes: ['Travel', 'Full size'],
  ),
  Product(
    id: 'sunglasses',
    name: 'Polarized Sunglasses',
    category: 'Men · Accessories',
    image: 'assets/images/categories/sunglasses.png',
    price: 45,
    rating: 4.4,
    reviews: 76,
    description: 'Polarized lenses with UV400 protection and a lightweight frame.',
    sizeLabel: 'Lens',
    sizes: ['Blue', 'Smoke'],
  ),
  Product(
    id: 'watch',
    name: 'Classic Watch',
    category: 'Men · Watches',
    image: 'assets/images/categories/watch1.jpg',
    price: 150,
    rating: 4.9,
    reviews: 141,
    description: 'Stainless steel watch with sapphire glass, water resistant to 50 m.',
    sizeLabel: 'Strap',
    sizes: ['Steel', 'Leather'],
  ),
];

Product productById(String id) => products.firstWhere((p) => p.id == id);
