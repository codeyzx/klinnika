import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/application.dart';
import 'package:klinnika/src/features/domain.dart';
import 'package:klinnika/src/features/presentation.dart';
import 'package:klinnika/src/shared/extensions/extensions.dart';

class LoginController extends StateNotifier<LoginState> {
  final AuthService _authService;
  LoginController(this._authService) : super(LoginState());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    if (!state.formKey.currentState!.validate()) {
      return;
    }

    state = state.copyWith(
      loginValue: const AsyncLoading(),
    );

    final requestLogin = RequestLogin(
      email: emailController.text,
      password: passwordController.text,
    );

    final result = await _authService.login(requestLogin);

    result.when(
      success: (data) async {
        state = state.copyWith(
          loginValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          loginValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  String? validateEmail(String? value) {
    if (value.isNullOrEmpty()) {
      return "Cannot be empty";
    } else if (!value!.isEmailValid) {
      return "email not valid";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value.isNullOrEmpty()) {
      return "Cannot be empty";
    } else if (!value!.isPasswordValid) {
      return "Password must be more than 8";
    }
    return null;
  }

  void onObscureTap() {
    state = state.copyWith(
      isObscure: !state.isObscure,
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

final loginControllerProvider = StateNotifierProvider.autoDispose<LoginController, LoginState>((ref) {
  final authService = ref.read(authServiceProvider);
  return LoginController(authService);
});
