import 'package:get/get.dart';
import 'package:social_sphere/models/user_model.dart';

class UserController extends GetxController {
  Rx<AppUser?> user = Rx<AppUser?>(null);

  void setUser(AppUser appUser){
    user.value = appUser;
  }
  void clearUser(){
    user.value = null;
  }
}

