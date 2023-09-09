import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/gen/assets.gen.dart';
import 'package:klinnika/src/common_widgets/common_widgets.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/common/presentation/home/home_controller.dart';
import 'package:klinnika/src/shared/extensions/extensions.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => SplashPageState();
}

class SplashPageState extends ConsumerState<SplashPage> {
  HomeController get controller => ref.read(homeControllerProvider.notifier);

  @override
  initState() {
    _navigateOtherScreen();
    super.initState();
  }

  void _navigateOtherScreen() {
    Future.delayed(const Duration(seconds: 3)).then((_) async {
      await controller.checkUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return StatusBarWidget(
      child: Scaffold(
        body: SizedBox(
          height: context.screenHeight,
          width: context.screenWidth,
          child: Column(
            children: [
              const Spacer(flex: 4),
              Assets.icons.splashLogo.svg(
                width: context.screenWidthPercentage(0.4),
                fit: BoxFit.fitWidth,
              ),
              const Spacer(flex: 4),
              Text("By", style: TypographyApp.splashBy),
              Text("ORBIT", style: TypographyApp.splashTeamName),
              Gap.h28
            ],
          ),
        ),
      ),
    );
  }
}
