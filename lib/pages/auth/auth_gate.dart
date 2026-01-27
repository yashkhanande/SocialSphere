import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_sphere/pages/auth/login_page.dart';
import 'package:social_sphere/pages/home_page.dart';

import '../../controllers/user_controller.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Logged out
        if (!snapshot.hasData) {
          return LoginPage();
        }

        // Logged in BUT app user not loaded yet
        return Obx(() {
          final appUser = userController.user.value;

          if (appUser == null) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          return HomePage();
        });
      },
    );
  }
}
