import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fuellog/localStorage/local_storage.dart';
import 'package:fuellog/model/apiConstants/api_endpoints.dart';
import 'package:fuellog/model/apiModels/bus_history.dart';
import 'package:fuellog/model/apiModels/bus_selection.dart';
import 'package:fuellog/model/apiModels/user_auth_model.dart';
import 'dart:async';

import 'package:http/http.dart' as http;

class ApiServices {
  Future<BusSelectionData> fetchSelectedBus(String action, String busId) async {
    try {
      final Uri uri = Uri.parse(ApiUrl().baseUrl);
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'API-Key': '525-777-777',
      };

      final Map<String, dynamic> body = {
        'action': action,
        'bus_id': busId.toString(),
      };

      final response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final busSelectionData = BusSelectionData.fromJson(data);

        print('this is from the apiservice ----------- $busSelectionData');
        return busSelectionData;
      } else {
        throw Exception('Failed to load bus selection data');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

//     "action": "fuel_login",
  // "password": "1234",
  //  "phone": "9747887948"

  Future<UserData> userAuthData(
      String action, String pin, String phoneNumber) async {
    try {
      final Uri uri = Uri.parse(ApiUrl().baseUrl);
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'API-Key': '525-777-777',
      };

      final Map<String, dynamic> body = {
        'action': action,
        'password': pin.toString(),
        'phone': phoneNumber,
      };

      final response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      print('this is the reponse from api call ${response.statusCode}');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        final userData = UserData.fromJson(data);
        print(userData);

        print(userData);

        //saving the data in local storage as well for further use

        await UserPreferences.saveUserData(
          userData.data!.data!.conductorDetails!.condName!,
          userData.data!.data!.conductorDetails!.condPhone!,
        );

        if (kDebugMode) {
          print('this is from the apiservice ----------- $userData');
        }
        return userData;
      } else {
        print(response.reasonPhrase);
        throw Exception(
            'Failed to load bus selection data. Status Code: ${response.statusCode}, Body: ${response.body}');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<BusHistory> getBusHistory(
    String busId,
  ) async {
    try {
      final Uri uri = Uri.parse(ApiUrl().baseUrl);
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'API-Key': '525-777-777',
      };

      final Map<String, dynamic> body = {
        'action': 'fuel_bus_history',
        'bus_id': busId.toString(),
      };

      final response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      print('this is the reponse from api call ${response.body}');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        final busHistory = BusHistory.fromJson(data);
        print(
            'vehicle history from api call-------------------------------------${busHistory.data!.data!.vehicleActivityHistory}');

        if (kDebugMode) {
          print('this is from the apiservice ----------- $busHistory');
        }
        return busHistory;
      } else {
        throw Exception(
            'Failed to load bus selection data. Status Code: ${response.statusCode}, Body: ${response.body}');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
