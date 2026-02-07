import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_sphere/controllers/user_controller.dart';
import 'package:social_sphere/models/event_model.dart';
import 'package:social_sphere/models/user_model.dart';
import 'package:social_sphere/services/event_service.dart';

class EventController extends GetxController {
  var peopleCount = 1.obs;

  final selectedCategory = "".obs;

  late final String? organiserId;

  final UserController userController = Get.find<UserController>();

  late final Rx<AppUser?> user = userController.user;

  final isLoading = false.obs;

  final events = <EventModel>[].obs;

  final eventService = EventService();

  final Rx<File?> selectedImages = Rx<File?>(null);

  void increment() {
    peopleCount.value++;
  }

  Future selectFile() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      selectedImages.value = File(image.path);
    }
  }

  Future<String?> uploadEventImage(String eventId) async {
    if (selectedImages.value == null) {
      return null;
    }
    return await eventService.uploadEventImage(
      eventId,
      selectedImages.value!.path,
    );
  }

  void decrement() {
    if (peopleCount.value > 1) {
      peopleCount.value--;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchEvents();
  }

  Future<void> createEvent(
    String title,
    String description,
    String location,
    String selectedCategory,
  ) async {
    if (user.value != null) {
      EventModel eventModel = EventModel(
        id: '',
        title: title,
        description: description,
        date: DateTime.now().toString(),
        location: location,
        attendees: peopleCount.value,
        organizerId: user.value!.uid,
        category: selectedCategory,
        userName: (user.value?.name),
      );
      isLoading.value = true;
      await eventService.createEvent(eventModel);
      final imageUrl = await uploadEventImage(eventModel.id);
      if (imageUrl != null) {
        eventModel = eventModel.copyWith(imageUrl: imageUrl);
      }
      isLoading.value = false;
    } else {
      Get.snackbar("Error", "User not logged in");
    }
  }

  // Future<void> updateEvent(String id , s) async {
  //   if (organiserId != null) {
  //     final updatedEvent = event.copyWith(
  //       title: title.text,
  //       description: description.text,
  //       date: date.text,
  //       location: location.text,
  //       attendees: peopleCount.value,
  //       category: selectedCategory.value,
  //     );
  //     isLoading.value = true;

  //     await eventService.updateEvent(updatedEvent);
  //     isLoading.value = false;
  //   } else {
  //     Get.snackbar("Error", "User not logged in");
  //   }
  // }

  Future<void> deleteEvent(EventModel event) async {
    isLoading.value = true;
    await eventService.deleteEvent(event);
    isLoading.value = false;
  }

  Future<void> fetchEvents() async {
    try {
      isLoading.value = true;
      final result = await eventService.getEvents();
      events.assignAll(result);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  bool validate(String title, String location) {
    if (title.trim().isEmpty) {
      Get.snackbar("Error", "Event title is required");
      return false;
    }
    if (location.trim().isEmpty) {
      Get.snackbar("Error", "Location is required");
      return false;
    }
    return true;
  }
}
