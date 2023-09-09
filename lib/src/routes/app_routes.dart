import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/common/domain/queue_convert.dart';

import 'package:klinnika/src/features/common/presentation/home/home_botnavbar_page.dart';
import 'package:klinnika/src/features/common/presentation/onboard/onboard_page.dart';

import 'package:klinnika/src/features/common/presentation/splash/splash_page.dart';

import 'package:klinnika/src/features/presentation.dart';
import 'package:klinnika/src/features/queue/presentation/detail_patient/detail_patient_page.dart';
import 'package:klinnika/src/routes/routes.dart';

enum Routes {
  splash,
  onboard,
  login,
  home,
  patientDetail,
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      initialLocation: '/splash',
      routerNeglect: true,
      redirectLimit: 1,
      routes: [
        GoRoute(
          path: '/splash',
          name: Routes.splash.name,
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: '/onboard',
          name: Routes.onboard.name,
          builder: (context, state) => const OnboardPage(),
        ),
        GoRoute(
          path: '/login',
          name: Routes.login.name,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/home',
          name: Routes.home.name,
          builder: (context, state) => const HomeBotNavBarScreen(),
          routes: const [],
        ),
        GoRoute(
          path: '/patient-detail',
          name: Routes.patientDetail.name,
          builder: (context, state) {
            final extras = state.extra as Extras;
            final item = extras.datas[ExtrasKey.queue] as QueueConvert;
            final index = extras.datas[ExtrasKey.index] as int;
            return DetailPatientPage(
              item: item,
              index: index,
            );
          },
          routes: const [],
        ),
      ],
      errorBuilder: (context, state) => ErrorPage(
        error: state.error,
      ),
    );
  },
);
