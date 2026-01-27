import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_sphere/controllers/user_controller.dart';
import 'package:social_sphere/models/user_model.dart';
import 'package:social_sphere/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final UserController userController = Get.find<UserController>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadUserFromFirebase();
  }

  Future<void> loadUserFromFirebase() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;

    if (firebaseUser == null) {
      return; // not logged in
    }

    final doc = await FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser.uid)
        .get();

    if (!doc.exists) {
      return;
    }

    final appUser = AppUser.fromMap(doc.data()!);

    Get.find<UserController>().setUser(appUser);
  }
Future<void> signUp(String email, String password, String name) async {
  final user = await _authService.signUp(email, password);

  final appUser = AppUser(
    uid: user.uid,
    email: user.email!,
    name: name,
    isVerified: user.emailVerified,
  );

  await _firestore
      .collection("users")
      .doc(user.uid)
      .set(appUser.toMap());

  await user.sendEmailVerification();

  userController.setUser(appUser);
}


  void login(String email, String password) async {
    final user = await _authService.login(email, password);

    final userDoc = await _firestore.collection("users").doc(user!.uid).get();

    final appUser = AppUser.fromMap(userDoc.data()!);

    userController.setUser(appUser);

    
  }

  void logOut() async {
    await _authService.logOut();
    userController.clearUser();
  }
}
