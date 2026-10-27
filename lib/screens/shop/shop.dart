import 'package:flutter/material.dart';
import 'package:myshop/data/products.dart';

import '../../constants/colors.dart';

/// Panier : articles, quantités modifiables et récapitulatif de commande.
class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _CartLine {
  final Product product;
  final String option;
  int quantity;

  _CartLine(this.product, this.option, this.quantity);
}

class _ShopScreenState extends State<ShopScreen> {
  final List<_CartLine> _lines = [
    _CartLine(productById('shoes'), 'Size 41', 1),
    _CartLine(productById('headphone'), 'Black', 1),
    _CartLine(productById('bag'), 'Taupe', 1),
  ];

  double get _subtotal => _lines.fold(0, (sum, l) => sum + l.product.price * l.quantity);

  @override
  Widget build(BuildContext context) {
    const discount = 20.0;
    final total = _subtotal - discount;

    return Scaffold(
      backgroundColor: AppColors.whiteBack,
      appBar: AppBar(
        backgroundColor: AppColors.whiteBack,
        surfaceTintColor: AppColors.whiteBack,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('My Cart', style: TextStyle(color: AppColors.ternary, fontSize: 20)),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          Text(
            '${_lines.length} items',
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 12),
          for (final line in _lines)
            _CartItem(
              line: line,
              onChanged: (q) => setState(() => line.quantity = q),
            ),
          const SizedBox(height: 8),
          // Code promo appliqué.
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.primary.withOpacity(0.25)),
            ),
            child: const Row(
              children: [
                Icon(Icons.local_offer_outlined, color: AppColors.primary, size: 20),
                SizedBox(width: 10),
                Expanded(
                  child: Text('Code WELCOME20 applied', style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                Text('-\$20', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.grayFineColor),
            ),
            child: Column(
              children: [
                _SummaryRow(label: 'Subtotal', value: '\$${_subtotal.toStringAsFixed(0)}'),
                const _SummaryRow(label: 'Delivery', value: 'Free'),
                const _SummaryRow(label: 'Discount', value: '-\$20'),
                const Divider(height: 24, color: AppColors.grayFineColor),
                _SummaryRow(label: 'Total', value: '\$${total.toStringAsFixed(0)}', strong: true),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 56,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {},
              child: Text(
                'Checkout · \$${total.toStringAsFixed(0)}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CartItem extends StatelessWidget {
  final _CartLine line;
  final ValueChanged<int> onChanged;

  const _CartItem({required this.line, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final p = line.product;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.grayFineColor),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(p.image, width: 84, height: 84, fit: BoxFit.cover),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(p.name, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(line.option, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                const SizedBox(height: 10),
                Text(
                  p.priceLabel,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primary),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.grayFineColor.withOpacity(0.6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                _QtyButton(icon: Icons.remove, onTap: () => onChanged(line.quantity > 1 ? line.quantity - 1 : 1)),
                Text('${line.quantity}', style: const TextStyle(fontWeight: FontWeight.w600)),
                _QtyButton(icon: Icons.add, onTap: () => onChanged(line.quantity + 1)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(padding: const EdgeInsets.all(8), child: Icon(icon, size: 16)),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool strong;

  const _SummaryRow({required this.label, required this.value, this.strong = false});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: strong ? 17 : 14,
      fontWeight: strong ? FontWeight.bold : FontWeight.normal,
      color: strong ? AppColors.ternary : Colors.black54,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label, style: style), Text(value, style: style)],
      ),
    );
  }
}
