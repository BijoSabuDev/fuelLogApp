import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuellog/controller/BusSelected/bus_selected.dart';
import 'package:fuellog/view/VehicleScreen/vehicle_screen.dart';
import 'package:fuellog/view/constants/colors.dart';
import 'package:get/get.dart';

// THESE ARE USED IN HOMESCREEN

class SearchBarCustom extends StatefulWidget {
  // final Widget suffixIcon;

  final Function()? onPressedFunction;
  final double width;
  const SearchBarCustom(
      {super.key,
      // required this.suffixIcon,
      required this.width,
      this.onPressedFunction});

  @override
  State<SearchBarCustom> createState() => _SearchBarCustomState();
}
 

// final BusSelectedController busSelectedController =
//     Get.put(BusSelectedController());
final BusSelectedController busSelectedController =
    Get.find<BusSelectedController>();

class _SearchBarCustomState extends State<SearchBarCustom> {


final TextEditingController busSearchController = TextEditingController();
  @override
  void dispose() {
    busSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: TextField(
        controller: busSearchController,
        obscureText: false,
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () async {
                final success =
                    await busSelectedController.fetchBusSelectionData(
                        'fuel_bus_selection', busSearchController.text);
                if (success) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return VehicleScreen();
                    },
                  ));
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        content: Text('No bus id on this query'),
                      );
                    },
                  );
                }
              },
              child: Padding(
                padding: EdgeInsets.only(right: 12.h),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: sw * 0.044,
                  color: appTheme,
                ),
              ),
            ),
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
}
