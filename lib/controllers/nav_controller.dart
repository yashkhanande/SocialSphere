import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NavController extends GetxController {
  final currentIndex = 0.obs;
  void changeTab(int index) {
    currentIndex.value = index;
  }
}
