import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuellog/controller/historyScreen/history_screen.dart';
import 'package:fuellog/view/HIstoryScreen/historySearch/debouncer.dart';
import 'package:get/get.dart';

class HistorySearchBarCustom extends StatefulWidget {
  final Widget suffixIcon;
  final Function()? onPressedFunction;
  final double width;
  const HistorySearchBarCustom(
      {super.key,
      required this.suffixIcon,
      required this.width,
      this.onPressedFunction});

  @override
  State<HistorySearchBarCustom> createState() => _HistorySearchBarCustomState();
}

class _HistorySearchBarCustomState extends State<HistorySearchBarCustom> {
  final TextEditingController textController = TextEditingController();
  final HistoryScreenController historyController =
      Get.find<HistoryScreenController>();
  final _debouncer = Debouncer(milliseconds: 1 * 1000);
  // @override
  // Widget build(BuildContext context) {
  //   // final sw = MediaQuery.of(context).size.width;
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 24),
  //     height: 62.h,
  //     width: widget.width,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(50),
  //       color: Colors.grey[200],
  //     ),
  //     child: TextField(
  //       onChanged: (value) {
  //         _debouncer.run(() {
  //           historyController.userInput.value = value;
  //         });
  //         // historyController.userInput.value = value;
  //       },
  //       controller: textController,
  //       decoration: InputDecoration(
  //         prefixIcon: const Icon(
  //           Icons.search,
  //           color: Colors.grey,
  //         ),
  //         // prefixIconConstraints:
  //         //     BoxConstraints(minWidth: 27.w, minHeight: 18.h),
  //         // helperText: 'Bus No 52 or DXB135.',
  //         hintText: 'Bus No 52 or DXB135.',
  //         hintStyle: GoogleFonts.readexPro(
  //           fontWeight: FontWeight.w400,
  //           color: Colors.black.withOpacity(0.3),
  //           fontSize: 16.sp,
  //         ),
  //         suffixIcon: IconButton(
  //           icon: widget.suffixIcon,
  //           onPressed: widget.onPressedFunction,
  //         ),

  //         border: InputBorder.none,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: TextField(
        onSubmitted: (value) {
          _debouncer.run(() {
            historyController.userInput.value = value;
          });
          // historyController.userInput.value = value;
        },
        // onTapOutside: (value) {
        //   _debouncer.run(() {
        //     historyController.userInput.value = '';
        //   });
        // },
        onChanged: (value) {
          _debouncer.run(() {
            historyController.userInput.value = value;
          });
          // historyController.userInput.value = value;
        },
        // controller: controller,
        obscureText: false,
        decoration: InputDecoration(
            suffixIcon: widget.suffixIcon,
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

  @override
  void dispose() {
    textController.dispose();
    historyController.userInput.value = '';
    super.dispose();
  }
}
