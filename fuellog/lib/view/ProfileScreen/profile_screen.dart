import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuellog/controller/busHistory/bus_history.dart';
import 'package:fuellog/controller/userAuthentication/user_authentication.dart';
import 'package:fuellog/localStorage/local_storage.dart';
import 'package:fuellog/view/ProfileScreen/enquiry_container.dart';
import 'package:fuellog/view/ProfileScreen/profile_app_bar.dart';
import 'package:fuellog/view/constants/colors.dart';
import 'package:fuellog/view/loginAndOtp/login_screen.dart';
import 'package:fuellog/view/mainScreen/bottom_nav_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  UserAuthController userAuthController = Get.find<UserAuthController>();
  final BusHistoryController busHistoryController =
      Get.find<BusHistoryController>();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      busHistoryController.userInput.value = '';
    });
    return Scaffold(
        body: Column(
      children: [
        GetBuilder<UserAuthController>(
          builder: (userAuthController) {
            return FutureBuilder<Map<String, String?>>(
              future: UserPreferences.getUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // If the Future is still running, return a loading indicator or placeholder
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // If there is an error, display an error message
                  return Text('Error: ${snapshot.error}');
                } else {
                  // If the Future is completed successfully, retrieve the user data
                  final userData = snapshot.data;
                  return Column(
                    children: [
                      const ProfileAppBar(),
                      SizedBox(
                        height: 28.h,
                      ),
                      Container(
                        height: 210.h,
                        width: 210.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[200],
                        ),
                        child: Icon(
                          Icons.person,
                          size: 120.h,
                          color: appTheme,
                        ),
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      SizedBox(
                        height: 34.h,
                        child: FittedBox(
                          child: Text(
                            userData?['user_name'] ?? '',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.readexPro(
                              fontSize: 27.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Conductor',
                        style: GoogleFonts.readexPro(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        width: 71.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                            color: const Color(0xFFECFDF3),
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 8.w,
                            ),
                            Container(
                              height: 10.h,
                              width: 10.w,
                              decoration: const BoxDecoration(
                                  color: Color(0xFF12B76A),
                                  shape: BoxShape.circle),
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              'Active',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF14B66A)),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      Text(
                        'Mobile Number',
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        userData?['phone_number'] ?? '',
                        style: GoogleFonts.readexPro(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )
                      .animate(delay: 0.ms)
                      .fade(delay: 300.ms, duration: 600.ms)
                      .slideY(
                        duration: 100.ms,
                        curve: Curves.linear,
                        begin: -0.2,
                        end: 0.0,
                      );
                }
              },
            );
          },
        ),
        SizedBox(
          height: 22.h,
        ),
        const EnquiryContainer()
            .animate()
            .fadeIn(delay: 300.ms, duration: 400.ms)
            .scaleXY(duration: 200.ms, curve: Curves.easeIn),
        SizedBox(
          height: 28.h,
        ),
        GestureDetector(
          onTap: () async {
            await logout();
            selectedIndexNotifier.value = 0;
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) {
                return const LoginScreen();
              },
            ), (route) => false);
          },
          child: Container(
            width: 372.w,
            height: 62.h,
            decoration: BoxDecoration(
                color: const Color(0xFF3150F5),
                borderRadius: BorderRadius.circular(17)),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/profileScreen/goto.svg',
                    width: 22.w,
                    height: 20.h,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    'Logout',
                    style: GoogleFonts.readexPro(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.spMin,
                    ),
                  )
                ],
              ),
            ),
          )
              .animate()
              .fadeIn(delay: 200.ms, duration: 400.ms, curve: Curves.easeOut)
              .slideY(
                delay: 100.ms,
                duration: 500.ms,
                curve: Curves.linear,
                begin: 0.2,
                end: 0.0,
              ),
        ),
      ],
    ));
  }
}

Future<void> logout() async {
  try {
    await UserPreferences.clearUserData();
    print('Logout successful'); // Add this line
  } catch (e) {
    print('Logout error: $e'); // Add this line
  }
}
