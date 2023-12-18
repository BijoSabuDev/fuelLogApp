import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuellog/view/ProfileScreen/EditProfileScreen/edit_fields.dart';
import 'package:fuellog/view/ProfileScreen/EditProfileScreen/edit_profile_appbar.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: 75.h,
          ),
          Column(
            children: [
              const EditProfileAppBar(),
              SizedBox(
                height: 28.h,
              ),
              Stack(
                children: [
                  Container(
                    height: 210.h,
                    width: 210.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200],
                    ),
                    child: ClipOval(
                      child: SvgPicture.asset(
                        'assets/profileScreen/profilepic.svg',
                        width: 210.w,
                        height: 210.h,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 24.h,
                      right: 2.h,
                      child: SvgPicture.asset(
                          'assets/profileScreen/editprofleimage.svg'))
                ],
              ),
            ],
          ).animate(delay: 0.ms).fade(delay: 200.ms, duration: 600.ms).slideY(
                delay: 100.ms,
                curve: Curves.linear,
                begin: -0.3,
                end: 0.0,
              ),
          SizedBox(
            height: 38.h,
          ),
          Column(
            children: [
              const EditFields(
                hintText: 'Sarah Yusuf',
                nameOrMob: 'Full Name',
              ),
              SizedBox(
                height: 25.h,
              ),
              const EditFields(
                hintText: '+971 13245679',
                nameOrMob: 'Mobile Number',
              ),
            ],
          ).animate(delay: 0.ms).fade(delay: 200.ms, duration: 600.ms).slideY(
                delay: 100.ms,
                curve: Curves.linear,
                begin: 0.3,
                end: 0.0,
              ),

          // SizedBox(
          //   height: 160.h,
          // ),
          const Spacer(),
          Container(
            width: 372.w,
            height: 62.h,
            decoration: BoxDecoration(
              color: const Color(0xFF0056DD),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/profileScreen/save-2-fill.svg',
                  height: 27.h,
                  width: 27.w,
                ),
                SizedBox(
                  width: 4.w,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Save',
                    style: GoogleFonts.readexPro(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ).animate(delay: 0.ms).fade(delay: 200.ms, duration: 400.ms),
          SizedBox(
            height: 23.h,
          )
        ],
      ),
    );
  }
}
