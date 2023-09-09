import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klinnika/src/common_widgets/common_widgets.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/presentation.dart';
import 'package:klinnika/src/shared/extensions/extensions.dart';
import 'package:email_validator/email_validator.dart';

class LoginFormSection extends ConsumerWidget {
  const LoginFormSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);
    final controller = ref.read(loginControllerProvider.notifier);
    return Form(
      key: state.formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Masuk',
              style: TypographyApp.loginTitle,
            ),
            SizedBox(height: 24.h,),
            InputFormWidget(
              controller: controller.emailController,
              onChanged: (value) {},
              hintText: 'Email',
              prefixIcon: Icons.email_outlined,
              validator: controller.validateEmail,
            ),
            SizedBox(height: 16.h,),
            InputFormWidget.password(
              controller: controller.passwordController,
              onChanged: (value) {},
              hintText: 'Password',
              isObscure: state.isObscure,
              prefixIcon: Icons.lock_outline,
              onObscureTap: controller.onObscureTap,
              validator: controller.validatePassword,
            ),
          ],
        ),
      ),
    );
  }
}
