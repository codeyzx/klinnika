import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:klinnika/src/common_widgets/common_widgets.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/common/presentation/home/home_controller.dart';
import 'package:klinnika/src/routes/routes.dart';
import 'package:klinnika/src/shared/extensions/build_context.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeControllerProvider);
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
                      Gap.customGapHeight(context.screenHeightPercentage(.5)),
                      const Center(child: Text('Home Page')),
                      ElevatedButton(
                          onPressed: () async {
                            context.pushNamed(Routes.login.name);
                          },
                          child: const Text('Go To Login Page'))
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
