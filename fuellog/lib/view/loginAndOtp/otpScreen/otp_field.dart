import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuellog/controller/userAuthentication/user_authentication.dart';
import 'package:fuellog/view/mainScreen/main_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pinput/pinput.dart';

class OtpField extends StatefulWidget {
  final String phoneNo;
  const OtpField({
    super.key,
    required this.phoneNo,
  });

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  final otpController = TextEditingController();

  UserAuthController userAuthController = Get.find<UserAuthController>();
  final List<TextEditingController> pinControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  // bool showLoading = false;
  // bool showError = false;
  // bool showNetwrkError = false;
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
      child: GetX<UserAuthController>(
        builder: (controller) {
          if (userAuthController.isLoading.value) {
            context.loaderOverlay.show();
          } else {
            context.loaderOverlay.hide();
          }
          return Pinput(
            autofocus: true,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
              border: Border.all(color: const Color(0xFF3150F5)),
            )),
            errorPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
              border: Border.all(color: const Color(0xFFD10000)),
            )),
            onCompleted: (String value) async {
              final isAuthorised = await userAuthController.fetchUserData(
                  'fuel_login', value, widget.phoneNo, '1.0.0');
              print('this is whether authorised or not ---- $isAuthorised');
              if (isAuthorised) {
                if (mounted) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return MainScreen();
                    },
                  ));
                }
              }
            },
            forceErrorState: userAuthController.isLoading.value ||
                userAuthController.isNetwrkError.value ||
                userAuthController.isPinError.value,
            closeKeyboardWhenCompleted: true,
            keyboardType: TextInputType.number,
            errorTextStyle: GoogleFonts.inter(
                fontSize: 8.sp,
                fontWeight: FontWeight.w200,
                color: const Color(0xFFF54135)),
            errorText: (() {
              if (userAuthController.isLoading.value) {
                return 'Checking...';
              }
              if (userAuthController.isPinError.value) {
                return 'Invalid credentials,please try again';
              }
              if (userAuthController.isNetwrkError.value) {
                return 'Please check your network connection';
              } else {
                return 'Error occurred. Please try again later';
              }
            })(),
            // errorText: userAuthController.isNetwrkError.value
            //     ? 'Please check your internet connection'
            //     : userAuthController.isLoading.value
            //         ? 'Checking...'
            //         : userAuthController.isPinError.value
            //             ? 'Wrong PIN, please try again'
            //             : 'Error occurred. Please try again later',
            errorBuilder: (String? errorText, String? enteredValue) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    errorText!,
                    style: TextStyle(
                      color: const Color(0xFFF54135),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
