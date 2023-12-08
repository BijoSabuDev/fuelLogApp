// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:wheel_slider/wheel_slider.dart';

// // import 'package:wheel_slider/wheel_slider.dart';
// // final GlobalKey<_WheelPickerState> wheelPickerKey =
// //     GlobalKey<_WheelPickerState>();

// class WheelPickerCustom extends StatefulWidget {
//   final int nTotalCount;
//   final int nInitValue;
//   const WheelPickerCustom(
//       {super.key, required this.nTotalCount, required this.nInitValue});

//   @override
//   State<WheelPickerCustom> createState() => _WheelPickerState();
// }

// // final int _nTotalCount = 245555;
// // final int _nInitValue = 156446;
// int? _nCurrentValue;

// class _WheelPickerState extends State<WheelPickerCustom> {
//   @override
//   void initState() {
//     super.initState();
//     _nCurrentValue = widget.nInitValue;
//   }

//   void incrementValue() {
//     setState(() {
//       _nCurrentValue =
//           (_nCurrentValue! < 245555) ? _nCurrentValue! + 1 : _nCurrentValue;
//     });
//   }

//   void decrementValue() {
//     setState(() {
//       _nCurrentValue =
//           (_nCurrentValue! > 0) ? _nCurrentValue! - 1 : _nCurrentValue;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         WheelSlider.number(
//           listWidth: 120,

//           allowPointerTappable: false,
//           itemSize: 40,
//           isVibrate: true,
//           horizontal: false,
//           // verticalListHeight: 80.0,
//           perspective: 0.01,
//           totalCount: widget.nTotalCount,
//           initValue: widget.nInitValue,
//           selectedNumberStyle: GoogleFonts.readexPro(
//               fontSize: 36.sp,
//               fontWeight: FontWeight.w500,
//               color: const Color(0xFF1D1D1D)),
//           unSelectedNumberStyle: GoogleFonts.readexPro(
//               fontSize: 36.sp,
//               fontWeight: FontWeight.w500,
//               color: const Color(0xFF1D1D1D).withOpacity(0.3)),
//           // unSelectedNumberStyle: const TextStyle(
//           //     fontSize: 26.0, color: Colors.grey, fontWeight: FontWeight.bold),
//           // selectedNumberStyle: const TextStyle(
//           //     fontSize: 30,
//           //     letterSpacing: 0.2,
//           //     color: Colors.black,
//           //     fontWeight: FontWeight.bold),
//           currentIndex: _nCurrentValue,
//           onValueChanged: (val) {
//             setState(() {
//               _nCurrentValue = val;
//             });
//           },
//           hapticFeedbackType: HapticFeedbackType.heavyImpact,
//         ),
//         SizedBox(
//           width: 6.w,
//         ),
//         Column(
//           children: [
//             GestureDetector(
//               onTap: () {},
//               child: Container(
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.centerLeft,
//                       end: Alignment.centerRight,
//                       colors: [
//                         Color.fromRGBO(243, 243, 243, 1),
//                         Color.fromRGBO(255, 255, 255, 1),
//                         Color.fromRGBO(242, 242, 242, 1),
//                       ],
//                       stops: [0, 0.5718, 1],
//                     ),
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(8),
//                       topRight: Radius.circular(8),
//                     ),
//                   ),
//                   height: 38.5.h,
//                   width: 42.w,
//                   child: SvgPicture.asset(
//                     'assets/vehicleScreen/arrow_up.svg',
//                     width: 13.w,
//                     height: 6.5.h,
//                     fit: BoxFit.scaleDown,
//                   )),
//             ),
//             SizedBox(
//               height: 2.h,
//             ),
//             Container(
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight,
//                   colors: [
//                     Color.fromRGBO(243, 243, 243, 1),
//                     Color.fromRGBO(255, 255, 255, 1),
//                     Color.fromRGBO(242, 242, 242, 1),
//                   ],
//                   stops: [0, 0.5718, 1],
//                 ),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(8),
//                   bottomRight: Radius.circular(8),
//                 ),
//               ),
//               height: 38.5.h,
//               width: 42.w,
//               child: SvgPicture.asset(
//                 'assets/vehicleScreen/arrow_down.svg',
//                 width: 13.w,
//                 height: 6.5.h,
//                 fit: BoxFit.scaleDown,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
