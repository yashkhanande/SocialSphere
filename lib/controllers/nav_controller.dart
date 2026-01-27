import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:social_sphere/pages/chat/inbox.dart';
import 'package:social_sphere/pages/explore/explore_page.dart';
import 'package:social_sphere/pages/home_tab.dart';
import 'package:social_sphere/pages/profile/profile_tab.dart';

class NavController extends GetxController {
  final currentIndex = 0.obs;
  void changeTab(int index) {
    currentIndex.value = index;
  }

  final pages = [HomeTab(), ExplorePage(), Inbox(), ProfileTab()];
}
