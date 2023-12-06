import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuellog/view/mainScreen/main_screen.dart';
import 'package:pinput/pinput.dart';

class OtpField extends StatelessWidget {
  const OtpField({super.key});

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
          // Replace 'HomeScreen()' with the desired screen to navigate to
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MainScreen()),
          );
        },
      ),
    );
  }
}
