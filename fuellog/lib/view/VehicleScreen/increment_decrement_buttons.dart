import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IncrementDecrementButtons extends StatefulWidget {
  const IncrementDecrementButtons({
    super.key,
    required this.scrollController,
  });

  final FixedExtentScrollController scrollController;

  @override
  State<IncrementDecrementButtons> createState() =>
      _IncrementDecrementButtonsState();
}

class _IncrementDecrementButtonsState extends State<IncrementDecrementButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onLongPress: () {
            widget.scrollController.animateToItem(
              widget.scrollController.selectedItem - 5,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
            );
          },
          onTap: () {
            widget.scrollController.animateToItem(
              widget.scrollController.selectedItem - 1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFE0E0E0)),
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              height: 38.5.h,
              width: 42.w,
              child: SvgPicture.asset(
                'assets/vehicleScreen/arrow_up.svg',
                width: 13.w,
                height: 6.5.h,
                fit: BoxFit.scaleDown,
              )),
        ),
        SizedBox(
          height: 2.h,
        ),
        GestureDetector(
          onLongPress: () {
            widget.scrollController.animateToItem(
              widget.scrollController.selectedItem + 5,
              duration: const Duration(milliseconds: 200),
              curve: Curves.ease,
            );
          },
          onTap: () {
            widget.scrollController.animateToItem(
              widget.scrollController.selectedItem + 1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE0E0E0)),
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            height: 38.5.h,
            width: 42.w,
            child: SvgPicture.asset(
              'assets/vehicleScreen/arrow_down.svg',
              width: 13.w,
              height: 6.5.h,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ],
    );
  }
}
