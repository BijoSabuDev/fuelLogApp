import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NoRecordScreen extends StatelessWidget {
  const NoRecordScreen({super.key});

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
                  'assets/historyScreen/no_bus_found.svg',
                  height: 46.w,
                  width: 46.w,
                ),
                SizedBox(
                  height: 13.h,
                ),
                Text(
                  'No Record Found',
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
                        text: 'Sorry, there is no fuel log data available\n',
                        style: GoogleFonts.inter(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'for this bus',
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
      ),
    );
  }
}
