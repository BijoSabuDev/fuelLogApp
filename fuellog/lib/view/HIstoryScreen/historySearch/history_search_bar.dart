// ignore_for_file: use_build_context_synchronously

import 'package:barcode_scan2/gen/protos/protos.pb.dart';
import 'package:barcode_scan2/gen/protos/protos.pbenum.dart';
import 'package:barcode_scan2/model/android_options.dart';
import 'package:barcode_scan2/model/scan_options.dart';
import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuellog/controller/busHistory/bus_history.dart';
import 'package:fuellog/controller/userAuthentication/user_authentication.dart';
import 'package:fuellog/localStorage/local_storage.dart';
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
  final UserAuthController userAuthController = Get.find<UserAuthController>();

  // final _debouncer = Debouncer(milliseconds: 1 * 1000);

  String searchValue = '';

  final TextEditingController textController = TextEditingController();

  static final _possibleFormats = BarcodeFormat.values.toList()
    ..removeWhere((e) => e == BarcodeFormat.unknown);

  List<BarcodeFormat> selectedFormats = [..._possibleFormats];
  final _flashOnController = TextEditingController(text: 'Flash on');
  final _flashOffController = TextEditingController(text: 'Flash off');
  final _cancelController = TextEditingController(text: 'Cancel');

  final _aspectTolerance = 0.00;
  var _numberOfCameras = 0;
  final _selectedCamera = -1;
  final _useAutoFocus = true;
  final _autoEnableFlash = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      _numberOfCameras = await BarcodeScanner.numberOfCameras;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: TextField(
        controller: textController,
        // onSubmitted: (value) async {
        //   if (value.isEmpty) {
        //     busHistoryController.busHistory.value = null;
        //   }
        //   final userData = await UserPreferences.getUserData();
        //   final instId = userData['inst_id'];

        //   print('editing complete');
        //   busHistoryController.userInput.value = textController.text;

        //   await busHistoryController.fetchBusHistoryData(
        //       textController.text, instId!);
        // },
        onEditingComplete: () async {
          final userData = await UserPreferences.getUserData();
          final instId = userData['inst_id'];

          print('editing complete');
          busHistoryController.userInput.value = textController.text;

          await busHistoryController.fetchBusHistoryData(
              textController.text, instId!);
        },
        obscureText: false,
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
                onTap: () async {
                  await requestCameraPermission();
                  _scan();
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
            hintText: 'Vh No or Reg No',
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();

    super.dispose();
  }

  Future<void> _scan() async {
    final BusHistoryController busHistoryController =
        Get.find<BusHistoryController>();
    try {
      final result = await BarcodeScanner.scan(
        options: ScanOptions(
          strings: {
            'cancel': _cancelController.text,
            'flash_on': _flashOnController.text,
            'flash_off': _flashOffController.text,
          },
          restrictFormat: selectedFormats,
          useCamera: _selectedCamera,
          autoEnableFlash: _autoEnableFlash,
          android: AndroidOptions(
            aspectTolerance: _aspectTolerance,
            useAutoFocus: _useAutoFocus,
          ),
        ),
      );
      print('this is the scan result ------ ${result.rawContent}');
      if (busHistoryController.isLoading.value) {
        context.loaderOverlay.show();
      } else {
        context.loaderOverlay.hide();
      }

      final userData = await UserPreferences.getUserData();
      final instId = userData['inst_id'];
      await busHistoryController.fetchBusHistoryData(
          result.rawContent, instId!);
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
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }
}

// void startScanAndNavigate(BuildContext context) async {
//   final BusHistoryController busHistoryController =
//       Get.find<BusHistoryController>();
//   String qrScanner = await FlutterBarcodeScanner.scanBarcode(
//       '#ff6666', 'Cancel', true, ScanMode.QR);

//   print(qrScanner);
//   if (busHistoryController.isLoading.value) {
//     context.loaderOverlay.show();
//   } else {
//     context.loaderOverlay.hide();
//   }

//   if (qrScanner != '-1') {
//     final userData = await UserPreferences.getUserData();
//     final instId = userData['inst_id'];
//     await busHistoryController.fetchBusHistoryData(qrScanner, instId!);
//     // context.loaderOverlay.show();
//     // await Future.delayed(const Duration(seconds: 1));
//     busHistoryController.userInput.value = 'value';

//     if (busHistoryController.isLoading.value) {
//       context.loaderOverlay.show();
//     } else if (!busHistoryController.isLoading.value) {
//       context.loaderOverlay.hide();
//     } else {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             backgroundColor: Colors.white,
//             title: Text(
//               'Error',
//               style: TextStyle(
//                 fontSize: 24.sp,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             content: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   'No bus id found for this query.',
//                   style: TextStyle(fontSize: 20.sp),
//                 ),
//                 SizedBox(height: 14.h),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.pop(context); // Close the dialog
//                       },
//                       child: Text(
//                         'OK',
//                         style: TextStyle(color: appTheme, fontSize: 16.sp),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     }
//   } else if (qrScanner == '-1') {
//     return;
//   }
// }

Future<void> requestCameraPermission() async {
  var status = await Permission.camera.status;
  if (!status.isGranted) {
    await Permission.camera.request();
  }
}
