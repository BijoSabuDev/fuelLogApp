import 'package:fuellog/model/ApiServices/api_services.dart';
import 'package:fuellog/model/apiModels/bus_selection.dart';
import 'package:get/get.dart';

// this is initiated in the main.dart

class BusSelectedController extends GetxController {
  ApiServices apiServices = ApiServices();

  // Rx<dynamic> busSelectionData = BusSelectionData().obs;
  BusSelectionData busSelectionData = BusSelectionData();
  Rx<String> odoMeterReading = ''.obs;

  Rx<bool> isLoading = false.obs;
  Rx<bool> isSuccess = false.obs;
  Rx<bool> noResults = false.obs;

  Future<bool> fetchBusSelectionData(String action, String busId) async {
    try {
      isLoading(true);
      final data = await apiServices.fetchSelectedBus(action, busId);
      print('this is from the controller ---------------$data');

      busSelectionData = data;
      isSuccess(true);
      print(data.busID);

      if (data.data!.busDetails != null) {
        isSuccess(true);
        isLoading(false);
        noResults(false);
        return true;
      } else {
        isLoading(false);
        noResults(true);
        return false;
      }
    } catch (e) {
      isLoading(false);
      noResults(true);
      return false;
    }
  }
}
