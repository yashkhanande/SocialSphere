import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_sphere/controllers/nav_controller.dart';
import 'package:social_sphere/pages/event/create_event_page.dart';

class BottomNavBar extends StatelessWidget {
  final NavController nav = Get.find();

  final icons = [
    Icons.home,
    Icons.explore,
    Icons.message,
    Icons.person_2_rounded,
  ];

  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.2),
                  ),
                ),
                child: Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      icons.length,
                      (index) => GestureDetector(
                        onTap: () {
                          nav.changeTab(index);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: nav.currentIndex.value == index
                                ? Colors.white.withValues(alpha: .2)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            icons[index],
                            size: 26,
                            color: nav.currentIndex.value == index
                                ? Colors.white
                                : Colors.white54,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Positioned(
            bottom: 38,
            child: InkWell(
              onTap: () {
                Get.to(() => CreateEventPage());
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(
                    255,
                    105,
                    115,
                    120,
                  ).withValues(alpha: 1),
                  border: Border.all(color: Colors.blueGrey),
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
