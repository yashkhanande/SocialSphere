import 'package:get/get.dart';

class UserController extends GetxController {
  final userName = "Aniket Tekam";
  final profile_photo = "assets/aniket.jpeg";
  final User user = User(
    name: "Aniket Tekam",
    email: "aniket@example.com",
    profilePhoto: "assets/aniket.jpeg",
  );
}

class User {
  final String? name;
  final String? email;
  final String? profilePhoto;

  User({this.name, this.email, this.profilePhoto});
}
