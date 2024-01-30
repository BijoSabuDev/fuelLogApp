import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuellog/controller/BusSelected/bus_selected.dart';
import 'package:fuellog/controller/busSubmission/busSubmission.dart';
import 'package:fuellog/controller/userAuthentication/user_authentication.dart';
import 'package:fuellog/view/VehicleScreen/camera_capture.dart';
import 'package:fuellog/view/VehicleScreen/cupertino_picker.dart';
import 'package:fuellog/view/constants/colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Odo_details_photo extends StatefulWidget {
  const Odo_details_photo({
    super.key,
  });

  @override
  State<Odo_details_photo> createState() => _Odo_details_photoState();
}

class _Odo_details_photoState extends State<Odo_details_photo> {
  late Timer _timer;
  // late TextEditingController _textController;
  // late final double _currentValue = 0;
  final BusSelectedController busSelectedController =
      Get.find<BusSelectedController>();

  final BusSubmissionController busSubmissionController =
      Get.find<BusSubmissionController>();

  @override
  void initState() {
    super.initState();
    // _textController = TextEditingController();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final txtController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _timer =
          Timer.periodic(const Duration(milliseconds: 1500), (Timer timer) {
        busSubmissionController.updateCalculatedValue();
      });
    });

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
                    // GestureDetector(
                    //   onTap: () {
                    //     showCupertinoDialog(
                    //       context: context,
                    //       builder: (ctx) {
                    //         return CupertinoAlertDialog(
                    //           title: Row(
                    //             mainAxisAlignment: MainAxisAlignment.start,
                    //             children: [
                    //               SvgPicture.asset(
                    //                 'assets/vehicleScreen/dashboard-3-line.svg',
                    //                 width: 21.w,
                    //                 height: 21.h,
                    //               ),
                    //               SizedBox(
                    //                 width: 9.w,
                    //               ),
                    //               Text(
                    //                 'Enter Odometer km',
                    //                 style: GoogleFonts.poppins(
                    //                     fontSize: 20.sp,
                    //                     fontWeight: FontWeight.w600,
                    //                     color: Colors.black),
                    //               ),
                    //             ],
                    //           ),
                    //           content: Padding(
                    //             padding: EdgeInsets.only(top: 27.h),
                    //             child: Column(
                    //               children: [
                    //                 Container(
                    //                     width: 320.w,
                    //                     height: 62.h,
                    //                     decoration: BoxDecoration(
                    //                       borderRadius:
                    //                           BorderRadius.circular(12),
                    //                       gradient: const LinearGradient(
                    //                         begin: Alignment.centerLeft,
                    //                         end: Alignment.centerRight,
                    //                         colors: [
                    //                           Colors.white,
                    //                           Colors.white,
                    //                         ],
                    //                       ),
                    //                       boxShadow: [
                    //                         BoxShadow(
                    //                           color:
                    //                               Colors.white.withOpacity(0.1),
                    //                           spreadRadius: 0,
                    //                           blurRadius: 0,
                    //                           offset: const Offset(0, 0),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                     child: CupertinoTextField(
                    //                       keyboardType: TextInputType.number,
                    //                       controller: txtController,
                    //                     ))
                    //               ],
                    //             ),
                    //           ),
                    //           actions: [
                    //             CupertinoDialogAction(
                    //               child: GestureDetector(
                    //                 onTap: () {
                    //                   busSubmissionController
                    //                       .updateOdometerValue(
                    //                           txtController.text);
                    //                   // setState(() {
                    //                   //   _currentValue =
                    //                   //       double.parse(txtController.text);
                    //                   // });
                    //                   Navigator.of(context).pop();
                    //                 },
                    //                 child: Text(
                    //                   'Save',
                    //                   style: GoogleFonts.poppins(
                    //                       fontSize: 20.sp,
                    //                       fontWeight: FontWeight.w600,
                    //                       color: appTheme),
                    //                 ),
                    //               ),
                    //             ),
                    //             CupertinoDialogAction(
                    //               child: GestureDetector(
                    //                 onTap: () {
                    //                   Navigator.of(context).pop();
                    //                 },
                    //                 child: Text(
                    //                   'Cancel',
                    //                   style: GoogleFonts.poppins(
                    //                       fontSize: 20.sp,
                    //                       fontWeight: FontWeight.w600,
                    //                       color: const Color(0xFFEF4348)),
                    //                 ),
                    //               ),
                    //             )
                    //           ],
                    //         );
                    //       },
                    //     );
                    //   },
                    //   child: SvgPicture.asset(
                    //       'assets/vehicleScreen/keyboard (1) 1.svg'),
                    // ),
                    SizedBox(
                      width: 9.w,
                    ),

                    // this is the odometer widget

                    GetBuilder<BusSelectedController>(
                      builder: (controller) {
                        final busFuelDetails = busSelectedController
                            .busSelectionData!.data?.busFuelDetails;
                        String vhactReading;

// Check if busFuelDetails is not null and not empty
                        if (busFuelDetails!.isNotEmpty) {
                          vhactReading = busFuelDetails[0].vhactReading ?? '0';
                          // Use vhactReading as needed
                        } else {
                          vhactReading = '0';
                        }
                        // final vhactReadng = busSelectedController
                        //         .busSelectionData
                        //         .data!
                        //         .busFuelDetails![0]
                        //         .vhactReading ??
                        //     '0';

                        // print(vhactReadng);
                        return WheelSelector(
                          noValuesSelected: (initValue) {
                            busSubmissionController
                                .updateOdometerValue(initValue.toString());
                          },
                          onDecimalValueSelected: (p0) {},
                          inputValue: 0,
                          onValueSelected: (newValue) {
                            busSubmissionController
                                .updateOdometerValue(newValue.toString());
                          },
                          containerHeight: 85.h,
                          containerWidth: 160.w,
                          isButtonsVisible: true,
                          itemExtent: 55.h,
                          initValue: double.parse(vhactReading),
                          showDecimal: false,
                          howMuchToGenerate: 20000,
                        );
                      },
                    )
                  ],
                )),
          ],
        ),

        SizedBox(
          height: 30.h,
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
                        child: GetBuilder<BusSelectedController>(
                          builder: (controller) {
                            // final String? vhactFuelQuantity =
                            //     busSelectedController.busSelectionData.data!
                            //         .busFuelDetails![0].vhactQuantity;
                            return Row(
                              children: [
                                WheelSelector(
                                  noValuesSelected: (initValue) {
                                    busSubmissionController
                                        .updatefuelQuantityValue(
                                            initValue.toString());
                                  },
                                  onDecimalValueSelected: (newValue) {},
                                  inputValue: 0,
                                  onValueSelected: (newValue) {
                                    busSubmissionController
                                        .updatefuelQuantityValue(
                                            newValue.toString());
                                  },
                                  howMuchToGenerate: 500,
                                  containerHeight: 80.h,
                                  containerWidth: 80.w,
                                  isButtonsVisible: false,
                                  initValue: 0,
                                  itemExtent: 50.h,
                                  showDecimal: false,
                                ),
                                WheelSelector(
                                  noValuesSelected: (initValue) {
                                    busSubmissionController
                                        .updatefuelQuantityDecimalValue(
                                            initValue.toString());
                                  },
                                  onDecimalValueSelected: (newValue) {},
                                  inputValue: 0,
                                  onValueSelected: (newValue) {
                                    busSubmissionController
                                        .updatefuelQuantityDecimalValue(
                                            newValue!);
                                  },
                                  howMuchToGenerate: 1000,
                                  containerHeight: 80.h,
                                  containerWidth: 57.w,
                                  isButtonsVisible: true,
                                  initValue: 0,
                                  itemExtent: 50.h,
                                  showDecimal: false,
                                ),
                              ],
                            );
                          },
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

                    GetBuilder<UserAuthController>(
                      builder: (controller) {
                        final busFuelDetails = busSelectedController
                            .busSelectionData!.data?.busFuelDetails;
                        String vhactFuelRate;

                        if (busFuelDetails!.isNotEmpty) {
                          vhactFuelRate = busFuelDetails[0].vhactRate ?? '0';
                        } else {
                          vhactFuelRate = '0';
                        }

                        // final vhactFuelRate = busSelectedController
                        //         .busSelectionData
                        //         .data!
                        //         .busFuelDetails![0]
                        //         .vhactRate ??
                        //     '0';
                        return Padding(
                            padding: EdgeInsets.only(
                                bottom: 9.w, left: 2.w, right: 8.w),
                            child: WheelSelector(
                              noValuesSelected: (initValue) {
                                busSubmissionController
                                    .updatefuelPriceValue(initValue!);
                              },
                              onDecimalValueSelected: (newValue) {
                                busSubmissionController
                                    .updatefuelPriceValue(newValue!);
                              },
                              inputValue: 0,
                              onValueSelected: (newValue) {},
                              howMuchToGenerate: 10000,
                              initValue: 0.00,
                              itemExtent: 50.h,
                              showDecimal: true,
                              isButtonsVisible: true,
                              containerWidth: 82.w,
                              containerHeight: 80.h,
                            ));
                      },
                    ),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 220.w,
                height: 18.h,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    children: [
                      Icon(
                        Icons.calculate_outlined,
                        size: 20.sp,
                        color: Colors.grey,
                      ),
                      // SvgPicture.asset('assets/vehicleScreen/info (3) 1.svg'),
                      SizedBox(
                        width: 7.w,
                      ),
                      GetX<BusSubmissionController>(
                        builder: (busSubmissionController) {
                          return RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.black),
                              children: <TextSpan>[
                                const TextSpan(text: ''),
                                TextSpan(
                                  text: busSubmissionController
                                      .totalFuelQuantityValue.value,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: appTheme),
                                ),
                                const TextSpan(text: ' Ltr X '),
                                TextSpan(
                                  text: busSubmissionController
                                      .fuelPriceValue.value,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: appTheme),
                                ),
                                const TextSpan(text: ' AED = '),
                                TextSpan(
                                  text: busSubmissionController
                                      .calculatedValue.value,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: appTheme),
                                ),
                                const TextSpan(text: ' AED'),
                              ],
                            ),
                          );

                          // return Text(
                          //   '${busSubmissionController.totalFuelQuantityValue.value} ltr X ${busSubmissionController.fuelPriceValue.value} aed = ${busSubmissionController.calculatedValue.value} Aed',
                          //   style: GoogleFonts.poppins(
                          //       fontWeight: FontWeight.w500, fontSize: 12.sp),
                          // );
                        },
                      )
                    ],
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
