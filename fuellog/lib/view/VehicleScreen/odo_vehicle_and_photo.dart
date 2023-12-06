import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuellog/view/VehicleScreen/cupertino_picker.dart';
import 'package:fuellog/view/VehicleScreen/wheel_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class Odo_details_photo extends StatelessWidget {
  const Odo_details_photo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 2,
              child: SvgPicture.asset(
                'assets/vehicleScreen/Ellipse 1473.svg',
                width: 372.w,
              ),
            ),
            SvgPicture.asset(
              'assets/vehicleScreen/Ellipse 1474.svg',
            ),
            Positioned(
              top: 24,
              width: 300.w,
              child: SvgPicture.asset(
                'assets/vehicleScreen/Group 33664.svg',
              ),
            ),
            Positioned(
              top: 72,
              child: Text(
                'Change odometer km',
                style: GoogleFonts.readexPro(
                    fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 80.h,
                width: 158.w,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(243, 243, 243, 1),
                      Color.fromRGBO(255, 255, 255, 1),
                      Color.fromRGBO(242, 242, 242, 1),
                    ],
                    stops: [0, 0.5718, 1],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const WheelPickerCustom(
                  nInitValue: 156754,
                  nTotalCount: 245646,
                )),
            SizedBox(
              width: 6.w,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color.fromRGBO(243, 243, 243, 1),
                            Color.fromRGBO(255, 255, 255, 1),
                            Color.fromRGBO(242, 242, 242, 1),
                          ],
                          stops: [0, 0.5718, 1],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      height: 38.5.h,
                      width: 42.w,
                      child: SvgPicture.asset(
                        'assets/vehicleScreen/arrow_up.svg',
                        width: 13.w,
                        height: 6.5.h,
                        fit: BoxFit.scaleDown,
                      )),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(243, 243, 243, 1),
                        Color.fromRGBO(255, 255, 255, 1),
                        Color.fromRGBO(242, 242, 242, 1),
                      ],
                      stops: [0, 0.5718, 1],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  height: 38.5.h,
                  width: 42.w,
                  child: SvgPicture.asset(
                    'assets/vehicleScreen/arrow_down.svg',
                    width: 13.w,
                    height: 6.5.h,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ],
            ),
          ],
        ),

        SizedBox(
          height: 25.h,
        ),

        // Fuel and Fuel price

        Row(
          children: [
            // Fuel Quantity

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(243, 243, 243, 1),
                        Color.fromRGBO(255, 255, 255, 1),
                        Color.fromRGBO(242, 242, 242, 1),
                      ],
                      stops: [0, 0.5718, 1],
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12, left: 12),
                      child: Row(
                        children: [
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              style: const TextStyle(
                                  color: Colors.black, height: 1.2),
                              children: [
                                TextSpan(
                                  text: 'Fuel Quantity\n',
                                  style: GoogleFonts.readexPro(
                                      fontSize: 15.12.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                TextSpan(
                                  text: 'in Litre',
                                  style: GoogleFonts.readexPro(
                                      fontSize: 12.sp,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/vehicleScreen/fuelpump.png',
                            width: 51.w,
                            height: 38.h,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 7.68.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: 9.w, left: 8.w, right: 8.w),
                      child: Row(
                        children: [
                          Container(
                              height: 80.h,
                              width: 75.w,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [0.0, 0.95, 0.95],
                                  colors: [
                                    Color(0xFFFFFFFF),
                                    Color(0xFFFFFFFF),
                                    Color(0xFFFFFFFF),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const WheelPickerCustom(
                                nInitValue: 150,
                                nTotalCount: 250,
                              )),
                          SizedBox(
                            width: 7.w,
                          ),
                          Container(
                            height: 80.h,
                            width: 57.w,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.0, 0.95, 0.95],
                                colors: [
                                  Color(0xFFFFFFFF),
                                  Color(0xFFFFFFFF),
                                  Color(0xFFFFFFFF),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const WheelPickerCustom(
                                nTotalCount: 80, nInitValue: 25),
                          ),
                          SizedBox(
                            width: 8.h,
                          ),

                          // up down containers

                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                    ),
                                    height: 38.5.h,
                                    width: 42.w,
                                    child: SvgPicture.asset(
                                      'assets/vehicleScreen/arrow_up.svg',
                                      width: 13.w,
                                      height: 6.5.h,
                                      fit: BoxFit.scaleDown,
                                    )),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                ),
                                height: 38.5.h,
                                width: 42.w,
                                child: SvgPicture.asset(
                                  'assets/vehicleScreen/arrow_down.svg',
                                  width: 13.w,
                                  height: 6.5.h,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              width: 13.w,
            ),

            // Second container to show the fuel price

            Container(
              width: 160.w,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(243, 243, 243, 1),
                      Color.fromRGBO(255, 255, 255, 1),
                      Color.fromRGBO(242, 242, 242, 1),
                    ],
                    stops: [0, 0.5718, 1],
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12, left: 6),
                      child: Row(
                        children: [
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              style: const TextStyle(
                                  color: Colors.black, height: 1.2),
                              children: [
                                TextSpan(
                                  text: 'Fuel Price\n',
                                  style: GoogleFonts.readexPro(
                                      fontSize: 15.12.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                TextSpan(
                                  text: 'in AED',
                                  style: GoogleFonts.readexPro(
                                      fontSize: 12.sp,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/vehicleScreen/coin.png',
                            width: 51.w,
                            height: 38.h,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: 9.w, left: 2.w, right: 4.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              height: 80.h,
                              width: 75.w,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [0.0, 0.95, 0.95],
                                  colors: [
                                    Color(0xFFFFFFFF),
                                    Color(0xFFFFFFFF),
                                    Color(0xFFFFFFFF),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const WheelSelector()),
                          SizedBox(
                            width: 8.w,
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                    ),
                                    height: 38.5.h,
                                    width: 42.w,
                                    child: SvgPicture.asset(
                                      'assets/vehicleScreen/arrow_up.svg',
                                      width: 13.w,
                                      height: 6.5.h,
                                      fit: BoxFit.scaleDown,
                                    )),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                ),
                                height: 38.5.h,
                                width: 42.w,
                                child: SvgPicture.asset(
                                  'assets/vehicleScreen/arrow_down.svg',
                                  width: 13.w,
                                  height: 6.5.h,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),

        SizedBox(
          height: 9.h,
        ),
        // next text and take photo sections

        Padding(
          padding: EdgeInsets.only(left: 7.w, top: 9.h),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    SvgPicture.asset('assets/vehicleScreen/info (3) 1.svg'),
                    SizedBox(
                      width: 7.w,
                    ),
                    Text(
                      '150.12 ltr X 2.68 aed = 402.32 Aed',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 12.sp),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 124.w,
                    height: 34.32.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F3F3),
                      borderRadius: BorderRadius.circular(6.64),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Take Photo',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500, fontSize: 12.sp),
                          ),
                          SvgPicture.asset('assets/vehicleScreen/camera.svg')
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
