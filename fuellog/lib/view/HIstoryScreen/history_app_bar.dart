import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuellog/view/constants/colors.dart';
import 'package:fuellog/view/mainScreen/bottom_nav_bar.dart';
import 'package:fuellog/view/mainScreen/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryAppBar extends StatelessWidget {
  const HistoryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 25.w,
        ),
        GestureDetector(
          onTap: () {
            showCupertinoDialog(
              context: context,
              builder: (ctx) {
                return CupertinoAlertDialog(
                  title: Text(
                    'Go back',
                    style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  content: Column(
                    children: [
                      Text(
                        'Are you sure you want to exit?',
                        style: GoogleFonts.poppins(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  actions: [
                    CupertinoDialogAction(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text(
                          'No',
                          style: GoogleFonts.poppins(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: appTheme),
                        ),
                      ),
                    ),
                    CupertinoDialogAction(
                      child: GestureDetector(
                        onTap: () {
                          selectedIndexNotifier.value = 0;
                          Navigator.of(ctx).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) {
                            return MainScreen();
                          }), (route) => false);
                        },
                        child: Text(
                          'Yes',
                          style: GoogleFonts.poppins(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFEF4348)),
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          },
          child: SvgPicture.asset('assets/homeScreen/app_bar_leading.svg'),
        ),
        SizedBox(
          width: 113.w,
        ),
        Text(
          'History',
          style: GoogleFonts.readexPro(
              fontSize: 20.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: 115.w,
        ),
        // SvgPicture.asset('assets/historyScreen/Group 33741.svg'),
      ],
    );
  }
}
