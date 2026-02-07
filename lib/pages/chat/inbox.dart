import 'package:flutter/material.dart';
import 'package:social_sphere/components/chat_card.dart';
import 'package:social_sphere/components/search_button.dart';

class Inbox extends StatelessWidget {
  final categories = const [
    {'name': 'All', 'icon': 'assets/all.png'},
    {'name': 'Coffee', 'icon': 'assets/coffee.png'},
    {'name': 'Work', 'icon': 'assets/work.png'},
    {'name': 'Game', 'icon': 'assets/game.png'},
    {'name': 'Game', 'icon': 'assets/game.png'},
  ];
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
                  ],
                ),
              ),
              
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(8),
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
            ],
          ),
        ),
      ),
    );
  }
}
