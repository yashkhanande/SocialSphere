import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_sphere/components/profile_photo.dart';
import 'package:social_sphere/controllers/user_controller.dart';

import '../../controllers/auth_controller.dart';

class ProfileTab extends StatelessWidget {
  final AuthController authController = Get.find();
  final UserController userController = Get.find();
  ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfilePhoto(),
              const SizedBox(height: 16),
              Text(
                userController.user.value!.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    authController.logOut();
                  },
                  child: Text("Log Out", style: TextStyle()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
