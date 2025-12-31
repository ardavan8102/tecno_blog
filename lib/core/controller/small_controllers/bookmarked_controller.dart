import 'package:get/get.dart';

class BookmarkedController extends GetxController {

  RxBool isBookMarked = false.obs;

  void toggleBookMark() {
    isBookMarked.value = !isBookMarked.value;
  }
}