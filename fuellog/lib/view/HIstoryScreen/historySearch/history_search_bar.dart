// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuellog/controller/busHistory/bus_history.dart';
import 'package:fuellog/view/HIstoryScreen/historySearch/debouncer.dart';
import 'package:fuellog/view/constants/colors.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:permission_handler/permission_handler.dart';

class HistorySearchBarCustom extends StatefulWidget {
  final Widget suffixIcon;

  final double width;
  const HistorySearchBarCustom({
    super.key,
    required this.suffixIcon,
    required this.width,
  });

  @override
  State<HistorySearchBarCustom> createState() => _HistorySearchBarCustomState();
}

class _HistorySearchBarCustomState extends State<HistorySearchBarCustom> {
  final BusHistoryController busHistoryController =
      Get.find<BusHistoryController>();

  final _debouncer = Debouncer(milliseconds: 1 * 1000);

  String searchValue = '';

  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: TextField(
        controller: textController,

        onEditingComplete: () async {
          print('editing complete');
          busHistoryController.userInput.value = textController.text;
          await busHistoryController.fetchBusHistoryData(textController.text);

          FocusScope.of(context).unfocus();
        },
        // onSubmitted: (value) async {
        //   await _debouncer.run(() {
        //     searchValue = value;
        //   });
        //   await busHistoryController.fetchBusHistoryData(searchValue);
        //   // historyController.userInput.value = value;
        // },
        // // onTapOutside: (value) {
        // //   _debouncer.run(() {
        // //     historyController.userInput.value = '';
        // //   });
        // // },
        // onChanged: (value) async {
        //   await _debouncer.run(() {
        //     searchValue = value;
        //   });
        //   await busHistoryController.fetchBusHistoryData(searchValue);
        //   // historyController.userInput.value = value;
        // },
        // controller: controller,
        obscureText: false,
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
                onTap: () async {
                  await requestCameraPermission();
                  startScanAndNavigate(context);
                },
                child: widget.suffixIcon),
            contentPadding: EdgeInsets.symmetric(vertical: 22.h),
            // constraints: BoxConstraints(maxHeight: 92.h),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            fillColor: Colors.grey.shade200,
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 12.h),
              child: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
            filled: true,
            hintText: 'Bus No 52 or DXB135.',
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();

    super.dispose();
  }
}

void startScanAndNavigate(BuildContext context) async {
  final BusHistoryController busHistoryController =
      Get.find<BusHistoryController>();
  String qrScanner = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666', 'Cancel', true, ScanMode.QR);

  print(qrScanner);
  if (busHistoryController.isLoading.value) {
    context.loaderOverlay.show();
  } else {
    context.loaderOverlay.hide();
  }

  if (qrScanner != '-1') {
    await busHistoryController.fetchBusHistoryData(
      qrScanner,
    );
    // context.loaderOverlay.show();
    // await Future.delayed(const Duration(seconds: 1));
    busHistoryController.userInput.value = 'value';

    if (busHistoryController.isLoading.value) {
      context.loaderOverlay.show();
    } else if (!busHistoryController.isLoading.value) {
      context.loaderOverlay.hide();
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              'Error',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'No bus id found for this query.',
                  style: TextStyle(fontSize: 20.sp),
                ),
                SizedBox(height: 14.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the dialog
                      },
                      child: Text(
                        'OK',
                        style: TextStyle(color: appTheme, fontSize: 16.sp),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }
  } else if (qrScanner == '-1') {
    return;
  }
}

Future<void> requestCameraPermission() async {
  var status = await Permission.camera.status;
  if (!status.isGranted) {
    await Permission.camera.request();
  }
}
