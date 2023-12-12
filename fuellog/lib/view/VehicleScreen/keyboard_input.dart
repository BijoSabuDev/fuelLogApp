import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// class KeyBoardInputOdo extends StatefulWidget {
//   const KeyBoardInputOdo(
//       {super.key,
//       required this.textEditingController,
//       required this.onInputChanged});
//   final TextEditingController textEditingController;
//   final Function(String) onInputChanged;
//   @override
//   State<KeyBoardInputOdo> createState() => _KeyBoardInputOdoState();
// }

// class _KeyBoardInputOdoState extends State<KeyBoardInputOdo> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//         final newValue = await showDialog<String>(
//           context: context,
//           builder: (BuildContext context) {
         
//             return;  
//           },
//         );

//         if (newValue != null && newValue.isNotEmpty) {
//           widget.onInputChanged(newValue);
//         }
//       },
//       child: SvgPicture.asset(
//         'assets/vehicleScreen/keyboard (1) 1.svg',
//         width: 28.w,
//         height: 28.h,
//       ),
//     );
//   }
// }
