import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 90.h, left: 25.w),
                  child: LogoWithText(sw: sw),
                ),SizedBox(height: 21.h,),
                SearchBarCustom(
                  width: 372.w,
                  suffixIcon: Icon(
                    Icons.arrow_forward_ios,
                    size: sw * 0.044,
                    color: appTheme,
                  ),
                )
                    .animate(delay: 0.ms)
                    .fade(delay: 500.ms, duration: 800.ms)
                    .slideY(
                      delay: 100.ms,
                      curve: Curves.linear,
                      begin: 0.3,
                      end: 0.0,
                    ),
                SizedBox(
                  height: 23.h,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Watch',
                                  style: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.sp,
                                      color: Colors.white),
                                ),
                                Text(
                                  'How to use this application',
                                  style: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.77.sp,
                                      color: Colors.white),
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
                .fadeIn(delay: 200.ms, duration: 800.ms, curve: Curves.easeOut)
                .slideY(
                  delay: 100.ms,
                  curve: Curves.linear,
                  begin: -0.1,
                  end: 0.0,
                ),
            SizedBox(
              height: 36.h,
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
                .fadeIn(delay: 200.ms, duration: 800.ms, curve: Curves.easeOut)
                .slideX(delay: 100.ms),
            SizedBox(height: 27.h),
            SizedBox(
              height: 175.h,
              child: FittedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Press this button to scan',
                      style: GoogleFonts.readexPro(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          letterSpacing: 0.1,
                          color: Colors.black.withOpacity(0.2)),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await requestCameraPermission();
                        scanQrCode();
                      },
                      child: SvgPicture.asset(
                        'assets/homeScreen/Group 33699 (1).svg',
                      ),
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
                          TextSpan(
                            text: 'or enter manually',
                            style: GoogleFonts.readexPro(
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.1,
                              fontSize: 16.sp,
                              color: const Color(0xFFA2B2C8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
                    .animate()
                    .fadeIn(delay: 100.ms, duration: 300.ms)
                    .scaleXY(duration: 800.ms, curve: Curves.easeOut),
              ),
            ),
            SizedBox(
              height: 27.h,
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }

  void scanQrCode() async {
    String qrScanner;
    try {
      qrScanner = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
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
