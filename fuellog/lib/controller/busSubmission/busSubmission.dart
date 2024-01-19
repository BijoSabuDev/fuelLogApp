import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fuellog/model/ApiServices/api_services.dart';
import 'package:fuellog/model/apiModels/bus_submission.dart';
import 'package:get/get.dart';

class BusSubmissionController extends GetxController {
  ApiServices apiServices = ApiServices();

  Rx<String> selectedVendor = ''.obs;
  Rx<String> billNumber = ''.obs;

  Rx<String> odometerValue = ''.obs;
  Rx<String> fuelQuantityValue = ''.obs;
  Rx<String> fuelQuantityDecimalValue = ''.obs;
  Rx<String> fuelPriceValue = ''.obs;
  Rx<String> calculatedValue = ''.obs;
  Rx<String> totalFuelQuantityValue = ''.obs;
  Rx<File?> imageFile = Rx<File?>(null);

  Rx<bool> isLoading = false.obs;
  Rx<bool> isSuccess = false.obs;
  Rx<bool> noConnection = false.obs;

  BusSubmittedResponse busSubmittedResponse = BusSubmittedResponse();

  //resetting the values stored in the variables

  void resetValues() {
    odometerValue.value = '';
    fuelQuantityValue.value = '';
    fuelQuantityDecimalValue.value = '';
    fuelPriceValue.value = '';
    calculatedValue.value = '';
    totalFuelQuantityValue.value = '';
    imageFile.value = null;
  }

//  submit the values from the screen

  Future<bool> submitFuelValue(
      String action,
      String busId,
      File? file,
      String busOdometer,
      String fuelPrice,
      String fuelQuantity,
      String vendorName,
      String billNo,
      String logId,
      String instId) async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    try {
      isLoading(true);
      if (connectivityResult == ConnectivityResult.none) {
        noConnection(true);
        isLoading(false);
        // return false;
      }

      final data = await apiServices.submitFuelValue(
          action,
          busId,
          file,
          busOdometer,
          fuelPrice,
          fuelQuantity,
          vendorName,
          billNo,
          logId,
          instId);

      print('this is data from controller ${data!.data!.message}');

      busSubmittedResponse = data;
      isSuccess(true);
      return true;

      // if (data.data!.errorStatus == 0) {
      //   isSuccess(true);
      //   isLoading(false);

      //   return true;
      // } else {
      //   isLoading(false);

      //   return false;
      // }
    } catch (e) {
      print('this is the busselection error $e');
      isLoading(false);

      return false;
    }
  }

//to update the calculated value in the text section of the vehicle screen

  Future<void> updateCalculatedValue() async {
    int quantity = int.tryParse(fuelQuantityValue.value) ?? 0;
    int decimalQuantity = int.tryParse(fuelQuantityDecimalValue.value) ?? 0;
    double price = double.tryParse(fuelPriceValue.value) ?? 0;
    totalFuelQuantityValue.value = "$quantity.$decimalQuantity".toString();
    String resultValue = "$quantity.$decimalQuantity";
    // int resultValue = quantity + decimalQuantity;

    // double result = resultValue * price;
    double result = double.parse(resultValue) * price;

    calculatedValue.value = result.toStringAsFixed(2);
  }

  void updateOdometerValue(String value) {
    odometerValue.value = value;
  }

  void updatefuelQuantityValue(String value) {
    fuelQuantityValue.value = value.toString();
  }

  void updatefuelQuantityDecimalValue(String value) {
    fuelQuantityDecimalValue.value = value;
  }

  void updatefuelPriceValue(String value) {
    fuelPriceValue.value = value;
  }
}
