import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/domain.dart';
import 'package:klinnika/src/services/services.dart';

class AuthRepository {
  Future<Result> login(RequestLogin requestLogin) async {
    try {
      // final response = await _dioClient.post(
      //   Endpoint.login,
      //   data: requestLogin.toJson(),
      // );

      // return Result.success(fromJson(response['body']));
      // return const Result.success();
      return const Result.success(true);
    } catch (e, stackTrace) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), stackTrace);
    }
  }

  Future<Result> register(RequestRegister requestRegister) async {
    try {
      // final response = await _dioClient.post(
      //   Endpoint.register,
      //   data: requestRegister.toJson(),
      // );

      // return Result.success(fromJson(response['body']));

      return const Result.success(true);
    } catch (e, stackTrace) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), stackTrace);
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  // final dio = ref.read(dioClientProvider);
  return AuthRepository();
});
