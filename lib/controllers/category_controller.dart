import 'package:get/get.dart';

class CategoryController extends GetxController {
  final currentIndex = 0.obs;

  void changeCategory(int index){
    currentIndex.value = index;
  }
}
