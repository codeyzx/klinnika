import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:klinnika/gen/assets.gen.dart';
import 'package:klinnika/src/common_widgets/common_widgets.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/presentation.dart';
import 'package:klinnika/src/routes/routes.dart';
import 'package:klinnika/src/services/services.dart';
import 'package:klinnika/src/shared/extensions/extensions.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(loginControllerProvider, (prevState, state) {
      if (prevState?.loginValue != state.loginValue) {
        state.loginValue.whenOrNull(
          data: (data) {
            if (data != null) {
              context.goNamed(Routes.home.name);
            }
          },
          error: (error, stackTrace) {
            final message = NetworkExceptions.getErrorMessage(error as NetworkExceptions);
            appSnackBar(context, ColorApp.red, message);
          },
        );
      }
    });

    return StatusBarWidget(
      child: Scaffold(
        body: SingleChildScrollView(
          child: PaddingWidget(
            child: Column(
              children: [
                Gap.customGapHeight(context.screenHeightPercentage(.15)),
                Center(
                  child: Assets.icons.klinnikaLogo.svg(
                    width: context.screenWidthPercentage(0.4),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Gap.h56,
                const LoginFormSection(),
                Gap.h32,
                const LoginButtonSection(),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TypographyApp.headline3,
                    ),
                    Gap.w8,
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(Routes.register.name);
                      },
                      child: Text(
                        'Sign Up',
                        style: TypographyApp.headline3.copyWith(
                          color: ColorApp.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap.h36
              ],
            ),
          ),
        ),
      ),
    );
  }
}
