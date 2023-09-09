import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:klinnika/src/features/application.dart';

import 'package:klinnika/src/features/presentation.dart';
import 'package:klinnika/src/routes/app_routes.dart';

class HomeController extends StateNotifier<HomeState> {
  final CommonService _commonService;

  HomeController(
    this._commonService,
  ) : super(HomeState());

  void fetchHome(
    String docterId,
    DateTime startDate,
    DateTime endDate,
  ) async {
    state = state.copyWith(
      homeValue: const AsyncLoading(),
    );
    final result = await _commonService.fetchHome(docterId, startDate, endDate);
    result.when(
      success: (data) async {
        final convertResult = await _commonService.fetchHomeConvert(data);
        convertResult.when(
          success: (data) {
            state = state.copyWith(
              home: data,
              homeValue: AsyncData(data),
            );
          },
          failure: (error, stackTrace) {
            state = state.copyWith(
              homeValue: AsyncError(error, stackTrace),
            );
          },
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          homeValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  void getProfile() async {
    state = state.copyWith(
      userValue: const AsyncLoading(),
    );
    final result = await _commonService.getProfile();
    result.when(
      success: (data) {
        state = state.copyWith(
          user: data,
          userValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          userValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  void logout() {
    _commonService.logout();
    navigatorKey.currentContext!.goNamed(Routes.login.name);
    setPage(0);
    state = state.copyWith(
      user: null,
      userValue: const AsyncData(null),
    );
  }

  void setPage(index) {
    state = state.copyWith(
      currentIndex: index,
      currentScreen: _getScreen(index),
      isHomeActive: index == 0,
      isExploreActive: index == 1,
      isEventsActive: index == 2,
      isProfileActive: index == 3,
    );
  }

  void setLastPage(bool value) {
    state = state.copyWith(
      isLastPage: value,
    );
  }

  Widget _getScreen(index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const HomePage();
      case 2:
        return const HomePage();
      case 3:
        return const HomePage();
      default:
        return const HomePage();
    }
  }

  Future<void> checkUsers() async {
    final result = await _commonService.getProfile();
    result.when(
      success: (data) {
        state = state.copyWith(
          user: data,
          userValue: AsyncData(data),
        );
        return navigatorKey.currentContext!.goNamed(Routes.home.name);
      },
      failure: (error, stackTrace) {
        return navigatorKey.currentContext!.goNamed(Routes.login.name);
      },
    );
  }
}

final homeControllerProvider = StateNotifierProvider<HomeController, HomeState>((ref) {
  final commonService = ref.read(commonServiceProvider);
  return HomeController(commonService);
});
