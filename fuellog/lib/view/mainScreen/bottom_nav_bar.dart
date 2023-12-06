import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuellog/view/constants/colors.dart';

final ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedIndexNotifier,
      builder: (context, navIndex, _) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: navIndex,
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
              icon: SvgPicture.asset(
                'assets/homeScreen/home.svg',
                colorFilter: selectedIndexNotifier.value == 0
                    ? const ColorFilter.mode(
                        appTheme,
                        BlendMode.srcIn,
                      )
                    : const ColorFilter.mode(
                        Color(0xFFB8B8B8),
                        BlendMode.srcIn,
                      ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/homeScreen/vehicle.svg',
                colorFilter: selectedIndexNotifier.value == 1
                    ? const ColorFilter.mode(
                        appTheme,
                        BlendMode.srcIn,
                      )
                    : const ColorFilter.mode(
                        Color(0xFFB8B8B8),
                        BlendMode.srcIn,
                      ),
              ),
              label: 'Vehicle',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/homeScreen/history.svg',
                colorFilter: selectedIndexNotifier.value == 2
                    ? const ColorFilter.mode(
                        appTheme,
                        BlendMode.srcIn,
                      )
                    : const ColorFilter.mode(
                        Color(0xFFB8B8B8),
                        BlendMode.srcIn,
                      ),
              ),
              label: 'History',
            ),
          ],
        );
      },
    );
  }
}
