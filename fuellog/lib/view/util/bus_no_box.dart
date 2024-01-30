import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// THESE ARE USED IN VEHICLE AND HISTORY SCREEN THAT SHOWS THE BUS NO , FUEL TYPE AND REGISTRATION NO

class BusNumberBox extends StatelessWidget {
  final String busNo;
  final String fuelType;
  final String regNo;
  const BusNumberBox(
      {super.key,
      required this.busNo,
      required this.regNo,
      required this.fuelType});

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
                'Vh No',
                style: GoogleFonts.readexPro(
                    fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 4.w,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)),
                width: 30.w,
                height: 30.h,
                child: FittedBox(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        busNo,
                        style: GoogleFonts.readexPro(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500),
                      ),
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
                width: 8.w,
              ),
              Text(
                fuelType,
                style: GoogleFonts.readexPro(
                    fontWeight: FontWeight.w500, fontSize: 16.sp),
              )
            ],
          ),
        ),

        FittedBox(
          child: Row(
            children: [
              Text(
                ('RgNo $regNo'),
                style: GoogleFonts.readexPro(
                    fontSize: 16.sp, fontWeight: FontWeight.w500),
              )
            ],
          ),
        )
      ],
    );
  }
}
