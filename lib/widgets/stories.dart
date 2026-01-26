import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:social_sphere/components/stories_avatar.dart';

class Stories extends StatelessWidget {
  const Stories({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  borderPadding: EdgeInsets.zero,
                  padding: const EdgeInsets.all(2),
                  strokeWidth: 2,
                  dashPattern: [8, 4],
                  color: Colors.white,
                  stackFit: StackFit.loose,
                  strokeCap: StrokeCap.butt,
                  radius: Radius.circular(30),
                ),
                child: Image.asset(
                  "assets/plus.png",
                  width: 55,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 3),
              Text("My Intent", style: TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
          const SizedBox(width: 15),

          StoriesAvatar(),
          StoriesAvatar(),
          StoriesAvatar(),
          StoriesAvatar(),
          StoriesAvatar(),
        ],
      ),
    );
  }
}
