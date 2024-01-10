import 'dart:io';
// import 'dart:js_interop';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuellog/controller/busSubmission/busSubmission.dart';
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
  Future<void> requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      await Permission.camera.request();
    }
  }

  Future<void> pickImage() async {
    // busSubmissionController.imageFile.value == null;
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
        await Future.delayed(const Duration(seconds: 1));
        EasyLoading.showProgress(
          0.7,
          status: 'uploading...',
        );

        EasyLoading.showSuccess('Uploaded!', dismissOnTap: true);
        await Future.delayed(const Duration(seconds: 3));
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await requestCameraPermission();
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
