import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CreateEventController extends GetxController {
  var peopleCount = 1.obs;

  void increment() {
    peopleCount.value++;
  }

  void decrement() {
    if (peopleCount.value > 1) {
      peopleCount.value--;
    }
  }
}
