import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:social_sphere/components/app_colors.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String userName;
  final String location;
  final String message;
  final String? profile_path;
  final String? category;
  final int attendees;
  const EventCard({
    super.key,
    required this.userName,
    required this.location,
    required this.message,
    this.profile_path,
    required this.category,
    required this.title,
    required this.attendees,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withValues(alpha: 0.05),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 55,
                height: 55,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.gold, width: 1),
                  image: DecorationImage(
                    image: AssetImage(profile_path ?? "assets/man.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),

                  SizedBox(
                    width: 200,
                    child: Text(
                      location,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),

              // IconButton(
              //   onPressed: () {
              //     Get.snackbar(
              //       "Coming soon",
              //       "we are currently working on this app ",
              //     );
              //   },
              //   icon: Icon(Icons.more_horiz),
              // ),
            ],
          ),
          const SizedBox(height: 10),

          if (title.isNotEmpty)
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),

          if (message.isNotEmpty)
            Container(
              margin: EdgeInsets.only(top: 5),
              width: MediaQuery.widthOf(context),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                color: Colors.white.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                message,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.grey,
                ),
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
                  category ?? "Unknown",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              // Spacer(),

              // Text("Required ${attendees} people", style: TextStyle()),
              const SizedBox(width: 20),
              Row(
                children: [
                  Icon(Icons.people),
                  const SizedBox(width: 5),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Text(
                      attendees.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
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
