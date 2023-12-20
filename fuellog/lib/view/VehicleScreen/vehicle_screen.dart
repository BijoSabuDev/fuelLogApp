// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuellog/view/VehicleScreen/app_bar.dart';
import 'package:fuellog/view/VehicleScreen/odo_vehicle_and_photo.dart';
import 'package:fuellog/view/VehicleScreen/successPage/success_page.dart';
import 'package:fuellog/view/constants/colors.dart';
import 'package:fuellog/view/util/bus_no_box.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:action_slider/action_slider.dart';
import 'package:lottie/lottie.dart';

class VehicleScreen extends StatelessWidget {
  const VehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final sw = MediaQuery.of(context).size.width;
    // final sh = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: const PreferredSize(
        //     preferredSize: Size(70, 70), child: VehicleScreenAppBar()),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 75.h,
                ),
                const VehicleScreenAppBar(),
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
                SizedBox(
                  height: 16.h,
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
                  height: 26.h,
                ),
                SizedBox(
                  height: 30.h,
                  child: const BusNumberBox()
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
                ),
                SizedBox(
                  height: 32.h,
                ),
                ActionSlider.standard(
                  // height: 68.h,
                  foregroundBorderRadius: BorderRadius.circular(42),

                  action: (controller) async {
                    controller.loading();
                    // await Future.delayed(const Duration(seconds: 1));
                    controller.success();
                    await Future.delayed(const Duration(milliseconds: 1800));
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
                      'Slide to submit',
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
            )));
  }
}
