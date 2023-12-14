import 'package:get/get.dart';

class HistoryScreenController extends GetxController {
  Rx<String> userInput = ''.obs;

  @override
  void onClose() {
    userInput.value = '';
    super.onClose();
  }
}
