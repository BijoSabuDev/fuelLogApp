import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wheel_slider/wheel_slider.dart';
// import 'package:wheel_slider/wheel_slider.dart';

class WheelPickerCustom extends StatefulWidget {
  final int nTotalCount;
  final int nInitValue;
  const WheelPickerCustom(
      {super.key, required this.nTotalCount, required this.nInitValue});

  @override
  State<WheelPickerCustom> createState() => _WheelPickerState();
}

// final int _nTotalCount = 245555;
// final int _nInitValue = 156446;
int? _nCurrentValue;

class _WheelPickerState extends State<WheelPickerCustom> {
  @override
  void initState() {
    super.initState();
    _nCurrentValue = widget.nInitValue;
  }

  // void incrementValue() {
  //   setState(() {
  //     _nCurrentValue =
  //         (_nCurrentValue! < 245555) ? _nCurrentValue! + 1 : _nCurrentValue;
  //   });
  // }

  // void decrementValue() {
  //   setState(() {
  //     _nCurrentValue =
  //         (_nCurrentValue! > 0) ? _nCurrentValue! - 1 : _nCurrentValue;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return WheelSlider.number(
      listWidth: 120,

      allowPointerTappable: false,
      itemSize: 40,
      isVibrate: true,
      horizontal: false,
      // verticalListHeight: 80.0,
      perspective: 0.01,
      totalCount: widget.nTotalCount,
      initValue: widget.nInitValue,
      selectedNumberStyle: GoogleFonts.readexPro(
          fontSize: 36.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF1D1D1D)),
      unSelectedNumberStyle: GoogleFonts.readexPro(
          fontSize: 36.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF1D1D1D).withOpacity(0.3)),
      // unSelectedNumberStyle: const TextStyle(
      //     fontSize: 26.0, color: Colors.grey, fontWeight: FontWeight.bold),
      // selectedNumberStyle: const TextStyle(
      //     fontSize: 30,
      //     letterSpacing: 0.2,
      //     color: Colors.black,
      //     fontWeight: FontWeight.bold),
      currentIndex: _nCurrentValue,
      onValueChanged: (val) {
        setState(() {
          _nCurrentValue = val;
        });
      },
      hapticFeedbackType: HapticFeedbackType.heavyImpact,
    );
  }
}
