import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuellog/controller/busSubmission/busSubmission.dart';
import 'package:fuellog/localStorage/local_storage.dart';
import 'package:fuellog/view/mainScreen/bottom_nav_bar.dart';
import 'package:fuellog/view/mainScreen/main_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessPage extends StatelessWidget {
  SuccessPage({super.key});

  final BusSubmissionController busSubmissionController =
      Get.find<BusSubmissionController>();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final userData = await UserPreferences.getUserData();

      selectedIndexNotifier.value = 0;

      print(
          'this is the vendor name ----------- ${busSubmissionController.selectedVendor.value}');
      print(
          'this is the billnumber  ----------- ${busSubmissionController.billNumber.value}');
      print(
          'this is the odometer value ----------- ${busSubmissionController.odometerValue.value}');
      print(
          "this is the fuelprice value --------------------- ${busSubmissionController.fuelPriceValue.value}");
      print(
          'this is the fuelquatity value ---------------- ${busSubmissionController.fuelQuantityValue.value}');
      print(
          "this is the fuelquantity decimal value --------------  ${busSubmissionController.fuelQuantityDecimalValue.value}");
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/vehicleScreen/🦆 icon _tick circle_.svg',
              height: 52.h,
              width: 52.w,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Thank you',
              style: GoogleFonts.readexPro(
                  fontWeight: FontWeight.w500, fontSize: 30.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'successfully submitted',
              style: GoogleFonts.readexPro(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.sp,
                  color: const Color(0xFFA2B2C8)),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              '26 Oct 2023 at 4:10 PM',
              style: GoogleFonts.readexPro(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: const Color(0xFF839ABD)),
            ),
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              onTap: () {
                busSubmissionController.resetValues();
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return MainScreen();
                }));
              },
              child: SvgPicture.asset(
                'assets/vehicleScreen/scan.svg',
                height: 62.h,
                width: 372.w,
              ),
            )
          ],
        ),
      ),
    );
  }
}
