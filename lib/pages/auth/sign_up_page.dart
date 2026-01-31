import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:social_sphere/components/app_button.dart';
import 'package:social_sphere/components/app_textfield.dart';
import 'package:social_sphere/controllers/auth_controller.dart';
import 'package:social_sphere/pages/auth/login_page.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final AuthController authController = Get.find<AuthController>();

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
                AppTextfield(labelText: "Name", textController: name),
                const SizedBox(height: 20),
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
                TextButton(
                  onPressed: () {
                    Get.to(() => LoginPage());
                  },
                  child: Text("Already have an account? Login"),
                ),

                Text(
                  "By signing up, you agree to our Terms of Service and Privacy Policy.",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Obx(() {
                  if (authController.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return AppButton(
                    labelText: "Sign Up",
                    ontap: () => authController.signUp(
                      email.text,
                      password.text,
                      name.text,
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
