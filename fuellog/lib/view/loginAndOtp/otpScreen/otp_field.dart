import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuellog/view/mainScreen/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OtpField extends StatefulWidget {
  const OtpField({super.key});

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  // final otpController = TextEditingController();
  bool showError = false;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      margin: const EdgeInsets.all(2),
      width: 85.w,
      height: 79.05.w,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 1.1, color: const Color(0xFFD8DADC)),
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
    );

    return Center(
      child: Pinput(
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: const Color(0xFF3150F5)),
        )),
        errorPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: const Color(0xFFD10000)),
        )),
        onCompleted: (String value) {
          if (value != '2222') {
            setState(() {
              showError = true;
            });
          } else {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => MainScreen()),
                (route) => false);
          }
        },
        forceErrorState: showError,
        errorText: '                 Wrong PIN, please try again',
        errorTextStyle: GoogleFonts.inter(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFFF54135)),
      ),
    );
  }
}
