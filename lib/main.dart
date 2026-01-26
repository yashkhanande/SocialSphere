import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_sphere/components/app_colors.dart';
import 'package:social_sphere/controllers/user_controller.dart';
import 'package:social_sphere/pages/homepage.dart';

void main() {
  Get.put(UserController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social Sphere',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        brightness: Brightness.dark,
      ),
      home: Homepage(),
    );
  }
}
