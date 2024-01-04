//  local storage to store the user name and phone no upon login

import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String _keyUserName = 'user_name';
  static const String _keyPhoneNumber = 'phone_number';

  static Future<void> saveUserData(String userName, String phoneNumber) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(_keyUserName, userName);
      prefs.setString(_keyPhoneNumber, phoneNumber);
    } catch (e) {
      print(e);
    }
  }

  static Future<Map<String, String?>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userName = prefs.getString(_keyUserName);
    final phoneNumber = prefs.getString(_keyPhoneNumber);

    var userData = {
      'user_name': userName,
      'phone_number': phoneNumber,
    };
    return userData;
  }

  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_keyUserName);
    prefs.remove(_keyPhoneNumber);
  }
}
