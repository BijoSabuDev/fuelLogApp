import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryAppBar extends StatelessWidget {
  const HistoryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'History',
          style: GoogleFonts.readexPro(
              fontSize: 20.sp, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
