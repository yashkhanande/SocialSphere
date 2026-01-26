import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_sphere/components/app_colors.dart';
import 'package:social_sphere/controllers/user_controller.dart';

class ProfilePhoto extends StatelessWidget {
  final UserController user = Get.find();
  ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.gold, width: 1),
        image: DecorationImage(
          image: AssetImage(user.profile_photo),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
