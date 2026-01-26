import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_sphere/controllers/category_controller.dart';

class Categories extends StatelessWidget {
  Categories({
    super.key,
    required this.index,
    required this.category,
    required this.imagePath,
  });
  final int index;
  final String category;
  final String imagePath;
  final CategoryController _cat = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _cat.changeCategory(index),
      child: Obx(() {
        final isSelected = _cat.currentIndex.value == index;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: !isSelected ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.25),
                    ),
                  ]
                : [],
          ),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                height: 20,
                color: !isSelected ? Colors.white : Colors.black,
              ),
              const SizedBox(width: 6),
              Text(
                category,
                style: TextStyle(
                  color: !isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
