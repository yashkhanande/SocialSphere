import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {Get.snackbar("Notifications", "No new notifications")},
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
          color: Colors.white.withValues(alpha: 0.1),
        ),
        child: Icon(Icons.notifications, size: 20),
      ),
    );
  }
}
