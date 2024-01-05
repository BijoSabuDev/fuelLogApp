import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuellog/localStorage/local_storage.dart';
import 'package:fuellog/view/constants/colors.dart';
import 'package:fuellog/view/mainScreen/main_screen.dart';
import 'package:fuellog/view/onboarding-screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // checking if the user has already logged in , if already logged in then go home screen instead of login -----

    Future.delayed(const Duration(seconds: 5), () async {
      final userData = await UserPreferences.getUserData();

      if (userData['user_name'] != null) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      }
    });
    // Future.delayed(const Duration(milliseconds: 3200), () {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => const OnboardingScreen()),
    //   );
    // });

    return Scaffold(
        backgroundColor: appTheme,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset('assets/splashScreen/splashScreen.svg')
                  .animate(delay: 500.ms)
                  .fadeIn(
                      delay: 500.ms, duration: 1000.ms, curve: Curves.easeOut)
                  .slideY(
                    delay: 500.ms,
                    curve: Curves.linear,
                    begin: 0.3,
                    end: 0.0,
                  ),
            )
          ],
        ));
  }
}
