import 'dart:io';
// import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraCapture extends StatefulWidget {
  const CameraCapture({super.key});

  @override
  State<CameraCapture> createState() => _CameraCaptureState();
}

class _CameraCaptureState extends State<CameraCapture> {
  Future<void> requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      await Permission.camera.request();
    }
  }

  Future pickImage() async {
    try {
      final image = ImagePicker().pickImage(source: ImageSource.camera);

      // final imageTemperory = File(image.path);
    } catch (e) {
      print(e.toString());
    }
  }

  File? image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        requestCameraPermission();
        pickImage();
      },
      child: Container(
        width: 124.w,
        height: 34.32.h,
        decoration: BoxDecoration(
          color: const Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(6.64),
        ),
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
    );
  }
}