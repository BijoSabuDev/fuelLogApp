import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuellog/controller/BusSelected/bus_selected.dart';
import 'package:fuellog/controller/busHistory/bus_history.dart';
import 'package:fuellog/controller/busSubmission/busSubmission.dart';
import 'package:fuellog/controller/userAuthentication/user_authentication.dart';
import 'package:fuellog/localStorage/local_storage.dart';
import 'package:fuellog/view/VehicleScreen/vehicle_screen.dart';
import 'package:fuellog/view/constants/colors.dart';
import 'package:fuellog/view/constants/dimensions.dart';
import 'package:fuellog/view/util/logo_with_text.dart';
import 'package:fuellog/view/util/search_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final BusSelectedController busSelectedController =
      Get.find<BusSelectedController>();
  final UserAuthController userAuthController = Get.find<UserAuthController>();
  final BusHistoryController busHistoryController =
      Get.find<BusHistoryController>();

  final BusSubmissionController busSubmissionController =
      Get.find<BusSubmissionController>();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      busSubmissionController.resetValues();
      final userData = await UserPreferences.getUserData();
      // Use the retrieved user data as needed

      print('this is the inst id ${userData['inst_id']}');
      print('Cond Id: ${userData['cond_Id']}');
      print('User Name: ${userData['user_name']}');
      print('Phone Number: ${userData['phone_number']}');
      busHistoryController.userInput.value = '';
    });
    ValueNotifier<bool> buttonPressed = ValueNotifier(true);
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(child: GetX<BusSelectedController>(
        builder: (busSelectedController) {
          if (busSelectedController.isLoading.value) {
            context.loaderOverlay.show();
          } else {
            context.loaderOverlay.hide();
          }
          return Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 81.h, left: 25.w),
                    child: LogoWithText(sw: sw),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SearchBarCustom(
                    width: 372.w,
                  )
                      .animate(delay: 0.ms)
                      .fade(delay: 200.ms, duration: 600.ms)
                      .slideY(
                        delay: 100.ms,
                        curve: Curves.linear,
                        begin: 0.3,
                        end: 0.0,
                      ),
                  SizedBox(
                    height: 22.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 121.h,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xFFECEFF5),
                                  const Color(0xFFECEFF5).withOpacity(0.32),
                                ],
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: const CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 25,
                                        child: Icon(
                                          Icons.person_2_outlined,
                                          color: appTheme,
                                        )),
                                  ),
                                  kw10,
                                  SizedBox(
                                    width: 110.w,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FutureBuilder<Map<String, String?>>(
                                          future: UserPreferences.getUserData(),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.none) {
                                              return const CupertinoActivityIndicator();
                                            } else if (snapshot.hasError) {
                                              return Text(
                                                  'Error: ${snapshot.error}');
                                            } else {
                                              final userData = snapshot.data;

                                              return RichText(
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
                                                text: TextSpan(
                                                  style: GoogleFonts.readexPro(
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        const Color(0xFFA2B2C8),
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: 'Welcome\n',
                                                      style:
                                                          GoogleFonts.readexPro(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14.sp,
                                                        color: const Color(
                                                            0xFFA2B2C8),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: userData?[
                                                              'user_name'] ??
                                                          '',
                                                      style:
                                                          GoogleFonts.readexPro(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16.sp,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                          },
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF0056DD),
                                  Color(0xFF3F8AFF),
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 6.h,
                                left: 17.w,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Watch',
                                    style: GoogleFonts.readexPro(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18.sp,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  SizedBox(
                                    height: 43.h,
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: sw * 0.042,
                                          backgroundColor: Colors.white,
                                          child: SvgPicture.asset(
                                            'assets/homeScreen/Polygon 1.svg',
                                            height: 14.h,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                        kw10,
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'How to use this\n',
                                                style: GoogleFonts.readexPro(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13.77.sp,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'application',
                                                style: GoogleFonts.readexPro(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13.77.sp,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
                  .animate(delay: 0.ms)
                  .fadeIn(
                      delay: 200.ms, duration: 600.ms, curve: Curves.easeOut)
                  .slideY(
                    delay: 100.ms,
                    curve: Curves.linear,
                    begin: -0.1,
                    end: 0.0,
                  ),
              // SizedBox(
              //   height: 8.h,
              // ),
              SizedBox(
                height: 250.h,
                child: Stack(children: [
                  Positioned(
                    top: 30.h,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/homeScreen/image 152.png',
                          width: 400.w,
                          height: 200.h,
                          fit: BoxFit.fill,
                        ),
                      ],
                    )
                        .animate(delay: 0.ms)
                        .fadeIn(
                            delay: 100.ms,
                            duration: 600.ms,
                            curve: Curves.easeOut)
                        .slideX(delay: 300.ms, duration: 800.ms),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        'assets/homeScreen/busbground.svg',
                        width: 390.w,
                        height: 220.h,
                      )
                    ],
                  )
                  // .animate(delay: 0.ms).slideX(
                  //       duration: 800.ms,
                  //     ),
                ]),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 190.h,
                child: FittedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Press this button to scan',
                        style: GoogleFonts.readexPro(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.spMax,
                            letterSpacing: 0.1,
                            color: Colors.black.withOpacity(0.5)),
                      ),
                      ValueListenableBuilder(
                        valueListenable: buttonPressed,
                        builder: (context, pressed, builder) {
                          return Container(
                            child: buttonPressed.value
                                ? GestureDetector(
                                    onTap: () async {
                                      buttonPressed.value =
                                          !buttonPressed.value;
                                      await Future.delayed(100.ms);

                                      await requestCameraPermission();

                                      // ignore: use_build_context_synchronously
                                      startScanAndNavigate(context);

                                      buttonPressed.value =
                                          !buttonPressed.value;
                                    },
                                    child: Image.asset(
                                      'assets/homeScreen/button.png',
                                      height: 132.h,
                                      width: 132.w,
                                    ),
                                  )
                                : Image.asset(
                                    'assets/homeScreen/buttonhome.png',
                                    height: 132.h,
                                    width: 132.w,
                                  ),
                          );
                        },
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(height: 1),
                          children: [
                            TextSpan(
                              text: 'Scan QR\n',
                              style: GoogleFonts.readexPro(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 26.35.sp),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                      .animate()
                      .fadeIn(delay: 0.ms, duration: 600.ms)
                      .scaleXY(duration: 300.ms, curve: Curves.easeIn),
                ),
              ),
            ],
          );
        },
      )),
    );
  }

  void startScanAndNavigate(BuildContext context) async {
    final userData = await UserPreferences.getUserData();
    final instId = userData['inst_id'];
    String qrScanner = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.QR);

    print(qrScanner);

    if (qrScanner != '-1') {
      final success = await busSelectedController.fetchBusSelectionData(
          'fuel_bus_selection', qrScanner, instId!);

      if (busSelectedController.isLoading.value) {
        const Center(
          child: CircularProgressIndicator(),
        );
      } else if (busSelectedController.noConnection.value) {
        // ignore: use_build_context_synchronously
        showError(context, 'No network connection');
      } 
       else if (busSelectedController.busSelectionData!.data!.dataStatus ==
              0) {
            // ignore: use_build_context_synchronously
            showError(context, 'No search results for this ID');
          }
      
      else if (busSelectedController
              .busSelectionData!.data!.busDetails![0].fuel ==
          "ELECTRIC") {
        // ignore: use_build_context_synchronously
        showError(context, 'Searched vehicle is Electric');
      } else if (success) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) {
            return const VehicleScreen();
          },
        ));
      } else {
        // ignore: use_build_context_synchronously
        showError(context, 'No search results for this ID');
      }
    } else if (qrScanner == '-1') {
      return;
    }
  }

  Future<void> requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      await Permission.camera.request();
    }
  }

  Future<dynamic> showError(BuildContext context, String errorMsg) {
    return showCupertinoDialog(
        context: context,
        builder: (ctx) {
          return CupertinoAlertDialog(
            title: Text(
              'Error!',
              style: GoogleFonts.poppins(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFEF4348)),
            ),
            content: SizedBox(
              height: 24.h,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: errorMsg,
                        style: GoogleFonts.poppins(
                          fontSize: 24.sp,
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
