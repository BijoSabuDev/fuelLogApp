import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 71.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 183.w,
            ),
            Text(
              'Profile',
              style: GoogleFonts.readexPro(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: 67.w,
            ),
          
          ],
        ),
      ],
    );
  }
}
