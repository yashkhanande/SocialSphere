import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:social_sphere/components/categories.dart';
import 'package:social_sphere/components/profile_photo.dart';
import 'package:social_sphere/components/search_button.dart';
import 'package:social_sphere/controllers/category_controller.dart';
import 'package:social_sphere/pages/explore/all_content.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({super.key});
  final CategoryController cat = Get.put(CategoryController());
  final categories = const [
    {'name': 'All', 'icon': 'assets/all.png'},
    {'name': 'Coffee', 'icon': 'assets/coffee.png'},
    {'name': 'Work', 'icon': 'assets/work.png'},
    {'name': 'Game', 'icon': 'assets/game.png'},
  ];
  final pages = const [
    AllContent(),
    Center(child: Text('Coffee Content')),
    Center(child: Text('Work Content')),
    Center(child: Text('Game Content')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Explore",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  SearchButton(),
                  const SizedBox(width: 10),
                  ProfilePhoto(),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: List.generate(
                  categories.length,
                  (index) => Categories(
                    index: index,
                    category: categories[index]['name']!,
                    imagePath: categories[index]['icon']!,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(
                () => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IndexedStack(
                    index: cat.currentIndex.value,
                    children: pages,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
