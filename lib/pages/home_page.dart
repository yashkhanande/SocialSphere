import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_sphere/components/bottom_nav_bar.dart';
import 'package:social_sphere/controllers/nav_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final NavController nav = Get.put(NavController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() {
            return IndexedStack(
              index: nav.currentIndex.value,
              children: nav.pages,
            );
          }),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: BottomNavBar(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


