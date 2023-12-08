import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// THESE ARE USED IN VEHICLE AND HISTORY SCREEN THAT SHOWS THE BUS NO , FUEL TYPE AND REGISTRATION NO

class BusNumberBox extends StatelessWidget {
  const BusNumberBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // bus no and details

        FittedBox(
          child: Row(
            children: [
              Text(
                'Bus No',
                style: GoogleFonts.readexPro(
                    fontSize: 20.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 6.w,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)),
                width: 30.w,
                height: 30.h,
                child: FittedBox(
                  child: Center(
                    child: Text(
                      '52',
                      style: GoogleFonts.readexPro(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),

        // Petrol details

        FittedBox(
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/vehicleScreen/gas-station 1.svg',
              ),
              SizedBox(
                width: 9.w,
              ),
              Text(
                'Petrol',
                style: GoogleFonts.readexPro(
                    fontWeight: FontWeight.w500, fontSize: 14.sp),
              )
            ],
          ),
        ),

        FittedBox(
          child: Row(
            children: [
              Text(
                'DXB 4651',
                style: GoogleFonts.readexPro(
                    fontSize: 20.sp, fontWeight: FontWeight.w500),
              )
            ],
          ),
        )
      ],
    );
  }
}
