import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_sphere/models/user_model.dart';
import 'package:social_sphere/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController extends GetxController{
  final AuthService _authService  = AuthService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();


  void signUp(String email, String password, String name) async {

   final user = await _authService.signIn(email, password);
    
    AppUser appUser = AppUser(
      uid: user!.uid,
      name: name,
      email: user.email!,
      isVerified: user.emailVerified,
    );

    await _firestore.collection("users").doc(user.uid).set(appUser.toMap());

    await user.sendEmailVerification();

  }
}