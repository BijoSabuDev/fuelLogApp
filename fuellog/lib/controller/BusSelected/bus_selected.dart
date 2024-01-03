import 'package:fuellog/model/ApiServices/api_services.dart';
import 'package:fuellog/model/apiModels/bus_selection.dart';
import 'package:get/get.dart';

// this is initiated in the main.dart

class BusSelectedController extends GetxController {
  ApiServices apiServices = ApiServices();

  // Rx<dynamic> busSelectionData = BusSelectionData().obs;
  BusSelectionData busSelectionData = BusSelectionData();
  Rx<String> odoMeterReading = ''.obs;

  Future<bool> fetchBusSelectionData(String action, String busId) async {
    try {
      final data = await apiServices.fetchSelectedBus(action, busId);
      print('this is from the controller ---------------$data');

      busSelectionData = data;
      if (data.busID != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
      // Handle error
      // rethrow;
    }
  }
}
