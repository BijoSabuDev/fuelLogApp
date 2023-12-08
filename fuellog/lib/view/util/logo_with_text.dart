import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuellog/view/constants/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoWithText extends StatelessWidget {
  const LogoWithText({
    super.key,
    required this.sw,
  });

  final double sw;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 65.h,
          width: 214.w,
          child: Row(
            children: [
              FittedBox(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/onboardingScreen/logo.svg',
                      height: 62.h,
                      width: 52.39.w,
                    ),
                    kw10,
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black, height: 1),
                        children: [
                          TextSpan(
                            text: 'Safetri\n',
                            style: GoogleFonts.inter(
                                fontSize: 24.sp, fontWeight: FontWeight.w700),
                          ),
                          TextSpan(
                            text: 'Fuel Log',
                            style: GoogleFonts.inter(
                                fontSize: 36.sp,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
