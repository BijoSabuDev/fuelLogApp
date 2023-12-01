import 'package:flutter/material.dart';
import 'package:fuellog/view/HIstoryScreen/history_screen.dart';
import 'package:fuellog/view/HomeScreen/home_screen.dart';
import 'package:fuellog/view/SettingsScreen/settings_screen.dart';
import 'package:fuellog/view/mainScreen/bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final _pages = [
    const HomeScreen(),
    const HistoryScreen(),
    const SettingsScreen()
  ];
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