import 'package:flutter/material.dart';
import 'package:fuellog/controller/historyScreen/history_screen.dart';
import 'package:fuellog/view/HIstoryScreen/history_screen.dart';
import 'package:fuellog/view/HomeScreen/home_screen.dart';
import 'package:fuellog/view/ProfileScreen/profile_screen.dart';
import 'package:fuellog/view/mainScreen/bottom_nav_bar.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final _pages = [
    const HomeScreen(),
    // const VehicleScreen(),
    HistoryScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    Get.put(HistoryScreenController());
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
