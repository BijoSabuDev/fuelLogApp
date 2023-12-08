import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuellog/view/constants/colors.dart';
import 'package:fuellog/view/constants/dimensions.dart';
import 'package:fuellog/view/loginAndOtp/otpScreen/otpScreen.dart';
import 'package:fuellog/view/util/logo_with_text.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LogoWithText(sw: sw),
              k30,
              Text(
                'Log in',
                style: GoogleFonts.poppins(
                    letterSpacing: 0.1,
                    fontWeight: FontWeight.w700,
                    fontSize: 30.sp),
              ),
              k5,
              Text(
                'Please enter your phone number',
                style: GoogleFonts.inter(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
              ),
              k20,
              Text(
                'Mobile Number',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400, fontSize: 16.sp),
              ),
              k5,
              CupertinoTextField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefix: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 4, 16),
                  child: Text(
                    "+971",
                    style: TextStyle(fontFamily: 'Inter', fontSize: 16.sp),
                  ),
                ),
                placeholder: '0 000 000 000',
                placeholderStyle:
                    TextStyle(color: Colors.grey, fontSize: 16.sp),
                padding: const EdgeInsets.fromLTRB(2, 16, 18, 16),
                onChanged: (value) {
                  // Handle the changes
                },
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return const OtpScreen();
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
                        BoxConstraints(minHeight: 66.h, minWidth: 376.w),
                    alignment: Alignment.center,
                    child: Text(
                      'Continue',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
