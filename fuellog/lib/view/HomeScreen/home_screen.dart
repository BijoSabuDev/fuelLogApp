import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuellog/view/constants/colors.dart';
import 'package:fuellog/view/constants/dimensions.dart';
import 'package:fuellog/view/util/logo_with_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: sw * 0.08, left: 24),
                child: LogoWithText(sw: sw),
              ),
              k15,
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
                              const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 25,
                                  child: Icon(Icons.person)),
                              kw10,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      style: GoogleFonts.readexPro(
                                          fontWeight: FontWeight.w400,
                                          fontSize: sw * 0.040,
                                          color: const Color(0xFFA2B2C8)),
                                      children: [
                                        TextSpan(
                                          text: 'Welcome\n',
                                          style: GoogleFonts.readexPro(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14.sp,
                                              color: const Color(0xFFA2B2C8)),
                                        ),
                                        TextSpan(
                                          text: 'Sarah Yusuf',
                                          style: GoogleFonts.readexPro(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.sp,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
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
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Watch',
                                style: GoogleFonts.readexPro(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.sp,
                                    color: Colors.white),
                              ),
                              Text(
                                'How to use this application',
                                style: GoogleFonts.readexPro(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13.77.sp,
                                    color: Colors.white),
                              ),
                              k5,
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: sw * 0.04,
                                    backgroundColor: Colors.white,
                                    child: SvgPicture.asset(
                                      'assets/homeScreen/Polygon 1.svg',
                                      height: sw * 0.035,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                  kw10,
                                  Text(
                                    'Click to play',
                                    style: GoogleFonts.readexPro(
                                        fontSize: 12.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
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
          ).animate().fade(delay: 400.ms).slide(),
          SizedBox(
            height: sw < 500 ? sw * 0.032 : sw * 0.072,
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/homeScreen/image 152.png',
                      width: sw * 0.95,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ],
          ).animate().fade(delay: 200.ms).slideX(delay: 200.ms),
          SizedBox(
            height: sw < 500 ? sw * 0.040 : sw * 0.060,
          ),
          SizedBox(
            height: sw * 0.50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Press this button to scan',
                  style: GoogleFonts.readexPro(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      letterSpacing: 0.1,
                      color: Colors.black.withOpacity(0.2)),
                ),
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    height: sw * 0.26,
                    width: double.infinity,
                    child: SvgPicture.asset(
                      'assets/homeScreen/Group 33699 (1).svg',
                    ),
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(height: 1),
                    children: [
                      TextSpan(
                        text: 'Scan QR\n',
                        style: GoogleFonts.readexPro(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 30.sp),
                      ),
                      TextSpan(
                        text: 'or enter manually',
                        style: GoogleFonts.readexPro(
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.1,
                          fontSize: 16.sp,
                          color: const Color(0xFFA2B2C8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            height: 62.h,
            width: 370.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[200],
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/homeScreen/search.svg',
                ),
                kw10,
                kw10,
                Expanded(
                  child: Text('Bus No 52 or DXB135.',
                      style: GoogleFonts.readexPro(
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.3),
                          fontSize: sw * 0.038)),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: sw * 0.044,
                    color: appTheme,
                  ),
                  onPressed: () {
                    // Implement the action for the forward arrow button
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: sw * 0.035,
          ),
        ],
      )),
    );
  }
}
