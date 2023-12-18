import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuellog/view/VehicleScreen/camera_capture.dart';
import 'package:fuellog/view/VehicleScreen/cupertino_picker.dart';
import 'package:fuellog/view/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Odo_details_photo extends StatefulWidget {
  const Odo_details_photo({
    super.key,
  });

  @override
  State<Odo_details_photo> createState() => _Odo_details_photoState();
}

class _Odo_details_photoState extends State<Odo_details_photo> {
  late TextEditingController _textController;
  late double _currentValue = 0;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final txtController = TextEditingController();
    // final sw = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: 198.h,
              width: double.infinity,
            ),
            Positioned(
              top: -02,
              child: SvgPicture.asset(
                'assets/vehicleScreen/Ellipse 1473.svg',
                width: 423.w,
              ),
            ),
            Positioned(
              top: 0,
              child: SvgPicture.asset(
                'assets/vehicleScreen/Ellipse 1474.svg',
                width: 424.w,
              ),
            ),
            Positioned(
              top: 18,
              width: 424.w,
              child: SvgPicture.asset(
                'assets/vehicleScreen/Group 33664.svg',
              ),
            ),
            Positioned(
              top: 79.h,
              child: Text(
                'Change odometer km',
                style: GoogleFonts.readexPro(
                    fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
            ),
            Positioned(
                top: 112.h,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showCupertinoDialog(
                          context: context,
                          builder: (ctx) {
                            return CupertinoAlertDialog(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/vehicleScreen/dashboard-3-line.svg',
                                    width: 21.w,
                                    height: 21.h,
                                  ),
                                  SizedBox(
                                    width: 9.w,
                                  ),
                                  Text(
                                    'Enter Odometer km',
                                    style: GoogleFonts.poppins(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              content: Padding(
                                padding: EdgeInsets.only(top: 27.h),
                                child: Column(
                                  children: [
                                    Container(
                                        width: 320.w,
                                        height: 62.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Colors.white,
                                              Colors.white,
                                            ],
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.white.withOpacity(0.1),
                                              spreadRadius: 0,
                                              blurRadius: 0,
                                              offset: const Offset(0, 0),
                                            ),
                                          ],
                                        ),
                                        child: CupertinoTextField(
                                          keyboardType: TextInputType.number,
                                          controller: txtController,
                                        ))
                                  ],
                                ),
                              ),
                              actions: [
                                CupertinoDialogAction(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _currentValue =
                                            double.parse(txtController.text);
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Save',
                                      style: GoogleFonts.poppins(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600,
                                          color: appTheme),
                                    ),
                                  ),
                                ),
                                CupertinoDialogAction(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Cancel',
                                      style: GoogleFonts.poppins(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFFEF4348)),
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: SvgPicture.asset(
                          'assets/vehicleScreen/keyboard (1) 1.svg'),
                    ),
                    SizedBox(
                      width: 9.w,
                    ),
                    WheelSelector(
                      inputValue: _currentValue,
                      onValueSelected: (newValue) {},
                      containerHeight: 85.h,
                      containerWidth: 160.w,
                      isButtonsVisible: true,
                      itemExtent: 50.h,
                      initValue: 156344,
                      showDecimal: false,
                      howMuchToGenerate: 20000,
                    ),
                  ],
                )),
          ],
        ),

        SizedBox(
          height: 40.h,
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
                            WheelSelector(
                              inputValue: 0,
                              onValueSelected: (newValue) {},
                              howMuchToGenerate: 50,
                              containerHeight: 80.h,
                              containerWidth: 80.w,
                              isButtonsVisible: false,
                              initValue: 150,
                              itemExtent: 50.h,
                              showDecimal: false,
                            ),
                            WheelSelector(
                              inputValue: 0,
                              onValueSelected: (newValue) {},
                              howMuchToGenerate: 100,
                              containerHeight: 80.h,
                              containerWidth: 57.w,
                              isButtonsVisible: true,
                              initValue: 0,
                              itemExtent: 50.h,
                              showDecimal: false,
                            ),
                          ],
                        )),
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

                    //  fuel price wheel

                    Padding(
                        padding:
                            EdgeInsets.only(bottom: 9.w, left: 2.w, right: 8.w),
                        child: WheelSelector(
                          inputValue: 0,
                          onValueSelected: (newValue) {},
                          howMuchToGenerate: 21,
                          initValue: 2.0,
                          itemExtent: 50.h,
                          showDecimal: true,
                          isButtonsVisible: true,
                          containerWidth: 82.w,
                          containerHeight: 80.h,
                        )),
                  ],
                ),
              ),
            )
          ],
        ),

        SizedBox(
          height: 20.0.h,
        ),
        // next text and take photo sections

        Padding(
          padding: EdgeInsets.only(
            left: 7.w,
          ),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: 220.w,
                  height: 18.h,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
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
                ),
              ),
              const CameraCapture(),
            ],
          ),
        ),
      ],
    );
  }
}
