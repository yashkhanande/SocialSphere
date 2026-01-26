import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_sphere/components/profile_photo.dart';
import 'package:social_sphere/pages/chat/chat_room.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(ChatRoom()),
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            ProfilePhoto(),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Dex",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.blue.withValues(alpha: 0.2),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.1),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Travel",
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
                Text(
                  "Shoja Sounds good!",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                Text(
                  "09:30",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "2",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
