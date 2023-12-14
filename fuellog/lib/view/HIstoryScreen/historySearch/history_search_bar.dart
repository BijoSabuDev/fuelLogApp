import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuellog/controller/historyScreen/history_screen.dart';
import 'package:fuellog/view/HIstoryScreen/historySearch/debouncer.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

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
  @override
  Widget build(BuildContext context) {
    // final sw = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: 62.h,
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[200],
      ),
      child: TextField(
        onChanged: (value) {
          _debouncer.run(() {
            historyController.userInput.value = value;
          });
          // historyController.userInput.value = value;
        },
        controller: textController,
        decoration: InputDecoration(
          prefixIcon: SvgPicture.asset(
            'assets/homeScreen/search.svg',
          ),
          prefixIconConstraints:
              BoxConstraints(minWidth: 27.w, minHeight: 18.h),
          // helperText: 'Bus No 52 or DXB135.',
          hintText: '    Bus No 52 or DXB135.',
          hintStyle: GoogleFonts.readexPro(
            fontWeight: FontWeight.w400,
            color: Colors.black.withOpacity(0.3),
            fontSize: 16.sp,
          ),
          suffixIcon: IconButton(
            icon: widget.suffixIcon,
            onPressed: widget.onPressedFunction,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
