import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class Categories extends StatelessWidget {
  final int index;
  final String category;
  final String imagePath;
  final VoidCallback onTap;
  final bool isSelected;

  const Categories({
    super.key,
    required this.index,
    required this.category,
    required this.imagePath,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withOpacity(0.2)
              : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Image.asset(imagePath, height: 32),
            const SizedBox(height: 6),
            Text(category),
          ],
        ),
      ),
    );
  }
}
