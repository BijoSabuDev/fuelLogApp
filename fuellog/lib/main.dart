import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fuellog/controller/BusSelected/bus_selected.dart';
import 'package:fuellog/controller/busHistory/bus_history.dart';
import 'package:fuellog/controller/busSubmission/busSubmission.dart';
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
  // HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ).then((value) {
    runApp(MyApp());
  });
}

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final BusHistoryController busHistoryController =
      Get.put(BusHistoryController());

  final UserAuthController userAuthController = Get.put(UserAuthController());

  final BusSelectedController busSelectedController =
      Get.put(BusSelectedController());
  final BusSubmissionController busSubmissionController =
      Get.put(BusSubmissionController());

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidgetBuilder: (_) {
        return const Center(
          child: CupertinoActivityIndicator(
            color: Colors.black,
            radius: 28,
          ),
        );
      },
      child: ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(430, 932),
        builder: (_, child) {
          return GetMaterialApp(
            builder: EasyLoading.init(),
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
