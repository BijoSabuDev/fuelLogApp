import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuellog/view/mainScreen/bottom_nav_bar.dart';
import 'package:fuellog/view/mainScreen/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  selectedIndexNotifier.value = 0;
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
