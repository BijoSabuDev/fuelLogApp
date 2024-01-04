import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuellog/controller/BusSelected/bus_selected.dart';
import 'package:fuellog/controller/busHistory/bus_history.dart';
import 'package:fuellog/controller/userAuthentication/user_authentication.dart';
import 'package:fuellog/view/constants/colors.dart';
import 'package:fuellog/view/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ).then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final BusHistoryController busHistoryController =
      Get.put(BusHistoryController());

  final UserAuthController userAuthController = Get.put(UserAuthController());

  final BusSelectedController busSelectedController =
      Get.put(BusSelectedController());

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: ScreenUtilInit(
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
      ),
    );
  }
}
