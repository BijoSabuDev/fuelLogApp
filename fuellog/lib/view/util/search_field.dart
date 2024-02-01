import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuellog/controller/BusSelected/bus_selected.dart';
import 'package:fuellog/controller/userAuthentication/user_authentication.dart';
import 'package:fuellog/localStorage/local_storage.dart';
import 'package:fuellog/view/VehicleScreen/vehicle_screen.dart';
import 'package:fuellog/view/constants/colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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

final BusSelectedController busSelectedController =
    Get.find<BusSelectedController>();
final UserAuthController userAuthController = Get.find<UserAuthController>();

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
        onSubmitted: (value) async {
          final userData = await UserPreferences.getUserData();
          final instId = userData['inst_id'];
          final success = await busSelectedController.fetchBusSelectionData(
              'fuel_bus_selection', busSearchController.text, instId!);
          print(success);
          busSearchController.clear();

          if (busSelectedController.isLoading.value) {
            const Center(
              child: CircularProgressIndicator(),
            );
          } else if (busSelectedController.noConnection.value) {
            // ignore: use_build_context_synchronously
            showError(context, 'No network connection');
          } else if (busSelectedController.busSelectionData!.data!.dataStatus ==
              0) {
            // ignore: use_build_context_synchronously
            showError(context, 'No search results for this ID');
          } else if (busSelectedController
                  .busSelectionData!.data!.busDetails![0].fuel ==
              "ELECTRIC") {
            // ignore: use_build_context_synchronously
            showError(context, 'Searched Vehicle is Electric');
          } else if (success) {
            // ignore: use_build_context_synchronously
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) {
                return const VehicleScreen();
              },
            ));
          } else {
            // ignore: use_build_context_synchronously
            showError(context, 'No search results for this ID');
          }
        },
        controller: busSearchController,
        obscureText: false,
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () async {
                final userData = await UserPreferences.getUserData();
                final instId = userData['inst_id'];
                final success =
                    await busSelectedController.fetchBusSelectionData(
                        'fuel_bus_selection',
                        busSearchController.text,
                        instId!);
                busSearchController.clear();

                if (busSelectedController.isLoading.value) {
                  const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (busSelectedController.noConnection.value) {
                  // ignore: use_build_context_synchronously
                  showError(context, 'No network connection');
                } else if (busSelectedController
                        .busSelectionData!.data!.dataStatus ==
                    0) {
                  // ignore: use_build_context_synchronously
                  showError(context, 'No search results for this ID');
                } else if (busSelectedController
                        .busSelectionData!.data!.busDetails![0].fuel ==
                    "ELECTRIC") {
                  // ignore: use_build_context_synchronously
                  showError(context, 'Searched Vehicle is Electric');
                } else if (success) {
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return const VehicleScreen();
                    },
                  ));
                } else {
                  // ignore: use_build_context_synchronously
                  showError(context, 'No search results for this ID');
                }
              },
              child: Padding(
                padding: EdgeInsets.only(right: 12.h),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  weight: 2,
                  size: sw * 0.054,
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
            hintText: 'Bus No or Reg No.',
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }

  Future<dynamic> showError(BuildContext context, String errorMsg) {
    return showCupertinoDialog(
        context: context,
        builder: (ctx) {
          return CupertinoAlertDialog(
            title: Text(
              'Error!',
              style: GoogleFonts.poppins(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFEF4348)),
            ),
            content: SizedBox(
              height: 24.h,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: errorMsg,
                        style: GoogleFonts.poppins(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: ' ',
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              CupertinoDialogAction(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text(
                    'OK',
                    style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: appTheme),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
