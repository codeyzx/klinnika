import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/auth/domain/request_user.dart';
import 'package:klinnika/src/features/common/data/common_repository.dart';
import 'package:klinnika/src/features/domain.dart';
import 'package:klinnika/src/services/services.dart';

class CommonService {
  final CommonRepository _commonRepository;

  CommonService(
    this._commonRepository,
  );

  Future<Result<User>> getProfile() async {
    String? uid = auth.FirebaseAuth.instance.currentUser?.uid;

    if (uid == null) {
      return Result.failure(
        const NetworkExceptions.notFound('User not found'),
        StackTrace.current,
      );
    }

    final result = await _commonRepository.getProfile(uid);
    return result.when(
      success: (data) {
        if (data.role.value != RoleUser.doctor.value) {
          return Result.failure(
            const NetworkExceptions.notFound('User not found'),
            StackTrace.current,
          );
        } else {
          return Result.success(data);
        }
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  Future<Result<String>> updateProfile(RequestUser user) async {
    var result = await _commonRepository.updateProfile(user);
    await getProfile();
    return result.when(
      success: (data) {
        return Result.success(data);
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  void logout() {
    auth.FirebaseAuth.instance.signOut();
  }
}

final commonServiceProvider = Provider<CommonService>((ref) {
  final commonRepository = ref.read(commonRepositoryProvider);

  return CommonService(commonRepository);
});
