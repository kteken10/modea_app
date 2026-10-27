import 'package:flutter/material.dart';
import 'package:myshop/ui/text.dart';

import '../../constants/colors.dart';

/// Onglets Description / How to use / Review de la fiche produit.
class SectionDetail extends StatefulWidget {
  final String description;
  final double rating;
  final int reviews;

  const SectionDetail({
    super.key,
    required this.description,
    required this.rating,
    required this.reviews,
  });

  @override
  State<SectionDetail> createState() => _SectionDetailState();
}

class _SectionDetailState extends State<SectionDetail> {
  int selectedIndex = 0;

  final List<String> options = ['Description', 'How to use', 'Review'];

  @override
  Widget build(BuildContext context) {
    final contents = [
      widget.description,
      'Free delivery in 48 h and free returns within 30 days. Check the size guide before ordering.',
      '${widget.rating} out of 5, based on ${widget.reviews} verified reviews.',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(options.length, (index) {
              final isSelected = selectedIndex == index;
              return Padding(
                padding: const EdgeInsets.only(right: 24),
                child: GestureDetector(
                  onTap: () => setState(() => selectedIndex = index),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        options[index],
                        style: TextStyle(
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                          color: isSelected ? AppColors.primary : Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        height: 3,
                        width: 32,
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primary : Colors.transparent,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 12),
          Text(
            contents[selectedIndex],
            style: const TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
