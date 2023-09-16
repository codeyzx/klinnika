import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/queue/presentation/queue_page.dart';
import 'package:klinnika/src/features/domain.dart';

class CommonState {
  final bool isQueueActive;
  final bool isExploreActive;
  final bool isEventsActive;
  final bool isProfileActive;
  final bool isLastPage;
  final int currentIndex;
  final Widget currentScreen;
  final AsyncValue<User?> userValue;
  final User? user;

  CommonState({
    this.isQueueActive = true,
    this.isExploreActive = false,
    this.isEventsActive = false,
    this.isProfileActive = false,
    this.isLastPage = false,
    this.currentIndex = 0,
    this.currentScreen = const QueuePage(),
    this.userValue = const AsyncLoading(),
    this.user,
  });

  CommonState copyWith({
    bool? isQueueActive,
    bool? isExploreActive,
    bool? isEventsActive,
    bool? isProfileActive,
    bool? isLastPage,
    int? currentIndex,
    Widget? currentScreen,
    AsyncValue<User?>? userValue,
    User? user,
  }) {
    return CommonState(
      isQueueActive: isQueueActive ?? this.isQueueActive,
      isExploreActive: isExploreActive ?? this.isExploreActive,
      isEventsActive: isEventsActive ?? this.isEventsActive,
      isProfileActive: isProfileActive ?? this.isProfileActive,
      isLastPage: isLastPage ?? this.isLastPage,
      currentIndex: currentIndex ?? this.currentIndex,
      currentScreen: currentScreen ?? this.currentScreen,
      userValue: userValue ?? this.userValue,
      user: user ?? this.user,
    );
  }
}
