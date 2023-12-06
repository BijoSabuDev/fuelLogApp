import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuellog/view/VehicleScreen/app_bar.dart';
import 'package:fuellog/view/VehicleScreen/cupertino_picker.dart';
import 'package:fuellog/view/VehicleScreen/odo_vehicle_and_photo.dart';
import 'package:fuellog/view/VehicleScreen/successPage/success_page.dart';
import 'package:fuellog/view/VehicleScreen/wheel_picker.dart';
import 'package:fuellog/view/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:action_slider/action_slider.dart';

class VehicleScreen extends StatelessWidget {
  const VehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size(70, 70), child: VehicleScreenAppBar()),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              children: [
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
                SizedBox(
                  height: 9.h,
                ),
                Image.asset(
                  'assets/vehicleScreen/image 150.png',
                  width: 405.w,
                  height: 119.h,
                )
                    .animate(delay: 0.ms)
                    .fadeIn(delay: 200.ms, duration: 800.ms)
                    .slideX(delay: 100.ms),

                // Bus no and petrol details
                SizedBox(
                  height: 13.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // bus no and details

                    Row(
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
                          child: Center(
                            child: Text(
                              '52',
                              style: GoogleFonts.readexPro(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ],
                    ),

                    // Petrol details

                    Row(
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

                    Row(
                      children: [
                        Text(
                          'DXB 4651',
                          style: GoogleFonts.readexPro(
                              fontSize: 20.sp, fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                )
                    .animate(delay: 0.ms)
                    .fadeIn(
                        delay: 200.ms, duration: 800.ms, curve: Curves.easeOut)
                    .slideY(
                      delay: 100.ms,
                      curve: Curves.linear,
                      begin: -0.3,
                      end: 0,
                    ),
                SizedBox(
                  height: 29.h,
                ),
                ActionSlider.standard(
                  action: (controller) async {
                    controller.loading();
                    await Future.delayed(const Duration(seconds: 2));
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return const SuccessPage();
                    }));
              

                    controller.reset();
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
                  successIcon:
                      SvgPicture.asset('assets/vehicleScreen/check-line.svg'),
                  toggleColor: Colors.white,
                  icon:
                      SvgPicture.asset('assets/vehicleScreen/Group 33696.svg'),
                  backgroundColor: const Color(0xFFF3F3F3),
                  child: Text(
                    'Slide to submit',
                    style: GoogleFonts.readexPro(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF6D6D6D)),
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
            )));
  }
}
