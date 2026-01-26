import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage("assets/cafe_hoppping.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Cafe Hopping",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text("Jibhi • Jan 26"),
      ],
    );
  }
}