import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:social_sphere/models/event_model.dart';
import 'package:social_sphere/services/event_service.dart';

class CreateEventController extends GetxController {
  var peopleCount = 1.obs;

  final title = TextEditingController();
  final description = TextEditingController();
  final location = TextEditingController();
  final date = TextEditingController();
  final selectedCategory = "".obs;
  late final String? organiserId;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    organiserId = FirebaseAuth.instance.currentUser?.uid;
  }

  final eventService = EventService();

  void increment() {
    peopleCount.value++;
  }

  void decrement() {
    if (peopleCount.value > 1) {
      peopleCount.value--;
    }
  }

  @override
  void onClose() {
    title.dispose();
    description.dispose();
    location.dispose();
    date.dispose();
    super.onClose();
  }

  Future<void> createEvent() async {
    if (organiserId != null) {
      EventModel eventModel = EventModel(
        id: '',
        title: title.text,
        description: description.text,
        date: date.text,
        location: location.text,
        attendees: peopleCount.value,
        organizerId: organiserId!,
        category: selectedCategory.value,
      );
      isLoading.value = true;
      await eventService.createEvent(eventModel);
      isLoading.value = false;
    } else {
      Get.snackbar("Error", "User not logged in");
    }
  }

  Future<void> updateEvent(EventModel event) async {
    if (organiserId != null) {
      final updatedEvent = event.copyWith(
        title: title.text,
        description: description.text,
        date: date.text,
        location: location.text,
        attendees: peopleCount.value,
        category: selectedCategory.value,
      );
      isLoading.value = true;

      await eventService.updateEvent(updatedEvent);
      isLoading.value = false;
    } else {
      Get.snackbar("Error", "User not logged in");
    }
  }

  Future<void> deleteEvent(EventModel event) async {
    isLoading.value = true;
    await eventService.deleteEvent(event);
    isLoading.value = false;
  }

  Future<List<EventModel>> getEvents() async {
    isLoading.value = true;
    final events = await eventService.getEvents();
    isLoading.value = false;
    return events;
  }
  bool validate() {
  if (title.text.trim().isEmpty) {
    Get.snackbar("Error", "Event title is required");
    return false;
  }
  if (location.text.trim().isEmpty) {
    Get.snackbar("Error", "Location is required");
    return false;
  }
  return true;
}
}
