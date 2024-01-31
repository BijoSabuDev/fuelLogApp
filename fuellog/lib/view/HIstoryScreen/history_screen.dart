import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuellog/controller/busHistory/bus_history.dart';
import 'package:fuellog/view/HIstoryScreen/history_app_bar.dart';
import 'package:fuellog/view/HIstoryScreen/historySearch/history_search_bar.dart';
import 'package:fuellog/view/HIstoryScreen/listview_item.dart';
import 'package:fuellog/view/HIstoryScreen/no_record_screen.dart';
import 'package:fuellog/view/HIstoryScreen/search_or_scan.dart';
import 'package:fuellog/view/util/bus_no_box.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  final BusHistoryController busHistoryController =
      Get.find<BusHistoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 82.h,
            ),
            const HistoryAppBar(),
            SizedBox(
              height: 22.h,
            ),
            HistorySearchBarCustom(
                    width: 391.w,
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 24.h),
                      child: SvgPicture.asset(
                        'assets/historyScreen/scan 1.svg',
                        height: 32.h,
                        width: 32.w,
                        fit: BoxFit.scaleDown,
                      ),
                    ))
                .animate()
                .fadeIn(delay: 100.ms, duration: 500.ms, curve: Curves.easeOut)
                .slideY(
                  delay: 100.ms,
                  curve: Curves.linear,
                  begin: 0.2,
                  end: 0.0,
                ),
            SizedBox(
              height: 33.h,
            ),
            GetX<BusHistoryController>(builder: (busHistoryController) {
              if (busHistoryController.isLoading.value) {
                context.loaderOverlay.show();
              } else {
                context.loaderOverlay.hide();
              }
              if (busHistoryController.userInput.value.isEmpty) {
                return SearchOrScan();
              } else if (busHistoryController.isLoading.value) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              }
              
              else if (busHistoryController.isSuccess.value &&
                  busHistoryController.busHistory.value!.data != null &&
                  busHistoryController.busHistory.value!.data!.data != null &&
                  busHistoryController.busHistory.value!.fuelType ==
                      'ELECTRIC') {
                return NoRecordScreen();
              }
               else if (busHistoryController.isSuccess.value &&
                  busHistoryController.busHistory.value!.data != null &&
                  busHistoryController.busHistory.value!.data!.data != null &&
                  busHistoryController.busHistory.value!.data!.data!
                          .vehicleActivityHistory !=
                      null &&
                  busHistoryController.busHistory.value!.data!.data!
                      .vehicleActivityHistory!.isNotEmpty) {
                final busNo =
                    busHistoryController.busHistory.value!.busNo ?? '0';
                final regNo =
                    busHistoryController.busHistory.value!.regNo ?? '0';
                final fuelType =
                    busHistoryController.busHistory.value!.fuelType ?? '0';

                return Column(
                  children: [
                    BusNumberBox(
                        busNo: busNo, regNo: regNo, fuelType: fuelType),

                    SizedBox(
                      height: 33.h,
                    ),

                    SizedBox(
                      height: 119.h,
                      width: 405.w,
                      child: Image.asset('assets/historyScreen/image 150.png')
                          .animate(delay: 0.ms)
                          .fadeIn(
                              delay: 100.ms,
                              duration: 500.ms,
                              curve: Curves.easeOut)
                          .slideX(delay: 100.ms),
                    ),
                    // SizedBox(
                    //   height: 12.h,
                    // ),

                    SizedBox(
                      height: 10.h,
                    ),
                    SingleChildScrollView(
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GetX<BusHistoryController>(
                            builder: (busHistoryController) {
                              return BusDetailsListview(
                                busHistoryDate:
                                    busHistoryController.dateList[index],
                                busHistoryTime:
                                    busHistoryController.timeList[index],
                                fuelPrice:
                                    busHistoryController.vhactRateList[index],
                                fuelQty: busHistoryController
                                    .vhactFuelQuantityList[index],
                                odometerReading:
                                    busHistoryController.vhactReading[index],
                              )
                                  .animate()
                                  .fadeIn(
                                      delay: 100.ms,
                                      duration: 500.ms,
                                      curve: Curves.easeOut)
                                  .slideY(
                                    delay: 100.ms,
                                    curve: Curves.linear,
                                    begin: 0.2,
                                    end: 0.0,
                                  );
                            },
                          );
                        },
                        separatorBuilder: (builder, context) {
                          return SizedBox(
                            height: 13.h,
                          );
                        },
                        itemCount: busHistoryController.busHistory.value!.data!
                            .data!.vehicleActivityHistory!.length,
                      ),
                    )
                  ],
                );
              } else if (busHistoryController.noResults.value) {
                return NoRecordScreen();
              } else {
                return NoRecordScreen();
              }
            })
          ],
        ),
      ),
    );
  }
}
