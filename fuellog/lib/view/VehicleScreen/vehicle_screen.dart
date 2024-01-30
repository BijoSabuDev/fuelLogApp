// ignore_for_file: use_build_context_synchronously
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuellog/controller/BusSelected/bus_selected.dart';
import 'package:fuellog/controller/busSubmission/busSubmission.dart';
import 'package:fuellog/controller/userAuthentication/user_authentication.dart';
import 'package:fuellog/localStorage/local_storage.dart';
import 'package:fuellog/view/VehicleScreen/app_bar.dart';
import 'package:fuellog/view/VehicleScreen/odo_vehicle_and_photo.dart';
import 'package:fuellog/view/VehicleScreen/successPage/success_page.dart';
import 'package:fuellog/view/VehicleScreen/vendor_billnumber.dart';
import 'package:fuellog/view/constants/colors.dart';
import 'package:fuellog/view/util/bus_no_box.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:action_slider/action_slider.dart';
import 'package:lottie/lottie.dart';

class VehicleScreen extends StatefulWidget {
  const VehicleScreen({super.key});

  @override
  State<VehicleScreen> createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  final BusSelectedController busSelectedController =
      Get.find<BusSelectedController>();

  final UserAuthController userAuthController = Get.find<UserAuthController>();

  final BusSubmissionController busSubmissionController =
      Get.find<BusSubmissionController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController billController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print(busSelectedController.vendorList);
    });
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            children: [
              SizedBox(
                height: 75.h,
              ),
              VehicleScreenAppBar(),
              SizedBox(
                height: 18.h,
              ),
              const Odo_details_photo()
                  .animate(delay: 0.ms)
                  .fadeIn(
                      delay: 200.ms, duration: 800.ms, curve: Curves.easeOut)
                  .slideY(
                    delay: 100.ms,
                    curve: Curves.linear,
                    begin: -0.1,
                    end: 0,
                  ),
              // SizedBox(
              //   height: 16.h,
              // ),

              // SizedBox(
              //   height: 8.h,
              // ),

              // Image.asset(
              //   'assets/vehicleScreen/image 150.png',
              //   width: 405.w,
              //   height: 119.h,
              // )
              // .animate(delay: 0.ms)
              // .fadeIn(delay: 200.ms, duration: 800.ms)
              // .slideX(delay: 100.ms),

              // // Bus no and petrol details
              // SizedBox(
              //   height: 26.h,
              // ),

              VendorAndBillNumber(
                billNumberController: billController,
                formKey: formKey,
              )
                  .animate(delay: 0.ms)
                  .fadeIn(
                      delay: 200.ms, duration: 800.ms, curve: Curves.easeOut)
                  .slideY(
                    delay: 100.ms,
                    curve: Curves.linear,
                    begin: 0.3,
                    end: 0.0,
                  ),
              SizedBox(
                height: 12.h,
              ),
              GetBuilder<BusSelectedController>(
                builder: (busSelectedController) {
                  final busSelectionData =
                      busSelectedController.busSelectionData;
                  print(busSelectionData);
                  final busNumber =
                      busSelectionData.data!.busDetails![0].vehSchoolNo;
                  final fuelType = busSelectionData.data!.busDetails![0].fuel;

                  final regNo = busSelectionData.data!.busDetails![0].vehRegNo;
                  return SizedBox(
                    height: 30.h,
                    child: BusNumberBox(
                      fuelType: fuelType!,
                      busNo: busNumber!,
                      regNo: regNo!,
                    )
                        .animate(delay: 0.ms)
                        .fadeIn(
                            delay: 200.ms,
                            duration: 800.ms,
                            curve: Curves.easeOut)
                        .slideY(
                          delay: 100.ms,
                          curve: Curves.linear,
                          begin: -0.3,
                          end: 0,
                        ),
                  );
                },
              ),
              SizedBox(
                height: 22.h,
              ),
              ActionSlider.standard(
                foregroundBorderRadius: BorderRadius.circular(42),
                action: (controller) async {
                  final userData = await UserPreferences.getUserData();
                  print('Cond Id: ${userData['cond_Id']}');
                  final condID = userData['cond_Id'];
                  print('this is cond id --------- $condID');

                  final busID = busSelectedController
                      .busSelectionData.data!.busDetails![0].vehId;
                  print('this is bus id --------- $busID');

                  final File? file = busSubmissionController.imageFile.value;

                  // print('this is file --------- ${file!.path}');

                  final odoMeterValue =
                      busSubmissionController.odometerValue.value;
                  print('this is odoMeterValue value --------- $odoMeterValue');
                  final fuelPrice =
                      busSubmissionController.fuelPriceValue.value;
                  print('this is fuelPrice --------- $fuelPrice');
                  final fuelQuantity =
                      "${busSubmissionController.fuelQuantityValue.value}.${busSubmissionController.fuelQuantityDecimalValue.value}"
                          .toString();
                  print('this is fuelquantity--------- $fuelQuantity');
                  final vendorName =
                      busSubmissionController.selectedVendor.value;
                  final billNo = busSubmissionController.billNumber.value;
                  // load the controller and check the connectivity
                  final instId = busSelectedController.instId.value;

                  controller.loading();
                  final connectivityResult =
                      await (Connectivity().checkConnectivity());

                  controller.loading();

                  // if (busSubmissionController.imageFile.value == null) {
                  //   showErrorDialog(
                  //       context, controller, 'Image File Required');

                  //   return;
                  // }

                  // if  there is no network  then return from the function

                  if (connectivityResult == ConnectivityResult.none) {
                    showErrorDialog(context, controller,
                        'Please check your internet connection');
                    controller.reset();
                    return;
                  }

                  final isSubmitted = formKey.currentState!.validate();
                  if (!isSubmitted) {
                    controller.reset();
                    return;
                  } else if (busSubmissionController.fuelQuantityValue.value ==
                          '0.0' &&
                      busSubmissionController.fuelQuantityDecimalValue.value ==
                          '0.0') {
                    showErrorDialog(
                        context, controller, 'Fuel quantity cannot be zero');
                    controller.reset();
                    return;
                  } else if (busSubmissionController.fuelPriceValue.value ==
                      '0.0') {
                    showErrorDialog(
                        context, controller, 'Fuel price cannot be zero');
                    controller.reset();
                    return;
                  } else {
                    await busSubmissionController.submitFuelValue(
                        'fuel_log_submit',
                        busID!,
                        odoMeterValue,
                        fuelPrice,
                        fuelQuantity,
                        vendorName,
                        billNo,
                        condID!,
                        instId,
                        file);
                  }
                  //  submit the bus data

                  // if (busSubmissionController.imageFile.value == null) {
                  //   showErrorDialog(
                  //       context, controller, 'Image File Required');

                  //   return;
                  // }
                  // await busSubmissionController.submitFuelValue(
                  //     'fuel_log_submit',
                  //     busID!,
                  //     odoMeterValue,
                  //     fuelPrice,
                  //     fuelQuantity,
                  //     vendorName,
                  //     billNo,
                  //     condID!,
                  //     instId,
                  //     file);

                  controller.success();
                  await Future.delayed(const Duration(milliseconds: 1800));
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return SuccessPage();
                  }));

                  // showErrorDialog(
                  //     context, controller, 'Unable to upload data');
                },
                reverseSlideAnimationCurve: Curves.easeInOut,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 0,
                    spreadRadius: 0,
                  )
                ],
                reverseSlideAnimationDuration:
                    const Duration(milliseconds: 500),
                rolling: true,
                successIcon: Lottie.asset(
                    'assets/vehicleScreen/Animation - 1702541179923.json'),
                toggleColor: Colors.white,
                loadingAnimationCurve: Curves.easeIn,
                icon: Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4.7272725105285645),
                      blurRadius: 5,
                      spreadRadius: 5,
                      color: Color(0x0000001A),
                    )
                  ]),
                  child: SvgPicture.asset(
                    'assets/vehicleScreen/Group 33696.svg',
                    height: 16.h,
                    width: 8.w,
                  ),
                ),
                backgroundColor: appTheme,
                child: FittedBox(
                  child: Text(
                    'Slide to Submit',
                    style: GoogleFonts.readexPro(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              )
                  .animate(delay: 0.ms)
                  .fadeIn(
                      delay: 200.ms, duration: 800.ms, curve: Curves.easeOut)
                  .slideY(
                    delay: 100.ms,
                    curve: Curves.linear,
                    begin: 0.3,
                    end: 0.0,
                  ),
            ],
          )),
    ));
  }

  Future<dynamic> showErrorDialog(
      BuildContext context, ActionSliderController controller, String error) {
    return showCupertinoDialog(
        context: context,
        builder: (ctx) {
          return CupertinoAlertDialog(
            title: Text(
              'Error',
              style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.red),
            ),
            content: SizedBox(
              width: 300.w,
              height: 48.h,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: error,
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: ' ',
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              CupertinoDialogAction(
                child: GestureDetector(
                  onTap: () {
                    controller.reset();
                    Navigator.of(ctx).pop();
                  },
                  child: Text(
                    'OK',
                    style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: appTheme),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
