// ignore_for_file: invalid_use_of_protected_member

import 'package:fuellog/model/ApiServices/api_services.dart';
import 'package:fuellog/model/apiModels/bus_history.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

//this is initialized in the main.dart

class BusHistoryController extends GetxController {
  ApiServices apiServices = ApiServices();
  Rx<BusHistoryData?> busHistory = Rx<BusHistoryData?>(null);

  Rx<bool> isLoading = false.obs;
  Rx<bool> isSuccess = false.obs;
  Rx<bool> noResults = false.obs;
  Rx<bool> noConnection = false.obs;

  Rx<String> userInput = ''.obs;

  RxList<String> dateList = <String>[].obs;
  RxList<String> timeList = <String>[].obs;
  RxList<String> vhactRateList = <String>[].obs;
  RxList<String> vhactFuelQuantityList = <String>[].obs;
  RxList<String> vhactReading = <String>[].obs;

  @override
  void onClose() {
    // busHistory.close();
    dateList.clear();
    timeList.clear();
    vhactRateList.clear();
    vhactFuelQuantityList.clear();
    vhactReading.clear();
    userInput.value = '';
    super.onClose();
  }

  Future<void> fetchBusHistoryData(String input, String instId) async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    try {
      isLoading(true);

      if (connectivityResult == ConnectivityResult.none) {
        noConnection(true);
        isLoading(false);
        return;
      }

      dateList.clear();
      timeList.clear();
      vhactRateList.clear();
      vhactFuelQuantityList.clear();
      vhactReading.clear();
      busHistory.value = null;

      await apiServices.getBusHistory(input, instId).then((value) {
        print('api is called');

        busHistory.value = value;
        isSuccess(true);
      }).catchError((error) {
        print('Error during API call: $error');
      });

      print('bushistory value${busHistory.value!}');
      // if (busHistory.value!.data!.dataStatus == 0) {
      //   noResults(true);
      //   return;
      // }

      if (busHistory.value!.data != null &&
          busHistory.value!.data!.data != null &&
          busHistory.value!.data!.data!.vehicleActivityHistory != null) {
        for (var entry
            in busHistory.value!.data!.data!.vehicleActivityHistory!) {
          DateTime entryDate =
              DateFormat('dd-MM-yy HH:mm:ss').parse(entry.vhactDateDisplay!);
          String formattedDate = DateFormat('dd-MMM-yyyy').format(entryDate);
          String formattedTime = DateFormat('h:mm a').format(entryDate);

          dateList.value.add(formattedDate);

          timeList.value.add(formattedTime);
          vhactRateList.value.add(entry.vhactRate!);
          vhactFuelQuantityList.value.add(entry.vhactQuantity!);
          vhactReading.value.add(entry.vhactReading!);
        }
      } else {
        isSuccess(false);
        noResults(true);
      }
    } catch (e) {
      print('this is the bushistory error $e');
      isSuccess(false);
      noResults(true);
    } finally {
      isLoading(false);
      // noResults(false);
    }
  }
}
