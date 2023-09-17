import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:klinnika/gen/assets.gen.dart';
import 'package:klinnika/src/common_widgets/common_widgets.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/common/presentation/common_controller.dart';
import 'package:klinnika/src/features/presentation.dart';
import 'package:klinnika/src/routes/routes.dart';
import 'package:klinnika/src/services/services.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(loginControllerProvider, (prevState, state) {
      if (prevState?.loginValue != state.loginValue) {
        state.loginValue.whenOrNull(
          data: (data) async {
            if (data != null) {
              await ref.read(commonControllerProvider.notifier).getProfile();
            }
          },
          error: (error, stackTrace) {
            final message = NetworkExceptions.getErrorMessage(error as NetworkExceptions);
            appSnackBar(context, ColorApp.red, message);
          },
        );
      }
    });

    ref.listen(commonControllerProvider, (previous, next) {
      if (previous?.userValue != next.userValue) {
        next.userValue.whenOrNull(
          data: (data) {
            if (data != null) {
              context.goNamed(Routes.botNavBar.name);
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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    "assets/images/login_bg_img.png",
                    height: 220.h,
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.icons.klinnikaLogo.svg(
                    width: 45.w,
                    height: 45.h,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text(
                    "Klinnika",
                    style: TypographyApp.loginAppName,
                  ),
                ],
              ),
              SizedBox(height: 80.h),
              const LoginFormSection(),
              SizedBox(height: 16.h),
              const LoginButtonSection(),
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Lupa Password?',
                        style: TypographyApp.loginForgot,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
