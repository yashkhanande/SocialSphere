import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_sphere/components/chat_card.dart';
import 'package:social_sphere/components/profile_photo.dart';
import 'package:social_sphere/components/search_button.dart';
import 'package:social_sphere/widgets/stories.dart';

class Inbox extends StatelessWidget {
  const Inbox({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 50),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Inbox",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Connect with ease",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    SearchButton(),
                    const SizedBox(width: 10),
                    ProfilePhoto(),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Stories(),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.widthOf(context),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.05),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.1),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ChatCard(),
                      ChatCard(),
                      ChatCard(),
                      ChatCard(),
                      ChatCard(),
                      ChatCard(),
                      ChatCard(),
                      ChatCard(),
                      ChatCard(),
                      ChatCard(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
