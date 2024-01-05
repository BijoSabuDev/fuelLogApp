import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuellog/controller/userAuthentication/user_authentication.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key}) : super(key: key);
  UserAuthController userAuthController = Get.find<UserAuthController>();
  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: 40.h, left: 0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              userAuthController.resetStatus();
              Navigator.of(context).pop();
            },
            child: Container(
              width: 42.w,
              height: 42.h,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                border: Border.all(
                  color: const Color(0xFFD8DADC),
                  width: 1.0,
                ),
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 22.h,
              ),
            ),
          ),
          SizedBox(
            width: 300.w,
          ),
          SizedBox(
              height: 42.h,
              width: 36.w,
              child: SvgPicture.asset('assets/onboardingScreen/logo.svg')),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

//  SvgPicture.asset('assets/onboardingScreen/logo.svg'),