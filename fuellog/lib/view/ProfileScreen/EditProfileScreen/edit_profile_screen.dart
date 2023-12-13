import 'package:flutter/material.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 75.h,
            ),
            const EditProfileAppBar(),
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
              height: 38.h,
            ),
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

            SizedBox(
              height: 160.h,
            ),
            // const Spacer(),
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
            ),
            SizedBox(
              height: 23.h,
            )
          ],
        ),
      ),
    );
  }
}
