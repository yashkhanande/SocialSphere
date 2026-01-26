import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:social_sphere/components/app_button.dart';
import 'package:social_sphere/components/app_textfield.dart';
import 'package:social_sphere/pages/homepage.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/sphere.png", height: 250),
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                AppTextfield(labelText: "Name"),
                const SizedBox(height: 20),
                AppTextfield(labelText: "Email", isEmail: true),
                const SizedBox(height: 20),
                AppTextfield(labelText: "Password", obscureText: true),
                const SizedBox(height: 20),
                AppButton(
                  labelText: "Sign Up",
                  ontap: () => Get.offAll(() => Homepage()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
