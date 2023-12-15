import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// THESE ARE USED IN HOMESCREEN

class SearchBarCustom extends StatelessWidget {
  final Widget suffixIcon;
  final Function()? onPressedFunction;
  final double width;
  const SearchBarCustom(
      {super.key,
      required this.suffixIcon,
      required this.width,
      this.onPressedFunction});

  // @override
  // Widget build(BuildContext context) {
  //   final sw = MediaQuery.of(context).size.width;
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 24.w),
  //     height: 62.h,
  //     width: width,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(50),
  //       color: Colors.grey[200],
  //     ),
  //     child: Center(
  //       child: TextField(
  //         decoration: InputDecoration(
  //           prefixIcon: const Icon(
  //             Icons.search,
  //             color: Colors.grey,
  //           ),
  //           // prefixIconConstraints:
  //           //     BoxConstraints(minWidth: 27.w, minHeight: 18.h),
  //           // helperText: 'Bus No 52 or DXB135.',
  //           hintText: 'Bus No 52 or DXB135', alignLabelWithHint: true,
  //           hintStyle: GoogleFonts.readexPro(
  //             fontWeight: FontWeight.w400,
  //             color: Colors.black.withOpacity(0.3),
  //             fontSize: 16.sp,
  //           ),
  //           suffixIcon: IconButton(
  //             icon: suffixIcon,
  //             onPressed: onPressedFunction,
  //             color: appTheme,
  //           ),
  //           // contentPadding: const EdgeInsets.symmetric(
  //           //   vertical: 12,
  //           // ),
  //           border: InputBorder.none,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: TextField(
        // controller: controller,
        obscureText: false,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.symmetric(vertical: 22.h),
            // constraints: BoxConstraints(maxHeight: 92.h),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            fillColor: Colors.grey.shade200,
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 12.h),
              child: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
            filled: true,
            hintText: 'Bus No 52 or DXB135.',
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}
