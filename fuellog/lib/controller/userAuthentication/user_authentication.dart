import 'package:fuellog/model/ApiServices/api_services.dart';
import 'package:fuellog/model/apiModels/user_auth_model.dart';
import 'package:get/get.dart';

// this is initiated in the login screen

class UserAuthController extends GetxController {
  ApiServices apiServices = ApiServices();

  UserData? userAuthData = UserData();
  Rx<String> userLocalName = ''.obs;

  Rx<bool> isLoading = false.obs;
  Rx<bool> isPinError = false.obs;
  Rx<bool> isNetwrkError = false.obs;

  void resetStatus() {
    isPinError.value = false;
    isNetwrkError.value = false;
    isLoading.value = false;
  }

  Future<bool> fetchUserData(
      String action, String pin, String phoneNumber) async {
    try {
      isLoading(true);
      final data = await apiServices.userAuthData(action, pin, phoneNumber);
      print(data);

      // final userData = await UserPreferences.getUserData();
      // userLocalName.value = userData['user_name']!;

      if (data.data!.errorStatus == 0) {
        userAuthData = data;
        return true;
      } else if (data.data!.errorStatus == 1) {
        isPinError(true);
      } else {
        isNetwrkError(true);
      }

      return true;
    } catch (e) {
      print('this is the authentication issue $e');
      isPinError(true);
      isNetwrkError(true);

      return false;
    } finally {
      isLoading(false);

      await Future.delayed(const Duration(seconds: 2));
      isPinError(false);
      isNetwrkError(false);
    }
  }
}
