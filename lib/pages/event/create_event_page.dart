import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_sphere/components/categories.dart';
import 'package:social_sphere/controllers/create_event_controller.dart';
import 'package:social_sphere/pages/event/ideal_person_page.dart';

class CreateEventPage extends StatelessWidget {
  final categories = const [
    {'name': 'All', 'icon': 'assets/all.png'},
    {'name': 'Coffee', 'icon': 'assets/coffee.png'},
    {'name': 'Work', 'icon': 'assets/work.png'},
    {'name': 'Game', 'icon': 'assets/game.png'},
  ];
  final controller = Get.put(CreateEventController());

  CreateEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create Activities",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Center(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          Get.snackbar("Camera", "Open camera / gallery");
                        },
                        child: Container(
                          width: 120,
                          height: 120,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.05),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.camera_alt_outlined, size: 40),
                            ],
                          ),
                        ),
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
                          Text(
                            "Category (pick)",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Obx(
                              () => Row(
                                children: List.generate(
                                  categories.length,
                                  (index) => Categories(
                                    index: index,
                                    category: categories[index]['name']!,
                                    imagePath: categories[index]['icon']!,
                                    isSelected:
                                        controller.selectedCategory.value ==
                                        categories[index]['name']!,
                                    onTap: () {
                                      controller.selectedCategory.value =
                                          categories[index]['name']!;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text("title"),
                          const SizedBox(height: 10),
                          TextField(
                            controller: controller.title,
                            decoration: InputDecoration(
                              hintText: "Enter your event name...",
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.05),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Caption",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: controller.description,
                            decoration: InputDecoration(
                              hintText: "This is the description of the event ",
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.05),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            maxLines: 5,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Number of People Required",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(() {
                                  final isDisabled =
                                      controller.peopleCount.value <= 1;
                                  return InkWell(
                                    onTap: isDisabled
                                        ? null
                                        : controller.decrement,
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Colors.white.withOpacity(
                                        isDisabled ? 0.05 : 0.1,
                                      ),
                                      child: Icon(Icons.remove, size: 20),
                                    ),
                                  );
                                }),

                                Obx(
                                  () => Text(
                                    controller.peopleCount.value.toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                InkWell(
                                  onTap: controller.increment,
                                  borderRadius: BorderRadius.circular(50),
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: Colors.white.withOpacity(
                                      0.1,
                                    ),
                                    child: Icon(Icons.add, size: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Location",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: controller.location,
                            decoration: InputDecoration(
                              hintText: "Enter the location of the event",
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.05),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              suffixIcon: InkWell(
                                onTap: () =>
                                    Get.snackbar("Location", "Location tapped"),
                                child: Icon(Icons.location_on_outlined),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        if (controller.validate()) {
                          controller.createEvent();
                        }
                      },
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
                        child: Obx(
                          () => controller.isLoading.value
                              ? Center(child: CircularProgressIndicator())
                              : Text(
                                  "Create Event",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
