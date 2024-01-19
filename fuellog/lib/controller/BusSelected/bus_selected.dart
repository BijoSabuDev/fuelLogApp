import 'package:fuellog/model/ApiServices/api_services.dart';
import 'package:fuellog/model/apiModels/bus_selection.dart';
import 'package:get/get.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
// this is initiated in the main.dart

class BusSelectedController extends GetxController {
  ApiServices apiServices = ApiServices();

  // Rx<dynamic> busSelectionData = BusSelectionData().obs;
  BusSelectionData busSelectionData = BusSelectionData();

  RxList<String> vendorList = <String>[].obs;
  Rx<String> odoMeterReading = ''.obs;
  Rx<String> instId = ''.obs;
  Rx<bool> isLoading = false.obs;
  Rx<bool> isSuccess = false.obs;
  Rx<bool> noConnection = false.obs;

  Future<bool> fetchBusSelectionData(String action, String busId) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    try {
      isLoading(true);
      if (connectivityResult == ConnectivityResult.none) {
        noConnection(true);
        isLoading(false);
        return false;
      }
      vendorList.clear();
      print('vendorlist cleared');
      final data = await apiServices.fetchSelectedBus(action, busId);
      print('this is from the controller ---------------$data');

      busSelectionData = data;
      if (busSelectionData.instId != null) {
        instId.value = busSelectionData.instId!;
      }
      if (busSelectionData.data!.vendorDetails != null) {
        final List<VendorDetail> vendorDetails =
            busSelectionData.data!.vendorDetails!;
        for (var data in vendorDetails) {
          vendorList.add(data.vendorName!);
        }
        print('vendorlist added');
      } else {
        print('no vendordata');
        vendorList.add('Vendor list unavailable');
      }
      isSuccess(true);
      print(data.data!.busDetails![0].vehId);

      if (data.data!.busDetails != null) {
        isSuccess(true);
        isLoading(false);

        return true;
      } else {
        isLoading(false);

        return false;
      }
    } catch (e) {
      print('this is the busselection error $e');
      isLoading(false);

      return false;
    }
  }
}
