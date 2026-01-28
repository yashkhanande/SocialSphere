import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_sphere/components/activity_card.dart';
import 'package:social_sphere/components/commmunity_card.dart';
import 'package:social_sphere/components/live_event_card.dart';

class AllContent extends StatelessWidget {
  const AllContent({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                "Activities",
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
                child: Text("See all"),
              ),
            ],
          ),
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.85,
            ),
            children: [
              ActivityCard(),
              ActivityCard(),
              ActivityCard(),
              ActivityCard(),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                "Community",
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
                child: Text("See all"),
              ),
            ],
          ),
          ListView(
            shrinkWrap: true,
            children: [CommmunityCard(), CommmunityCard(), CommmunityCard()],
          ),
        ],
      ),
    );
  }
}
