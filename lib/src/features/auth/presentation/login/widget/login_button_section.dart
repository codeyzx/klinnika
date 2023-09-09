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
            onPressed: controller.login,
            child: Text("Masuk", style: TypographyApp.loginBtn,),
        ),
      ),
    );
    // return Padding(
    //   padding: EdgeInsets.symmetric(horizontal: 16.w),
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       ButtonWidget.primary(
    //         text: 'Masuk',
    //         onTap: controller.login,
    //         isLoading: state.isLoading,
    //       ),
    //     ],
    //   ),
    // );
  }
}
