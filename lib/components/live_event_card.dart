import 'package:flutter/material.dart';

class LiveEventCard extends StatelessWidget {
  final String image;
  final String title;

  const LiveEventCard({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: 200,
      height: 300,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            /// IMAGE
            Positioned.fill(child: Image.asset(image, fit: BoxFit.fitHeight)),

            /// GRADIENT OVERLAY
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.75),
                    ],
                  ),
                ),
              ),
            ),

            /// TEXT
            Positioned(
              left: 12,
              right: 12,
              bottom: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "07 December 2025 |",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "2 Connections",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(Icons.keyboard_arrow_right_rounded),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
