import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuellog/view/constants/colors.dart';
import 'package:fuellog/view/constants/dimensions.dart';
import 'package:fuellog/view/loginAndOtp/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPinScreeen extends StatelessWidget {
  const ResetPinScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: const Color(0xFFD8DADC)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: IconButton(
              iconSize: sw * 0.042,
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: sw * 0.3,
            ),
            Container(
              child: SvgPicture.asset('assets/onboardingScreen/logo.svg'),
            ),
            k30,
            Text(
              'Contact Admin',
              style: GoogleFonts.poppins(
                  letterSpacing: 0.08,
                  fontWeight: FontWeight.w700,
                  fontSize: sw * 0.062),
            ),
            k20,
            Text(
              'To restore access to your account, please\ncontact an administrator directly to reset\nyour password.',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  color: Colors.black.withOpacity(0.7),
                  letterSpacing: 0.1,
                  fontWeight: FontWeight.w400),
            ),
            k20,
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return const LoginScreen();
                }), (route) => false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: appTheme,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.zero,
              ),
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  constraints:
                      BoxConstraints(minHeight: sw * 0.12, maxWidth: sw - 90),
                  alignment: Alignment.center,
                  child: Text(
                    'Back to Login',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: sw * 0.032,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
