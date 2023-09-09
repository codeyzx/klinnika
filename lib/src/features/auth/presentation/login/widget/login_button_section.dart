import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klinnika/src/common_widgets/common_widgets.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/auth/presentation/login/login_controller.dart';

class LoginButtonSection extends ConsumerWidget {
  const LoginButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(loginControllerProvider.notifier);
    final state = ref.watch(loginControllerProvider);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SizedBox(
        width: 1.sw,
        height: 48.h,
        child: ElevatedButton(
            onPressed: state.isLoading ? null : controller.login,
            child: state.isLoading ? const LoadingWidget() : Text("Masuk", style: TypographyApp.loginBtn)),
      ),
    );
  }
}
