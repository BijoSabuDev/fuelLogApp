import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuellog/view/constants/colors.dart';
import 'package:fuellog/view/onboarding-screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 3200), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });

    return Scaffold(
        backgroundColor: appTheme,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset('assets/splashScreen/splashScreen.svg')
                  .animate(delay: 1000.ms)
                  .fade(delay: 500.ms)
                  .slideY(
                    delay: 500.ms,
                    curve: Curves.linear,
                    begin: 0.2,
                    end: 0.0,
                  ),
            )
          ],
        ));
  }
}
