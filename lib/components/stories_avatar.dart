import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_sphere/components/app_colors.dart';

class StoriesAvatar extends StatelessWidget {
  const StoriesAvatar({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Get.snackbar("Coming soon", "we are currently working on this app "),
      child: Container(
        width: 65,
        margin: EdgeInsets.only(right: 15),
        child: Column(
          children: [
            Container(
              width: MediaQuery.widthOf(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: AppColors.gold, width: 3),
              ),
              child: Column(children: [Image.asset("assets/man.png")]),
            ),
            const SizedBox(height: 3),
            Text("Context", style: TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
