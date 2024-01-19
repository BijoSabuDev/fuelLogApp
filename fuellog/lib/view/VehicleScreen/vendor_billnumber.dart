import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuellog/controller/busSubmission/busSubmission.dart';
import 'package:fuellog/view/util/search_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VendorAndBillNumber extends StatefulWidget {
  final TextEditingController billNumberController;
  final GlobalKey<FormState> formKey;
  const VendorAndBillNumber({
    super.key,
    required this.formKey,
    required this.billNumberController,
  });

  @override
  State<VendorAndBillNumber> createState() => __VendorAndBillNumberState();
}

final BusSubmissionController busSubmissionController =
    Get.find<BusSubmissionController>();

String? dropDownValue = '';

// List<String> dropDownItem = [
//   'Al amera fuels',
//   'al am fuel',
//   'al jaseera fuels'
// ];

// final TextEditingController billNumberController = TextEditingController();
// final FocusNode billNumberFocus = FocusNode();
// String? selectedVendor;
// String? billNo;

class __VendorAndBillNumberState extends State<VendorAndBillNumber> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: SizedBox(
        height: 174.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/vehicleScreen/buspngvhscr.png',
              height: 119.h,
              width: 114..w,
            ),
            SizedBox(
              width: 12.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  width: 247.w,
                  height: 62.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                    color: const Color(0xFFF3F3F3),
                  ),
                  child: Center(
                    child: DropdownButtonFormField<String>(
                      alignment: Alignment.centerLeft,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 6.w, vertical: 12.h),
                        filled: true,
                        fillColor: const Color(0xFFF3F3F3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9),
                          borderSide: BorderSide.none, // Remove the underline
                        ),
                        hintText: '   Choose Vendor',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 16.sp,
                        ),
                      ),
                      items:
                          busSelectedController.vendorList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.w),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: Colors
                                    .white, // Background color of each dropdown item
                              ),
                              child: Text(
                                value,
                                style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      value: null,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          busSubmissionController.selectedVendor.value =
                              newValue;
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '    Vendor required';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Container(
                  width: 247.w,
                  height: 62.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: const Color(0xFFF3F3F3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: TextFormField(
                      // focusNode: billNumberFocus,
                      controller: widget.billNumberController,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          busSubmissionController.billNumber.value = newValue;
                        }
                      },
                      validator: (value) {
                        if (widget.billNumberController.text.isEmpty) {
                          return 'Bill number required';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Bill No',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
