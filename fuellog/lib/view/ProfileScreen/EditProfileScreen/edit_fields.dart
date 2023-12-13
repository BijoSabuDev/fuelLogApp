import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EditFields extends StatelessWidget {
  final String hintText;
  final String nameOrMob;
  const EditFields({
    super.key,
    required this.nameOrMob,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Full Name',
          style: GoogleFonts.inter(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
        Container(
          width: 373,
          height: 56,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFD8DADC), width: 1),
              color: Colors.grey[100]
              // gradient: const LinearGradient(
              //   begin: Alignment.centerLeft,
              //   end: Alignment.centerRight,
              //   colors: [
              //     Color(0xFFD8DADC),
              //     Color(0xFFD8DADC),
              //   ],
              // ),
              ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
            ),
          ),
        )

        // Container(
        //   width: 373.w,
        //   height: 56.h,
        //   padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(10),
        //       border: Border.all(
        //         color: const Color(0xFFD8DADC),
        //         width: 1,
        //       ),
        //       color: Colors.grey[100]
        //       // gradient: const LinearGradient(
        //       //   begin: Alignment.centerLeft,
        //       //   end: Alignment.centerRight,
        //       //   colors: [
        //       //     Color(0xFFD8DADC),
        //       //     Color(0xFFD8DADC),
        //       //   ],
        //       // ),
        //       ),
        //   child: Padding(
        //     padding: const EdgeInsets.all(2.0),
        //     child: TextField(
        //       decoration: InputDecoration(
        //           // contentPadding: EdgeInsets.only(top: 36.h, left: 7.w),
        //           border: InputBorder.none,
        //           hintText: hintText,
        //           hintStyle: GoogleFonts.inter(
        //               fontSize: 16.sp,
        //               fontWeight: FontWeight.w400,
        //               color: Colors.black)),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
