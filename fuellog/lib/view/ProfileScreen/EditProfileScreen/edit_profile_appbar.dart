import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileAppBar extends StatelessWidget {
  const EditProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 25.w,
        ),
        GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SvgPicture.asset('assets/homeScreen/app_bar_leading.svg')),
        SizedBox(
          width: 94.w,
        ),
        Text(
          'Edit Profile',
          style: GoogleFonts.readexPro(
              fontWeight: FontWeight.w500, fontSize: 20.sp),
        )
      ],
    );
  }
}
