import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_sphere/components/app_button.dart';
import 'package:social_sphere/components/app_textfield.dart';
import 'package:social_sphere/pages/auth/sign_up_page.dart';

import '../../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/sphere.png", height: 250),
            Text(
              "Login",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            AppTextfield(
              labelText: "Email",
              isEmail: true,
              textController: email,
            ),
            const SizedBox(height: 20),
            AppTextfield(
              labelText: "Password",
              obscureText: true,
              textController: password,
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Get.to(() => SignUpPage());
              },
              child: Text("Don't have an account? Sign Up"),
            ),
            AppButton(
              labelText: "Login",
              ontap: () => authController.login(email.text, password.text),
            ),
          ],
        ),
      ),
    );
  }
}
