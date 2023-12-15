import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuellog/view/ProfileScreen/EditProfileScreen/edit_profile_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const EditProfileScreen();
        }));
      },
      child: Column(
        children: [
          SizedBox(
            height: 71.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 183.w,
              ),
              Text(
                'Profile',
                style: GoogleFonts.readexPro(
                    fontSize: 20.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 67.w,
              ),
              Container(
                height: 41.h,
                width: 93.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      'Edit',
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      width: 29.w,
                      height: 29.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFEAEAEA), // #EAEAEA
                            Color(0xFFBABEC3), // #BABEC3
                          ],
                          stops: [0.0, 1.0],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SvgPicture.asset(
                          'assets/profileScreen/pen.svg',
                          height: 16.h,
                          width: 16.w,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
