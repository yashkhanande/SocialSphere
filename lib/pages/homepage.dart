import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_sphere/components/bottom_nav_bar.dart';
import 'package:social_sphere/controllers/nav_controller.dart';
import 'package:social_sphere/pages/chat/inbox.dart';
import 'package:social_sphere/pages/explore/explore_page.dart';
import 'package:social_sphere/pages/home_tab.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final NavController nav = Get.put(NavController());
  final pages = [HomeTab(), ExplorePage(), Inbox(), ProfileTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() {
            return IndexedStack(index: nav.currentIndex.value, children: pages);
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

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Profile"));
  }
}
