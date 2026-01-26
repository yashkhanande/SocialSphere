import 'package:flutter/material.dart';

class ChatRoom extends StatelessWidget {
  const ChatRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            // 🔹 Messages Area
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: const [
                  // Example messages
                  Text("Hello"),
                  SizedBox(height: 10),
                  Text("How are you?"),
                ],
              ),
            ),

            // 🔹 Input Bar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Type a message...",
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.2),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
