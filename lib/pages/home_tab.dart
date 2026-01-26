import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_sphere/components/event_card.dart';
import 'package:social_sphere/components/profile_photo.dart';
import 'package:social_sphere/controllers/user_controller.dart';
import 'package:social_sphere/widgets/stories.dart';

class HomeTab extends StatelessWidget {
  final UserController user = Get.find();
  HomeTab({super.key});
  @override
  Widget build(BuildContext context) {
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
                            "Good Evening,",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            user.userName.split(" ").first,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff9CA3AF),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    ProfilePhoto(),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Active Circles",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Stories(),
                    const SizedBox(height: 30),
                    Text(
                      "You may like this",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 20),
                    EventCard(
                      userName: 'Aniket Tekam',
                      distance: '1.1',
                      message:
                          'this is aniket here i want a partner who can understand me and dont have any bestfriend',
                      profile_path: 'assets/aniket.jpeg',
                    ),
                    EventCard(
                      userName: 'Prajwal Diwnale',
                      distance: '6.9',
                      message:
                          'hello everyone i want a partner who can handle my drugs expenses',
                      profile_path: 'assets/cokehead.jpg',
                    ),
                    EventCard(
                      userName: 'Prajwal Diwnale',
                      distance: '6.9',
                      message:
                          'hello everyone i want a partner who can handle my drugs expenses',
                      profile_path: 'assets/cokehead.jpg',
                    ),
                    EventCard(
                      userName: 'Prajwal Diwnale',
                      distance: '6.9',
                      message:
                          'hello everyone i want a partner who can handle my drugs expenses',
                      profile_path: 'assets/cokehead.jpg',
                    ),
                    EventCard(
                      userName: 'Prajwal Diwnale',
                      distance: '6.9',
                      message:
                          'hello everyone i want a partner who can handle my drugs expenses',
                      profile_path: 'assets/cokehead.jpg',
                    ),
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
