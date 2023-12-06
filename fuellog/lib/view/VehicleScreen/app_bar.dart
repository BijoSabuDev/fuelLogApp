import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuellog/view/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleScreenAppBar extends StatelessWidget {
  const VehicleScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      toolbarHeight: 80,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          showCupertinoDialog(
              context: context,
              builder: (ctx) {
                return CupertinoAlertDialog(
                  title: Text(
                    'Unsaved Changes',
                    style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  content: Column(
                    children: [
                      Text(
                        'Are you sure you want to discard this',
                        style: GoogleFonts.poppins(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Text(
                        'fuel entry? Your entry will be lost',
                        style: GoogleFonts.poppins(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  // content: SizedBox(
                  //   width: 350.w,
                  //   height: 188.h,
                  //   child: Text(
                  //     'Are you sure you want to discard this\nfuel entry? Your entry will be lost',
                  // style: GoogleFonts.poppins(
                  //     fontSize: 16.sp,
                  //     fontWeight: FontWeight.w500,
                  //     color: Colors.black),
                  // ),
                  // ),
                  actions: [
                    CupertinoDialogAction(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text(
                          'Cancel',
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
                          Navigator.of(ctx).pop();
                        },
                        child: Text(
                          'Discard',
                          style: GoogleFonts.poppins(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFEF4348)),
                        ),
                      ),
                    )
                  ],
                );
              });
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: SvgPicture.asset('assets/homeScreen/app_bar_leading.svg'),
        ),
      ),
      title: Text(
        'Vehicle details',
        style:
            GoogleFonts.readexPro(fontSize: 20.sp, fontWeight: FontWeight.w500),
      ),
    );
  }
}
