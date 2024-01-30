import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuellog/controller/userAuthentication/user_authentication.dart';
import 'package:fuellog/view/constants/dimensions.dart';
import 'package:fuellog/view/loginAndOtp/otpScreen/otp_field.dart';
import 'package:fuellog/view/loginAndOtp/reset_pin_screen.dart';
import 'package:fuellog/view/util/app_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends StatelessWidget {
  final String phoneNo;
  OtpScreen({
    super.key,
    required this.phoneNo,
  });
  UserAuthController userAuthController = Get.find<UserAuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            k20,
            Text(
              'Enter PIN',
              style: GoogleFonts.poppins(
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            k10,
            Text(
              'Please enter your 4-digit PIN to log in to\nyour account',
              style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.w400),
            ),
            k20,
            OtpField(phoneNo: phoneNo),
            const Spacer(),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ResetPinScreeen();
                  }));
                },
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, height: 1.1),
                    children: [
                      TextSpan(
                        text: 'forgot? ',
                        style: GoogleFonts.inter(
                            fontSize: 16.sp, fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: 'Reset PIN',
                        style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
