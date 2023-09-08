import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:klinnika/src/common_widgets/common_widgets.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/presentation.dart';
import 'package:klinnika/src/routes/routes.dart';
import 'package:klinnika/src/services/services.dart';
import 'package:klinnika/src/shared/extensions/build_context.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(registerControllerProvider, (prevState, state) {
      if (prevState?.registerValue != state.registerValue) {
        state.registerValue.whenOrNull(
          data: (message) {
            if (message != null) {
              appSnackBar(context, ColorApp.green, message);
              context.goNamed(Routes.login.name);
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
                const TopBarWidget(),
                Gap.h32,
                const RegisterFormSection(),
                Gap.h32,
                const RegisterButtonSection(),
                Gap.h32,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TypographyApp.headline3,
                    ),
                    Gap.w8,
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: Text(
                        'Sign In',
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