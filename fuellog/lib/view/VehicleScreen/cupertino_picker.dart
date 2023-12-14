import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuellog/view/VehicleScreen/increment_decrement_buttons.dart';
import 'package:google_fonts/google_fonts.dart';

class WheelSelector extends StatefulWidget {
  final Function(String) onValueSelected;
  late double inputValue = 0;
  final double containerHeight;
  final double containerWidth;
  final bool isButtonsVisible;
  final double itemExtent;
  final double initValue;
  final bool showDecimal;
  final int howMuchToGenerate;
  WheelSelector(
      {super.key,
      required this.containerHeight,
      required this.containerWidth,
      required this.isButtonsVisible,
      required this.itemExtent,
      required this.initValue,
      required this.showDecimal,
      required this.howMuchToGenerate,
      required this.onValueSelected,
      required this.inputValue});

  @override
  State<WheelSelector> createState() => _WheelSelectorState();
}

class _WheelSelectorState extends State<WheelSelector> {
  late FixedExtentScrollController scrollController;
  // late TextEditingController _textController;
  // double currentValue = 2.0;

  @override
  void initState() {
    super.initState();

    scrollController = FixedExtentScrollController(initialItem: 0);
    // _textController =
    //     TextEditingController(text: widget.currentValue.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: widget.containerHeight,
          width: widget.containerWidth,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.05), width: 1),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.95, 0.95],
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFFFFFFF),
                Color(0xFFFFFFFF),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CupertinoPicker(
              selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
                  background: Colors.transparent),
              scrollController: scrollController,
              useMagnifier: false,
              backgroundColor: Colors.white,
              itemExtent: widget.itemExtent,
              onSelectedItemChanged: (index) {
                setState(() {
                  HapticFeedback.mediumImpact();
                });
              },
              children: List<Widget>.generate(
                widget.howMuchToGenerate,
                (index) {
                  double nonDecimal = widget.initValue + (index * 1);
                  double value = widget.initValue + (index / 10);
                  int currentValue = widget.inputValue.toInt() + index;
                  if (currentValue > 999999) {
                    currentValue = 150000 + index;
                  }
                  String displayedValue = currentValue.toString();
                  if (displayedValue.length > 6) {
                    displayedValue = displayedValue.substring(0, 6);
                  }
                  return Center(
                    child: widget.showDecimal
                        ? Text(
                            value.toStringAsFixed(1),
                            style: GoogleFonts.readexPro(
                              fontSize: 36.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF1D1D1D),
                            ),
                          )
                        : Text(
                            widget.inputValue == 0
                                ? nonDecimal.toInt().toString()
                                : displayedValue,
                            style: GoogleFonts.readexPro(
                              fontSize: 36.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF1D1D1D),
                            ),
                          ),
                  );
                },
              ),
            ),
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        if (widget.isButtonsVisible)
          IncrementDecrementButtons(scrollController: scrollController)
      ],
    );
  }
}
