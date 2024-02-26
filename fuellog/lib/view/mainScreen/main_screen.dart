import 'package:flutter/material.dart';
import 'package:fuellog/controller/userAuthentication/user_authentication.dart';
import 'package:fuellog/localStorage/local_storage.dart';
import 'package:fuellog/view/HIstoryScreen/history_screen.dart';
import 'package:fuellog/view/HomeScreen/home_screen.dart';
import 'package:fuellog/view/ProfileScreen/profile_screen.dart';
import 'package:fuellog/view/loginAndOtp/login_screen.dart';
import 'package:fuellog/view/mainScreen/bottom_nav_bar.dart';
import 'dart:async';

import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _pages = [HomeScreen(), HistoryScreen(), ProfileScreen()];
  late Timer _timer;
  UserAuthController userAuthController = Get.find<UserAuthController>();
  // ignore: unused_element
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      // Call your API to check user status
      userAuthController
          .fetchUserData('fuel_login', userAuthController.pinNo.value,
              userAuthController.phoneNo.value, '1.0.0')
          .then((isInactive) async {
        print('timer called');
        if (userAuthController.isInactiveUser.value) {
          Get.snackbar(
            'Disabled User',
            'You are logged out because your account was disabled!.',
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 5),
          );
          selectedIndexNotifier.value == 0;
          await UserPreferences.clearUserData();

          Get.offAll(() => const LoginScreen());
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: selectedIndexNotifier,
        builder: (context, index, _) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
