import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BusDetailsListview extends StatelessWidget {
  const BusDetailsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        decoration: BoxDecoration(
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
                      '26 Oct 2023',
                      style: GoogleFonts.readexPro(
                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '4:10 PM',
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
                                text: '160148 ',
                                style: GoogleFonts.readexPro(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: 'km',
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
                                text: '150.12 ',
                                style: GoogleFonts.readexPro(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              TextSpan(
                                text: 'ltr',
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
                                text: '2.68 ',
                                style: GoogleFonts.readexPro(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              TextSpan(
                                text: 'AED',
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
