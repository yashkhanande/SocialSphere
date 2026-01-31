import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_sphere/components/event_card.dart';
import 'package:social_sphere/components/live_event_card.dart';
import 'package:social_sphere/components/notification_button.dart';
import 'package:social_sphere/components/profile_photo.dart';
import 'package:social_sphere/controllers/auth_controller.dart';
import 'package:social_sphere/controllers/event_controller.dart';
import 'package:social_sphere/controllers/user_controller.dart';
import 'package:social_sphere/models/event_model.dart';
import 'package:social_sphere/widgets/stories.dart';

class HomeTab extends StatelessWidget {
  final UserController userController = Get.find();
  final AuthController authController = Get.find();
  final EventController eventController = Get.put(EventController());

  HomeTab({super.key});
  @override
  Widget build(BuildContext context) {
    print("Rebuilding Home Tab");
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Social Sphere",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    NotificationButton(),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    "Live Now !",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Get.snackbar(
                        "Coming soon",
                        "we are currently working on this app ",
                      );
                    },
                    child: Text("Map View"),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      LiveEventCard(
                        image: "assets/seedhe_maut.jpg",
                        title: "Seedhe Maut - SMX Tour || Nagpur",
                      ),
                      LiveEventCard(
                        image: "assets/seedhe_maut.jpg",
                        title: "Seedhe Maut - SMX Tour || Nagpur",
                      ),
                      LiveEventCard(
                        image: "assets/seedhe_maut.jpg",
                        title: "Seedhe Maut - SMX Tour || Nagpur",
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "You may like this",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.replay_outlined),
                          onPressed: () {
                            eventController.fetchEvents();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    Obx(() {
                      if (eventController.isLoading.value) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (eventController.events.isEmpty) {
                        return Center(child: Text("No events found"));
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: eventController.events.length,
                        itemBuilder: (context, index) {
                          final event = eventController.events[index];
                          return EventCard(
                            title: event.title,
                            userName: event.userName ?? "Unknown",
                            location: event.location,
                            attendees: event.attendees,
                            message: event.description,
                            category: event.category,
                          );
                        },
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
