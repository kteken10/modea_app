import 'package:flutter/material.dart';
import '../constants/colors.dart';

class SizeSelector extends StatefulWidget {
  final List<String> sizes;
  final void Function(String)? onSelected;
  final String? initialSelected;

  const SizeSelector({
    super.key,
    required this.sizes,
    this.onSelected,
    this.initialSelected,
  });

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  late String selectedSize;

  @override
  void initState() {
    super.initState();
    selectedSize = widget.initialSelected ?? widget.sizes.first;
  }

  @override
  Widget build(BuildContext context) {
    // Pastille ronde pour une taille courte (S, 42), pilule pour un mot (Black).
    return Wrap(
      spacing: 0,
      runSpacing: 10,
      children: widget.sizes.map((size) {
        final bool isSelected = size == selectedSize;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedSize = size;
            });
            if (widget.onSelected != null) {
              widget.onSelected!(size);
            }
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            height: 40,
            constraints: const BoxConstraints(minWidth: 40),
            padding: EdgeInsets.symmetric(horizontal: size.length > 2 ? 14 : 0),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? AppColors.primary : Colors.grey.shade300,
                width: 2,
              ),
            ),
            child: Center(
              widthFactor: 1,
              child: Text(
                size,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}