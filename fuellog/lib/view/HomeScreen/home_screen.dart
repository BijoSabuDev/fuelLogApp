import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuellog/view/VehicleScreen/vehicle_screen.dart';
import 'package:fuellog/view/constants/colors.dart';
import 'package:fuellog/view/constants/dimensions.dart';
import 'package:fuellog/view/util/logo_with_text.dart';
import 'package:fuellog/view/util/search_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> buttonPressed = ValueNotifier(true);
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 81.h, left: 25.w),
                  child: LogoWithText(sw: sw),
                ),
                // SizedBox(
                //   height: 21.h,
                // ),
                SizedBox(
                  height: 30.h,
                ),
                SearchBarCustom(
                  width: 372.w,
                  suffixIcon: Icon(
                    Icons.arrow_forward_ios,
                    size: sw * 0.044,
                    color: appTheme,
                  ),
                )
                    .animate(delay: 0.ms)
                    .fade(delay: 200.ms, duration: 600.ms)
                    .slideY(
                      delay: 100.ms,
                      curve: Curves.linear,
                      begin: 0.3,
                      end: 0.0,
                    ),
                SizedBox(
                  height: 22.h,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 121.h,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFFECEFF5),
                                const Color(0xFFECEFF5).withOpacity(0.32),
                              ],
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 25,
                                    child: Icon(Icons.person)),
                                kw10,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      textAlign: TextAlign.start,
                                      text: TextSpan(
                                        style: GoogleFonts.readexPro(
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFFA2B2C8)),
                                        children: [
                                          TextSpan(
                                            text: 'Welcome\n',
                                            style: GoogleFonts.readexPro(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp,
                                                color: const Color(0xFFA2B2C8)),
                                          ),
                                          TextSpan(
                                            text: 'Sarah Yusuf',
                                            style: GoogleFonts.readexPro(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18.sp,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF0056DD),
                                Color(0xFF3F8AFF),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 6.h,
                              left: 17.w,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Watch',
                                  style: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.sp,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 17.h,
                                  child: FittedBox(
                                    child: Text(
                                      'How to use this application',
                                      style: GoogleFonts.readexPro(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.77.sp,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                SizedBox(
                                  height: 43.h,
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: sw * 0.042,
                                        backgroundColor: Colors.white,
                                        child: SvgPicture.asset(
                                          'assets/homeScreen/Polygon 1.svg',
                                          height: 14.h,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                      kw10,
                                      Text(
                                        'Click to play',
                                        style: GoogleFonts.readexPro(
                                            fontSize: 12.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
                .animate(delay: 0.ms)
                .fadeIn(delay: 200.ms, duration: 600.ms, curve: Curves.easeOut)
                .slideY(
                  delay: 100.ms,
                  curve: Curves.linear,
                  begin: -0.1,
                  end: 0.0,
                ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/homeScreen/image 152.png',
                        width: 400.w,
                        height: 200.h,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
              ],
            )
                .animate(delay: 0.ms)
                .fadeIn(delay: 200.ms, duration: 600.ms, curve: Curves.easeOut)
                .slideX(delay: 100.ms),
            SizedBox(height: 40.h),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Press this button to scan',
                    style: GoogleFonts.readexPro(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.spMax,
                        letterSpacing: 0.1,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                  ValueListenableBuilder(
                    valueListenable: buttonPressed,
                    builder: (context, pressed, builder) {
                      return Container(
                        child: buttonPressed.value
                            ? GestureDetector(
                                onTap: () async {
                                  buttonPressed.value = !buttonPressed.value;
                                  await Future.delayed(500.ms);
                                  requestCameraPermission();
                                  scanQrCode(context);
                                  buttonPressed.value = !buttonPressed.value;
                                },
                                child: Image.asset(
                                  'assets/homeScreen/button.png',
                                  height: 110.h,
                                  width: 110.w,
                                ),
                              )
                            : Image.asset(
                                'assets/homeScreen/buttonhome.png',
                                height: 110.h,
                                width: 110.w,
                              ),
                      );
                    },
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(height: 1),
                      children: [
                        TextSpan(
                          text: 'Scan QR\n',
                          style: GoogleFonts.readexPro(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 30.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              )
                  .animate()
                  .fadeIn(delay: 0.ms, duration: 600.ms)
                  .scaleXY(duration: 300.ms, curve: Curves.easeIn),
            ),
            // SizedBox(
            //   height: 27.h,
            // ),
            // SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }

  void scanQrCode(context) async {
    String qrScanner;
    try {
      qrScanner = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      //   return VehicleScreen();
      // }));
      debugPrint(qrScanner);
    } on PlatformException {
      qrScanner = 'failed to get platform version';
      print('Error occurred');
    }
  }

  Future<void> requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      await Permission.camera.request();
    }
  }
}
