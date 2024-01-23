// ignore_for_file: use_build_context_synchronously

import 'dart:io';
// import 'dart:js_interop';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuellog/controller/busSubmission/busSubmission.dart';
import 'package:fuellog/view/constants/colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CameraCapture extends StatefulWidget {
  const CameraCapture({super.key});

  @override
  State<CameraCapture> createState() => _CameraCaptureState();
}

class _CameraCaptureState extends State<CameraCapture> {
  final BusSubmissionController busSubmissionController =
      Get.find<BusSubmissionController>();
  Future<void> requestCameraPermission(BuildContext context) async {
    var status = await Permission.camera.status;
    try {
      if (status.isDenied) {
        await Permission.camera.request();
      } else if (status.isPermanentlyDenied) {
        await Permission.camera.request();
      }
    } on PlatformException catch (e) {
      return showCupertinoDialog(
          context: context,
          builder: (ctx) {
            return CupertinoAlertDialog(
              title: Text(
                'Error',
                style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.red),
              ),
              content: SizedBox(
                width: 300.w,
                height: 48.h,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: e.message,
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
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
                      'Ok',
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

  Future<void> pickImage() async {
    busSubmissionController.imageFile.value == null;
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) {
        return;
      } else {
        File imageFile = File(image.path);

        EasyLoading.show(status: 'loading...', dismissOnTap: true);
        busSubmissionController.imageFile.value = imageFile;
        print(
            'this is the image file ${busSubmissionController.imageFile.value}');
        await Future.delayed(const Duration(milliseconds: 500));
        EasyLoading.showProgress(
          0.1,
          status: 'uploading...',
        );

        EasyLoading.showSuccess('Uploaded!', dismissOnTap: true);
        await Future.delayed(const Duration(milliseconds: 500));
        EasyLoading.dismiss();

        print(image.path);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return;
    }
  }

  File? image;
  @override
  Widget build(BuildContext ctx) {
    return GestureDetector(
      onTap: () async {
        await requestCameraPermission(ctx);
        await pickImage();
      },
      child: Container(
        width: 124.w,
        height: 34.32.h,
        decoration: BoxDecoration(
          color: const Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(6.64),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Take Photo',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 12.sp),
                ),
                SvgPicture.asset('assets/vehicleScreen/camera.svg')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
