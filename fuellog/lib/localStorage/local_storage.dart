//  local storage to store the user name and phone no upon login

import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String _keyUserName = 'user_name';
  static const String _keyPhoneNumber = 'phone_number';
  static const String _KeyCond_Id = 'cond_Id';

  static Future<void> saveUserData(
      String userName, String phoneNumber, String cond_Id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(_keyUserName, userName);
      prefs.setString(_keyPhoneNumber, phoneNumber);
      prefs.setString(_KeyCond_Id, cond_Id);
    } catch (e) {
      print(e);
    }
  }

  static Future<Map<String, String?>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userName = prefs.getString(_keyUserName);
    final phoneNumber = prefs.getString(_keyPhoneNumber);
    final condId = prefs.getString(_KeyCond_Id);

    var userData = {
      'user_name': userName,
      'phone_number': phoneNumber,
      'cond_Id': condId
    };
    return userData;
  }

  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_keyUserName);
    prefs.remove(_keyPhoneNumber);
  }
}
