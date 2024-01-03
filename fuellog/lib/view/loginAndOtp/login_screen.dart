import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuellog/controller/userAuthentication/user_authentication.dart';
import 'package:fuellog/view/constants/colors.dart';
import 'package:fuellog/view/constants/dimensions.dart';
import 'package:fuellog/view/loginAndOtp/otpScreen/otpScreen.dart';
import 'package:fuellog/view/util/logo_with_text.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  UserAuthController userAuthController = Get.put(UserAuthController());
  final TextEditingController? loginController = TextEditingController();

  @override
  void dispose() {
    loginController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          child: Form(
            key: _formKey,
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
                TextFormField(
                  controller: loginController,
                  decoration: InputDecoration(
                    hintText: '00 0000 0000',
                    prefixIcon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          '+971',
                          style: TextStyle(fontSize: 16.sp),
                        )),
                    contentPadding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                          width: 1.0, color: Color(0xFFD8DADC)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                          width: 1.0, color: Color(0xFFD8DADC)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                          width: 1.0, color: Color(0xFFD8DADC)),
                    ),
                    fillColor: const Color(0xFFF3F3F3),
                    filled: true,
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null ||
                        value.length < 10 ||
                        value.isAlphabetOnly) {
                      return 'Please enter a valid phone number';
                    }

                    return null;
                  },
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form!.validate()) {
                      final pNo = loginController!.text.trim();

                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return OtpScreen(phoneNo: pNo);
                        }),
                      );
                    }
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
      ),
    );
  }
}
