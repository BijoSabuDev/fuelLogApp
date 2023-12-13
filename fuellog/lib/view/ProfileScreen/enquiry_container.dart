import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class EnquiryContainer extends StatelessWidget {
  const EnquiryContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 371.w,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: const Color(0xFFD9D9D9)),
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFFD9D9D9).withOpacity(0.1)),
      child: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                  'assets/profileScreen/customer-service-2-fill.svg'),
              SizedBox(
                width: 10.w,
              ),
              Text(
                'For any support or help contact us at',
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 17.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/profileScreen/phone-fill.svg',
                width: 18.w,
                height: 18.h,
              ),
              SizedBox(
                width: 4.w,
              ),
              Text(
                '+971 123 465 798',
                style: GoogleFonts.readexPro(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.black.withOpacity(0.5)),
              )
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/profileScreen/mail-line.svg',
                width: 18.w,
                height: 18.h,
              ),
              SizedBox(
                width: 4.w,
              ),
              Text(
                'support@safetri.com',
                style: GoogleFonts.readexPro(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.black.withOpacity(0.5)),
              )
            ],
          ),
          SizedBox(
            height: 21.h,
          ),
        ],
      ),
    );
  }
}
