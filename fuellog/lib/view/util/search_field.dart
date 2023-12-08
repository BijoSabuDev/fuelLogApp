import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// THESE ARE USED IN HOMESCREEN AND HISTORYSCREEN

class SearchBarCustom extends StatelessWidget {
  final Widget suffixIcon;
  final Function()? onPressedFunction;
  final double width;
  const SearchBarCustom(
      {super.key,
      required this.suffixIcon,
      required this.width,
      this.onPressedFunction});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: 62.h,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[200],
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: SvgPicture.asset(
            'assets/homeScreen/search.svg',
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 40),
          hintText: 'Bus No 52 or DXB135.',
          hintStyle: GoogleFonts.readexPro(
            fontWeight: FontWeight.w400,
            color: Colors.black.withOpacity(0.3),
            fontSize: 16.sp,
          ),
          suffixIcon: IconButton(
            icon: suffixIcon,
            onPressed: onPressedFunction,
          ),
          contentPadding: const EdgeInsets.all(20),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
