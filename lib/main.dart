import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klinnika/firebase_options.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/routes/routes.dart';

void main() async {
  /// [INFO] Init hive local db
  // await hiveInit();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(goRouterProvider);

    /// [INFO]
    /// As we use flutter_screenutil for responsive pixel
    /// with considering the design system size (390, 844).
    /// then don't forget to use these extension :
    /// 1. .h -> to pixel related with height, ex : 16.h
    /// 2. .w -> to pixel related with width, ex : 24.w
    /// 3. .r -> to pixel related with radius, ex : 8.r
    /// 4. .sp -> to pixel related with font size, ex : 14.sp
    ///
    /// [INFO]
    /// FocusManager is used for unfocus whenever user click outside of the textfield, it will unfocus.
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
            title: 'Klinnika',
            theme: _appTheme,
            builder: (context, child) {
              ErrorWidget.builder = (details) {
                return CustomErrorWidget(errorDetails: details);
              };
              return child ?? const Scaffold();
            },
          );
        },
      ),
    );
  }
}

class CustomErrorWidget extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const CustomErrorWidget({
    Key? key,
    required this.errorDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.red,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Something is not right here...",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

final _appTheme = ThemeData(
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    circularTrackColor: ColorApp.white,
    color: ColorApp.orange,
  ),
  dividerColor: Colors.transparent,
  fontFamily: 'Poppins',
  appBarTheme: AppBarTheme(
    elevation: 1,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontFamily: 'Poppins',
      color: Colors.white,
      fontSize: ScreenUtil().setSp(18),
      fontWeight: FontWeight.w600,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  scaffoldBackgroundColor: ColorApp.white,
  textTheme: TextTheme(
    titleLarge: TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.w600, color: Colors.red),
    bodyLarge: TextStyle(fontSize: ScreenUtil().setSp(14), fontWeight: FontWeight.w600, color: Colors.yellow),
    bodyMedium: TextStyle(fontSize: ScreenUtil().setSp(14), fontWeight: FontWeight.w600, color: ColorApp.gray),
    labelLarge: TextStyle(fontSize: ScreenUtil().setSp(14), fontWeight: FontWeight.w600, color: Colors.blue),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 1,
    backgroundColor: ColorApp.white,
    selectedItemColor: ColorApp.primary,
    unselectedItemColor: ColorApp.gray,
    showUnselectedLabels: true,
    showSelectedLabels: true,
  ),
);
