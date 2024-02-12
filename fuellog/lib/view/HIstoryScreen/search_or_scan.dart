import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuellog/controller/busHistory/bus_history.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchOrScan extends StatelessWidget {
  SearchOrScan({super.key});
  final BusHistoryController busHistoryController =
      Get.find<BusHistoryController>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 200.h,
          ),
          SizedBox(
            width: 339.w,
            // height: 151.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/historyScreen/menu-search-line.svg',
                  height: 46.w,
                  width: 46.w,
                ),
                SizedBox(
                  height: 13.h,
                ),
                Text(
                  'Search or Scan',
                  style: GoogleFonts.poppins(
                    fontSize: 30.spMin,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Enter Vehicle Number or Scan QR Code to\n',
                        style: GoogleFonts.inter(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'View Fuel Log History',
                        style: GoogleFonts.inter(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ).animate().fadeIn(delay: 100.ms, duration: 400.ms).scaleXY(
            duration: 200.ms,
            curve: Curves.easeIn,
          ),
    );
  }
}
