import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuellog/view/HIstoryScreen/history_app_bar.dart';
import 'package:fuellog/view/HIstoryScreen/listview_item.dart';
import 'package:fuellog/view/util/bus_no_box.dart';
import 'package:fuellog/view/util/search_field.dart';
import 'package:permission_handler/permission_handler.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // void scanQrCode() async {
    //   String qrScanner;
    //   try {
    //     qrScanner = await FlutterBarcodeScanner.scanBarcode(
    //         '#ff6666', 'Cancel', true, ScanMode.QR);
    //     debugPrint(qrScanner);
    //   } on PlatformException {
    //     qrScanner = 'failed to get platform version';
    //     print('Error occurred');
    //   }
    // }

    // Future<void> requestCameraPermission() async {
    //   var status = await Permission.camera.status;
    //   if (!status.isGranted) {
    //     await Permission.camera.request();
    //   }
    // }

    void scanQr() async {
      var status = await Permission.camera.status;
      String qrScanner;
      if (!status.isGranted) {
        await Permission.camera.request();
      }

      try {
        qrScanner = await FlutterBarcodeScanner.scanBarcode(
            '#ff6666', 'Cancel', true, ScanMode.QR);
        debugPrint(qrScanner);
      } on PlatformException {
        qrScanner = 'failed to get platform version';
        print('Error occurred');
      }
    }

    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 72.h,
        ),
        const HistoryAppBar(),
        SizedBox(
          height: 22.h,
        ),
        SearchBarCustom(
                onPressedFunction: scanQr,
                width: 391.w,
                suffixIcon: SvgPicture.asset('assets/historyScreen/scan 1.svg'))
            .animate()
            .fadeIn(delay: 100.ms, duration: 500.ms, curve: Curves.easeOut)
            .slideY(
              delay: 100.ms,
              curve: Curves.linear,
              begin: 0.2,
              end: 0.0,
            ),
        SizedBox(
          height: 33.h,
        ),
        SizedBox(height: 30.h, width: 371.w, child: const BusNumberBox())
            .animate()
            .fade(duration: 1500.ms),
        SizedBox(
          height: 33.h,
        ),
        SizedBox(
          height: 119.h,
          width: 405.w,
          child: Image.asset('assets/historyScreen/image 150.png')
              .animate(delay: 0.ms)
              .fadeIn(delay: 100.ms, duration: 500.ms, curve: Curves.easeOut)
              .slideX(delay: 100.ms),
        ),
        // SizedBox(
        //   height: 12.h,
        // ),

        SizedBox(
          height: 20.h,
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (builder, context) {
                return const BusDetailsListview()
                    .animate()
                    .fadeIn(
                        delay: 100.ms, duration: 500.ms, curve: Curves.easeOut)
                    .slideY(
                      delay: 100.ms,
                      curve: Curves.linear,
                      begin: 0.2,
                      end: 0.0,
                    );
              },
              separatorBuilder: (builder, context) {
                return SizedBox(
                  height: 13.h,
                );
              },
              itemCount: 10),
        )
      ],
    ));
  }
}
