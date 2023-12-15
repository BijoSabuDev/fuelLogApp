import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuellog/view/constants/colors.dart';
import 'package:fuellog/view/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //  final HistoryScreenController historyController = Get.put(HistoryScreenController());
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ).then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(430, 932),
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: appBackground,
            // colorScheme: ColorScheme.fromSeed(seedColor: appTheme),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
