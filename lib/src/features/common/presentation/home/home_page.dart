import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:klinnika/src/common_widgets/common_widgets.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/common/presentation/checkup/checkup_controller.dart';
import 'package:klinnika/src/features/common/presentation/home/home_controller.dart';
import 'package:klinnika/src/routes/routes.dart';
import 'package:klinnika/src/shared/extensions/build_context.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeControllerProvider);
    final controller = ref.read(homeControllerProvider.notifier);
    final queueController = ref.read(checkupControllerProvider.notifier);
    final queue = state.home?.queueList;
    return AsyncValueWidget(
      value: state.homeValue,
      data: (value) {
        return StatusBarWidget(
          brightness: Brightness.light,
          child: Scaffold(
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Gap.customGapHeight(context.screenHeightPercentage(.2)),
                      Text(
                        'Welcome to Klinnika',
                        style: TypographyApp.headline1,
                      ),
                      Gap.customGapHeight(context.screenHeightPercentage(.1)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              queueController.createQueue();
                              controller.fetchHome();
                            },
                            child: const Text('Add Data'),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              context.pushNamed(Routes.onboard.name);
                            },
                            child: const Text('Go To Login Page'),
                          ),
                        ],
                      ),
                      Gap.customGapHeight(context.screenHeightPercentage(.2)),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: queue?.length ?? 0,
                        itemBuilder: (context, index) {
                          final item = queue?[index];
                          return ListTile(
                            title: Text(item?.complaintType ?? ''),
                            subtitle: Text(item?.complaintDesc ?? ''),
                            trailing: Text(item?.type ?? ''),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
