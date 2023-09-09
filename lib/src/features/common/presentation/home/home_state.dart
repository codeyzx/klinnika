import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/common/presentation/home/home_page.dart';
import 'package:klinnika/src/features/domain.dart';

class HomeState {
  final bool isHomeActive;
  final bool isExploreActive;
  final bool isEventsActive;
  final bool isProfileActive;
  final bool isLastPage;
  final String startDate;
  final String endDate;
  final int currentIndex;
  final Widget currentScreen;
  final AsyncValue<Home?> homeValue;
  final AsyncValue<User?> userValue;
  final Home? home;
  final User? user;

  HomeState({
    this.isHomeActive = true,
    this.isExploreActive = false,
    this.isEventsActive = false,
    this.isProfileActive = false,
    this.isLastPage = false,
    this.startDate = '',
    this.endDate = '',
    this.currentIndex = 0,
    this.currentScreen = const HomePage(),
    this.homeValue = const AsyncLoading(),
    this.userValue = const AsyncLoading(),
    this.home,
    this.user,
  });

  HomeState copyWith({
    bool? isHomeActive,
    bool? isExploreActive,
    bool? isEventsActive,
    bool? isProfileActive,
    bool? isLastPage,
    String? startDate,
    String? endDate,
    int? currentIndex,
    Widget? currentScreen,
    AsyncValue<Home?>? homeValue,
    AsyncValue<User?>? userValue,
    Home? home,
    User? user,
  }) {
    return HomeState(
      isHomeActive: isHomeActive ?? this.isHomeActive,
      isExploreActive: isExploreActive ?? this.isExploreActive,
      isEventsActive: isEventsActive ?? this.isEventsActive,
      isProfileActive: isProfileActive ?? this.isProfileActive,
      isLastPage: isLastPage ?? this.isLastPage,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      currentIndex: currentIndex ?? this.currentIndex,
      currentScreen: currentScreen ?? this.currentScreen,
      homeValue: homeValue ?? this.homeValue,
      userValue: userValue ?? this.userValue,
      home: home ?? this.home,
      user: user ?? this.user,
    );
  }
}
