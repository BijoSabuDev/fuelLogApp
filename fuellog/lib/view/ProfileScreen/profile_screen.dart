import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuellog/view/ProfileScreen/enquiry_container.dart';
import 'package:fuellog/view/ProfileScreen/profile_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              const ProfileAppBar(),
              SizedBox(
                height: 28.h,
              ),
              Container(
                height: 210.h,
                width: 210.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/profileScreen/people-profile-graphic_24911-21374.webp',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 23.h,
              ),
              Text(
                'Sarah Yusuf',
                style: GoogleFonts.readexPro(
                  fontSize: 27.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Conductor',
                style: GoogleFonts.readexPro(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                width: 71.w,
                height: 24.h,
                decoration: BoxDecoration(
                    color: const Color(0xFFECFDF3),
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 8.w,
                    ),
                    Container(
                      height: 10.h,
                      width: 10.w,
                      decoration: const BoxDecoration(
                          color: Color(0xFF12B76A), shape: BoxShape.circle),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      'Active',
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF14B66A)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 23.h,
              ),
              Text(
                'Mobile Number',
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                '+971 123 465 798',
                style: GoogleFonts.readexPro(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ).animate(delay: 0.ms).fade(delay: 300.ms, duration: 600.ms).slideY(
                duration: 100.ms,
                curve: Curves.linear,
                begin: -0.2,
                end: 0.0,
              ),
          SizedBox(
            height: 22.h,
          ),
          const EnquiryContainer()
              .animate()
              .fadeIn(delay: 300.ms, duration: 400.ms)
              .scaleXY(duration: 200.ms, curve: Curves.easeIn),
          SizedBox(
            height: 28.h,
          ),
          Container(
            width: 372.w,
            height: 62.h,
            decoration: BoxDecoration(
                color: const Color(0xFF3150F5),
                borderRadius: BorderRadius.circular(17)),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/profileScreen/goto.svg',
                    width: 22.w,
                    height: 20.h,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    'Logout',
                    style: GoogleFonts.readexPro(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.spMin,
                    ),
                  )
                ],
              ),
            ),
          )
              .animate()
              .fadeIn(delay: 200.ms, duration: 400.ms, curve: Curves.easeOut)
              .slideY(
                delay: 100.ms,
                duration: 500.ms,
                curve: Curves.linear,
                begin: 0.2,
                end: 0.0,
              ),
        ],
      ),
    ));
  }
}
