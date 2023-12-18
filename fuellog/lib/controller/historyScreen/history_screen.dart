import 'package:get/get.dart';

// This is initialised on the history screen 
// Used on the history search field to check whether there is input from the user or not

class HistoryScreenController extends GetxController {
  Rx<String> userInput = ''.obs;

  @override
  void onClose() {
    userInput.value = '';
    super.onClose();
  }
}
