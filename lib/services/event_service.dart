import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:social_sphere/models/event_model.dart';

class EventService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createEvent(EventModel event) async {
    try {
      final docRef = _firestore.collection("events").doc();
      await docRef.set(event.copyWith(id: docRef.id).toMap());
      Get.snackbar("Success", "Event created successfully");
    } catch (e) {
      Get.snackbar("Failure", e.toString());
    }
  }

  Future<void> updateEvent(EventModel event) async {
    try {
      await _firestore.collection("events").doc(event.id).update(event.toMap());
         Get.snackbar("Success", "Event created successfully");
    } catch (e) {
      Get.snackbar("Failed", e.toString());
    }
  }

  Future<void> deleteEvent(EventModel event) async {
    try {
      await _firestore.collection("events").doc(event.id).delete();
    } catch (e) {
      Get.snackbar("Failure", e.toString());
    }
  }

  Future<List<EventModel>> getEvents() async {
    try {
      final snapshot = await _firestore.collection("events").get();
      return snapshot.docs
          .map((doc) => EventModel.fromMap(doc.data(), doc.id))
          .toList();
    } catch (e) {
      Get.snackbar("Failure", e.toString());
      return [];
    }
  }
}
