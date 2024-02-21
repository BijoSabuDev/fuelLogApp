import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fuellog/localStorage/local_storage.dart';
import 'package:fuellog/model/apiConstants/api_endpoints.dart';
import 'package:fuellog/model/apiConstants/api_key.dart';
import 'package:fuellog/model/apiModels/bus_history.dart';
import 'package:fuellog/model/apiModels/bus_selection.dart';
import 'package:fuellog/model/apiModels/bus_submission.dart';
import 'package:fuellog/model/apiModels/user_auth_model.dart';
import 'dart:async';

import 'package:http/http.dart' as http;

class ApiServices {
  // GET THE DETAILS OF SELECTED BUS

  Future<BusSelectionData> fetchSelectedBus(
      String action, String busId, String instId) async {
    try {
      final Uri uri = Uri.parse(ApiUrl().baseUrl);
      final Map<String, String> headers = {
        'API-Key': apiKey,
      };

      final Map<String, dynamic> body = {
        'action': action,
        'bus_id': busId.toString(),
        "inst_id": instId
      };

      final response = await http.post(
        uri,
        headers: headers,
        body: body,
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

  // GET THE DETAILS OF USER LOGGED IN

  Future<UserData> userAuthData(
      String action, String pin, String phoneNumber, String version) async {
    try {
      final Uri uri = Uri.parse(ApiUrl().baseUrl);
      final Map<String, String> headers = {
        'API-Key': apiKey,
      };

      final Map<String, dynamic> body = {
        'action': action,
        'password': pin.toString(),
        'phone': phoneNumber,
        "ver_id": version
      };

      final response = await http.post(
        uri,
        headers: headers,
        body: body,
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
          userData.data!.data!.conductorDetails!.condId!,
          userData.data!.instId!,
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

  // GET THE DETAILS OF BUS HISTORY

  Future<BusHistoryData> getBusHistory(String busId, String instId) async {
    try {
      final Uri uri = Uri.parse(ApiUrl().baseUrl);
      final Map<String, String> headers = {
        'API-Key': apiKey,
      };

      final Map<String, dynamic> body = {
        'action': 'fuel_bus_history',
        'bus_id': busId.toString(),
        "inst_id": instId
      };

      final response = await http.post(
        uri,
        headers: headers,
        body: body,
      );
      // print('this is the reponse from api call ${response.body}');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('this is data after decoding --- $data');
        final busHistory = BusHistoryData.fromJson(data);
        print(
            'vehicle history from api call-------------------------------------${busHistory.data!.data!.vehicleActivityHistory!.length}');

        if (kDebugMode) {
          print('this is from the apiservice ----------- $busHistory');
        }
        return busHistory;
      } else {
        throw Exception(
            'Failed to load bus selection data. Status Code: ${response.statusCode}, Body: ${response.body}');
      }
    } catch (e) {
      print('this is the exception from the apiservice $e');
      rethrow;
    }
  }

  // SUBMIT THE FUEL VALUE ,IMAGE IS OPTIONAL

  Future<BusSubmittedResponse?> submitFuelValue(
    String action,
    String busId,
    String busOdometer,
    String fuelPrice,
    String fuelQuantity,
    String vendorName,
    String billNo,
    String logId,
    String instId,
    File? file,
  ) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(ApiUrl().baseUrl));

      var headers = {
        'Authorization': '525-777-777',
      };
      request.headers.addAll(headers);
      request.fields.addAll({
        'action': action,
        'bus_Id': busId,
        'bus_odometer': busOdometer,
        'fuel_price': fuelPrice,
        'fuel_quantity': fuelQuantity,
        'vendor_name': vendorName,
        'bill_no': billNo,
        'log_ID': logId,
        'inst_ID': instId,
      });

      if (file != null) {
        request.files.add(http.MultipartFile.fromBytes(
            'bus_Image', await file.readAsBytes(),
            filename: 'fuelImage.jpg'));
      }

      // Send the request
      http.StreamedResponse response = await request.send();

      print(response.reasonPhrase);

      if (response.statusCode == 200) {
        final data = await jsonDecode(await response.stream.bytesToString());

        final busSubmittedResponse = BusSubmittedResponse.fromJson(data);
        print(
            'bussubmitted result------ ${busSubmittedResponse.data!.message}');

        return busSubmittedResponse;
      } else {
        return null;
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
