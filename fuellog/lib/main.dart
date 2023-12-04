import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuellog/view/HomeScreen/home_screen.dart';
import 'package:fuellog/view/constants/colors.dart';
import 'package:fuellog/view/mainScreen/main_screen.dart';
import 'package:fuellog/view/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ).then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // @override
  // Widget build(BuildContext context) {
  //   return CupertinoApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'Flutter Demo',
  //     theme: CupertinoThemeData(
  //       scaffoldBackgroundColor: appBackground,
  //       primaryColor:
  //           appTheme, // Use primaryColor instead of colorScheme in Cupertino
  //     ),
  //     home: const SplashScreen(),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: appBackground,
            colorScheme: ColorScheme.fromSeed(seedColor: appTheme),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
