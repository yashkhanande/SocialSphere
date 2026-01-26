import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_sphere/pages/event/ideal_person_page.dart';

class CreateEventPage extends StatelessWidget {
  const CreateEventPage({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create Event",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: 0.1),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.4),
                        ),
                      ),
                      child: Icon(Icons.camera_alt_outlined, size: 50),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.widthOf(context),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.2),
                      ),
                      color: Colors.white.withValues(alpha: .05),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name"),
                        const SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Enter your event name...",
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),
                        Text("Description"),
                        const SizedBox(height: 10),
                        TextField(
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: "Enter event details....",

                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () => Get.to(() => IdealPersonPage()),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      width: MediaQuery.widthOf(context),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.2),
                        ),
                        color: Colors.white.withValues(alpha: .05),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Continue",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text("Step 1 of 3"),
            ],
          ),
        ),
      ),
    );
  }
}
