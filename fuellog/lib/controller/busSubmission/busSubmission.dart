import 'package:get/get.dart';

class BusSubmissionController extends GetxController {
  Rx<String> odometerValue = ''.obs;
  Rx<String> fuelQuantityValue = ''.obs;
  Rx<String> fuelQuantityDecimalValue = ''.obs;
  Rx<String> fuelPriceValue = ''.obs;
  Rx<String> calculatedValue = ''.obs;
  Rx<String> totalFuelQuantityValue = ''.obs;

  void resetValues() {
    odometerValue.value = '';
    fuelQuantityValue.value = '';
    fuelQuantityDecimalValue.value = '';
    fuelPriceValue.value = '';
    calculatedValue.value = '';
    totalFuelQuantityValue.value = '';
  }

  void updateCalculatedValue() {
    int quantity = int.tryParse(fuelQuantityValue.value) ?? 0;
    int decimalQuantity = int.tryParse(fuelQuantityDecimalValue.value) ?? 0;
    double price = double.tryParse(fuelPriceValue.value) ?? 0;
    totalFuelQuantityValue.value = "$quantity.$decimalQuantity".toString();

    int resultValue = quantity + decimalQuantity;

    double result = resultValue * price;

    calculatedValue.value =
        result.toStringAsFixed(2); // Format result as needed
  }

  void updateOdometerValue(String value) {
    odometerValue.value = value;
  }

  void updatefuelQuantityValue(String value) {
    fuelQuantityValue.value = value;
  }

  void updatefuelQuantityDecimalValue(String value) {
    fuelQuantityDecimalValue.value = value;
  }

  void updatefuelPriceValue(String value) {
    fuelPriceValue.value = value;
  }

  Future<void> submitBusData() async {
    try {} catch (e) {}
  }
}
