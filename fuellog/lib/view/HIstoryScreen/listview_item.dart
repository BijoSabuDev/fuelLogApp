import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BusDetailsListview extends StatelessWidget {
  final String busHistoryDate;
  final String busHistoryTime;
  final String fuelQty;
  final String fuelPrice;
  final String odometerReading;

  const BusDetailsListview({
    super.key,
    required this.busHistoryDate,
    required this.busHistoryTime,
    required this.fuelQty,
    required this.fuelPrice,
    required this.odometerReading,
  });

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xFF3150F5).withOpacity(0.4), // BoxShadow color
                blurRadius: 2, // Spread of the shadow
                offset: Offset(0, 2), // Offset of the shadow
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFF3F3F3)),
        child: Column(
          children: [
            SizedBox(
              height: 17.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: SizedBox(
                width: 333.w,
                height: 20.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      busHistoryDate,
                      style: GoogleFonts.readexPro(
                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      busHistoryTime,
                      style: GoogleFonts.readexPro(
                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: SizedBox(
                // height: 60.h,
                // width: 333.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Text(
                            'Odometer',
                            style: GoogleFonts.readexPro(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFFA2B2C8),
                            ),
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            style: GoogleFonts.readexPro(
                              color: const Color(0xFF1D1D1D),
                            ),
                            children: [
                              TextSpan(
                                text: odometerReading,
                                style: GoogleFonts.readexPro(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: ' km',
                                style: GoogleFonts.readexPro(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 39.69.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Text(
                            'Fuel Qty',
                            style: GoogleFonts.readexPro(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFFA2B2C8),
                            ),
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            style: GoogleFonts.readexPro(
                              color: const Color(0xFF1D1D1D),
                            ),
                            children: [
                              TextSpan(
                                text: fuelQty,
                                style: GoogleFonts.readexPro(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              TextSpan(
                                text: ' ltr',
                                style: GoogleFonts.readexPro(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 29.69.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Text(
                            'Fuel Cost',
                            style: GoogleFonts.readexPro(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFFA2B2C8),
                            ),
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            style: GoogleFonts.readexPro(
                              color: const Color(0xFF1D1D1D),
                            ),
                            children: [
                              TextSpan(
                                text: fuelPrice,
                                style: GoogleFonts.readexPro(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              TextSpan(
                                text: ' AED',
                                style: GoogleFonts.readexPro(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 17.h,
            )
          ],
        ),
      ),
    );
  }
}
