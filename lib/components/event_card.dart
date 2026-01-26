import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:social_sphere/components/app_colors.dart';

class EventCard extends StatelessWidget {
  final String userName;
  final String distance;
  final String message;
  final String profile_path;
  const EventCard({
    super.key,
    required this.userName,
    required this.distance,
    required this.message,
    required this.profile_path,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withValues(alpha: 0.1),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 55,
                height: 55,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.gold, width: 1),
                  image: DecorationImage(
                    image: AssetImage(profile_path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.lightBlue),
                        const SizedBox(width: 5),
                        Text(
                          distance,
                          style: TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  Get.snackbar(
                    "Coming soon",
                    "we are currently working on this app ",
                  );
                },
                icon: Icon(Icons.more_horiz),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: MediaQuery.widthOf(context),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withValues(alpha: 0.3)),

              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              message,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  "Chill",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () => Get.snackbar(
                  "Coming soon",
                  "we are currently working on this app ",
                ),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    "Say Hii 👋",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
