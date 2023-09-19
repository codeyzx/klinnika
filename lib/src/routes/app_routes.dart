import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/auth/domain/schedule.dart';
import 'package:klinnika/src/features/auth/domain/user.dart';
import 'package:klinnika/src/features/checkup/presentation/checkup_page.dart';
import 'package:klinnika/src/features/common/presentation/botnavbar/botnavbar_page.dart';
import 'package:klinnika/src/features/common/presentation/splash/splash_page.dart';
import 'package:klinnika/src/features/history/domain/inventory_stock_convert.dart';
import 'package:klinnika/src/features/history/presentation/history_detail_page.dart';
import 'package:klinnika/src/features/inventory/presentation/inventory_detail_page.dart';
import 'package:klinnika/src/features/medical_record/domain/medical_record_convert.dart';
import 'package:klinnika/src/features/profile/presentation/profile_edit_page.dart';
import 'package:klinnika/src/features/profile/presentation/schedule_page.dart';
import 'package:klinnika/src/features/queue/domain/queue_convert.dart';
import 'package:klinnika/src/features/patient/presentation/detail_patient_page.dart';
import 'package:klinnika/src/features/medical_record/presentation/medical_record_page.dart';
import 'package:klinnika/src/features/common/presentation/onboard/onboard_page.dart';
import 'package:klinnika/src/features/presentation.dart';
import 'package:klinnika/src/routes/routes.dart';

enum Routes {
  splash,
  onboard,
  login,
  botNavBar,
  patientDetail,
  medicalRecord,
  checkup,
  inventoryDetail,
  historyDetail,
  schedule,
  editProfile,
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
          path: '/botnavbar',
          name: Routes.botNavBar.name,
          builder: (context, state) => const BotNavBarPage(),
        ),
        GoRoute(
          path: '/schedule',
          name: Routes.schedule.name,
          builder: (context, state) {
            final extras = state.extra as Extras;
            final schedule = extras.datas[ExtrasKey.schedule] as List<Schedule>;
            return SchedulePage(
              schedule: schedule,
            );
          },
        ),
        GoRoute(
          path: '/edit-profile-page',
          name: Routes.editProfile.name,
          builder: (context, state) {
            final extras = state.extra as Extras;
            final user = extras.datas[ExtrasKey.user] as User;
            return ProfileEditPage(
              user: user,
            );
          },
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
        ),
        GoRoute(
          path: '/medical-record',
          name: Routes.medicalRecord.name,
          builder: (context, state) {
            final extras = state.extra as Extras;
            final queueId = extras.datas[ExtrasKey.id] as String;
            return MedicalRecordPage(
              queueId: queueId,
            );
          },
        ),
        GoRoute(
          path: '/checkup',
          name: Routes.checkup.name,
          builder: (context, state) {
            final extras = state.extra as Extras;
            final item = extras.datas[ExtrasKey.queue] as QueueConvert;
            return CheckupPage(
              item: item,
            );
          },
        ),
        GoRoute(
          path: '/inventory-detail',
          name: Routes.inventoryDetail.name,
          builder: (context, state) {
            final extras = state.extra as Extras;
            final item = extras.datas[ExtrasKey.inventory] as InventoryStockConvert;
            return InventoryDetailPage(
              item: item,
            );
          },
        ),
        GoRoute(
          path: '/history-detail',
          name: Routes.historyDetail.name,
          builder: (context, state) {
            final extras = state.extra as Extras;
            final item = extras.datas[ExtrasKey.medicalRecord] as MedicalRecordConvert;
            return HistoryDetailPage(
              item: item,
            );
          },
        ),
      ],
      errorBuilder: (context, state) => ErrorPage(
        error: state.error,
      ),
    );
  },
);
