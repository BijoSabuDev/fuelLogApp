import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuellog/view/constants/colors.dart';
import 'package:fuellog/view/constants/dimensions.dart';
import 'package:fuellog/view/loginAndOtp/login_screen.dart';
import 'package:fuellog/view/util/logo_with_text.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: sw * 0.060,
              ),
              LogoWithText(sw: sw).animate(delay: 400.ms).slideX(),
              k20,
              // SvgPicture.asset(
              //   'assets/onboardingScreen/image 160.svg',
              //   height: sw,
              //   width: sw,
              // )
              Image.asset(
                'assets/onboardingScreen/fuel-log-bg.webp',
                height: 460.h,
                width: 383.w,
                fit: BoxFit.fill,
              )
                  .animate(
                    delay: 400.ms,
                  )
                  .fade(
                    delay: 100.ms,
                    curve: Curves.easeIn,
                  ),
              SizedBox(
                height: sw * 0.070,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'TRACK ',
                            style: GoogleFonts.raleway(
                                letterSpacing: 1.1,
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          TextSpan(
                            text: 'BUS FUEL',
                            style: GoogleFonts.raleway(
                                color: const Color(0xFF3150F5),
                                fontSize: 28.sp,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FittedBox(
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        style: const TextStyle(
                            color: Colors.black, letterSpacing: 1.1),
                        children: [
                          TextSpan(
                            text: 'SMART ',
                            style: GoogleFonts.raleway(
                                fontSize: 28.sp, fontWeight: FontWeight.w700),
                          ),
                          TextSpan(
                            text: 'AND EASY',
                            style: GoogleFonts.raleway(
                                fontSize: 28.sp,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                  k5,
                  FittedBox(
                    child: Text(
                      'Monitor fuel efficiency and spending\nacross all routes',
                      style: GoogleFonts.inter(
                          color: Colors.black.withOpacity(0.4),
                          wordSpacing: 1.1,
                          fontSize: 18.sp,
                          letterSpacing: 0.2,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: sw * 0.04,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return const LoginScreen();
                        }),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: appTheme,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36),
                      ),
                      child: Container(
                        constraints:
                            BoxConstraints(minHeight: 72.h, minWidth: 369.w),
                        alignment: Alignment.center,
                        child: Text(
                          'Get Started',
                          style: GoogleFonts.readexPro(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ).animate(delay: 400.ms).fade().slideY(
                    curve: Curves.linear,
                    begin: 0.2,
                    end: 0.0,
                  ),

              // SizedBox(
              //   height: sw * 0.50,
              //   width: double.infinity,
              //   child:
              //       SvgPicture.asset('assets/onboardingScreen/image 160.svg'),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
