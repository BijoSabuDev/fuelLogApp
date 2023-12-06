import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WheelSelector extends StatelessWidget {
  const WheelSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      backgroundColor: Colors.transparent,
      itemExtent: 50,
      onSelectedItemChanged: (index) {},
      children: List<Widget>.generate(
        21, // 2.0 to 4.0 gives 21 items (4.0 - 2.0) * 10 + 1 (inclusive)
        (index) {
          double value =
              2.0 + (index / 10); // Generate decimal values from 2.0 to 4.0
          return Center(
            child: Text(
              value.toStringAsFixed(1),
              style: GoogleFonts.readexPro(
                fontSize: 36.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF1D1D1D),
              ),
            ),
          );
        },
      ),
    );
  }
}
