import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klinnika_doctor/src/features/authenticate/presentation/onboarding_screen.dart';
import 'package:klinnika_doctor/src/features/authenticate/presentation/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: OnBoardingScreen(),
          );
        });
  }
}
