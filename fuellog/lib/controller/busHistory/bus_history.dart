import 'package:fuellog/model/ApiServices/api_services.dart';
import 'package:fuellog/model/apiModels/bus_history.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

//this is initialized in the main.dart

class BusHistoryController extends GetxController {
  ApiServices apiServices = ApiServices();
  Rx<BusHistory?> busHistory = BusHistory().obs;

  Rx<bool> isLoading = false.obs;
  Rx<bool> isSuccess = false.obs;
  Rx<bool> noResults = false.obs;

  Rx<String> userInput = ''.obs;

  // List<String> dateList = [];
  // List<String> timeList = [];
  // List<String> vhactRateList = [];
  // List<String> vhactFuelQuantityList = [];
  // List<String> vhactReading = [];

  RxList<String> dateList = <String>[].obs;
  RxList<String> timeList = <String>[].obs;
  RxList<String> vhactRateList = <String>[].obs;
  RxList<String> vhactFuelQuantityList = <String>[].obs;
  RxList<String> vhactReading = <String>[].obs;

  @override
  void onClose() {
    dateList.clear();
    timeList.clear();
    vhactRateList.clear();
    vhactFuelQuantityList.clear();
    vhactReading.clear();
    userInput.value = '';
    super.onClose();
  }

  Future<void> fetchBusHistoryData(String input) async {
    try {
      isLoading(true);

      await apiServices.getBusHistory(input).then((value) {
        print('api is called');

        busHistory.value = value;
        isSuccess(true);
      });

      print(
          'bushistory vvalue${busHistory.value!.data!.data!.vehicleActivityHistory}');

      if (busHistory.value!.data != null &&
          busHistory.value!.data!.data != null &&
          busHistory.value!.data!.data!.vehicleActivityHistory != null) {
        for (var entry
            in busHistory.value!.data!.data!.vehicleActivityHistory!) {
          DateTime entryDate = DateTime.parse(entry['EntryDate']!);
          String formattedDate = DateFormat('yyyy-MM-dd').format(entryDate);
          dateList.add(formattedDate);
          timeList.add(entry['EntryDate'].toString().split(' ')[1]);
          vhactRateList.add(entry['vhact_rate']!);
          vhactFuelQuantityList.add(entry['vhact_quantity']!);
          vhactReading.add(entry['vhact_reading']!);
        }
      } else {
        isSuccess(false);
        noResults(true);
      }
    } catch (e) {
      isSuccess(false);
      noResults(true);
    } finally {
      isLoading(false);
      noResults(false);
    }
  }
}
