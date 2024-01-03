// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuellog/controller/busHistory/bus_history.dart';
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
  final BusHistoryController busHistoryController =
      Get.find<BusHistoryController>();

  final _debouncer = Debouncer(milliseconds: 1 * 1000);

  String searchValue = '';

  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: TextField(
        controller: textController,

        onEditingComplete: () async {
          print('editing complete');
          busHistoryController.userInput.value = textController.text;
          await busHistoryController.fetchBusHistoryData(textController.text);
       
          // FocusScope.of(context).unfocus();
        },
        // onSubmitted: (value) async {
        //   await _debouncer.run(() {
        //     searchValue = value;
        //   });
        //   await busHistoryController.fetchBusHistoryData(searchValue);
        //   // historyController.userInput.value = value;
        // },
        // // onTapOutside: (value) {
        // //   _debouncer.run(() {
        // //     historyController.userInput.value = '';
        // //   });
        // // },
        // onChanged: (value) async {
        //   await _debouncer.run(() {
        //     searchValue = value;
        //   });
        //   await busHistoryController.fetchBusHistoryData(searchValue);
        //   // historyController.userInput.value = value;
        // },
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

    super.dispose();
  }
}
