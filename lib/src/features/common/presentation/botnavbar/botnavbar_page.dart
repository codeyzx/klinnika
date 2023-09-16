import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/common/presentation/common_controller.dart';

class BotNavBarPage extends ConsumerWidget {
  const BotNavBarPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(commonControllerProvider);
    final controller = ref.read(commonControllerProvider.notifier);
    final currentIndex = state.currentIndex;
    final currentScreen = state.currentScreen;
    final bucket = PageStorageBucket();

    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(top: 10.sp),
          decoration: const BoxDecoration(color: ColorApp.white),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 24.0.sp,
            currentIndex: currentIndex,
            onTap: (index) => controller.setPage(index),
            items: [
              // BottomNavigationBarItem(
              //   icon: !state.isQueueActive ? Assets.icons.icHomeDeactive.svg() : Assets.icons.icHomeActive.svg(),
              //   label: 'Queue',
              // ),
              BottomNavigationBarItem(
                icon: !state.isQueueActive
                    ? const Icon(Icons.featured_play_list_rounded)
                    : Icon(
                        Icons.featured_play_list_rounded,
                        color: ColorApp.primary,
                      ),
                label: 'Queue',
              ),
              // BottomNavigationBarItem(
              //   icon: !state.isExploreActive ? Assets.icons.icExploreDeactive.svg() : Assets.icons.icExploreActive.svg(),
              //   label: 'Explore',
              // ),
              BottomNavigationBarItem(
                icon: !state.isExploreActive
                    ? const Icon(Icons.history)
                    : Icon(
                        Icons.history,
                        color: ColorApp.primary,
                      ),
                label: 'History',
              ),
              // BottomNavigationBarItem(
              //   icon: !state.isEventsActive ? Assets.icons.icEventsDeactive.svg() : Assets.icons.icEventsActive.svg(),
              //   label: 'Events',
              // ),
              BottomNavigationBarItem(
                icon: !state.isEventsActive
                    ? const Icon(Icons.inventory_2_rounded)
                    : Icon(
                        Icons.inventory_2_rounded,
                        color: ColorApp.primary,
                      ),
                label: 'Inventory',
              ),
              // BottomNavigationBarItem(
              //   icon: !state.isProfileActive ? Assets.icons.icProfileDeactive.svg() : Assets.icons.icProfileActive.svg(),
              //   label: 'Profile',
              // ),
              BottomNavigationBarItem(
                icon: !state.isProfileActive
                    ? const Icon(Icons.person_2_rounded)
                    : Icon(
                        Icons.person_2_rounded,
                        color: ColorApp.primary,
                      ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
