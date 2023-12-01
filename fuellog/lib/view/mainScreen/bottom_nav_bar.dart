import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final ValueNotifier<int> selectedIndexNotifier = ValueNotifier(1);

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedIndexNotifier,
      builder: (context, index, _) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          onTap: (index) {
            selectedIndexNotifier.value = index;
          },
          selectedItemColor: const Color(0xFF3150F5),
          unselectedItemColor: const Color(0xFFB8B8B8),
          selectedIconTheme: const IconThemeData(
            color: Color(0xFF3150F5),
          ),
          unselectedIconTheme: const IconThemeData(
            color: Color(0xFFB8B8B8),
          ),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/homeScreen/home.svg'),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/homeScreen/history.svg'),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/homeScreen/settings.svg'),
              label: 'Settings',
            ),
          ],
        );
      },
    );
  }
}
