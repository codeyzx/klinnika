import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/application.dart';
import 'package:klinnika/src/features/common/domain/medical_record_convert.dart';
import 'package:klinnika/src/features/common/domain/patient.dart';
import 'package:klinnika/src/features/common/domain/queue.dart';
import 'package:klinnika/src/features/data.dart';
import 'package:klinnika/src/features/domain.dart';
import 'package:klinnika/src/services/services.dart';

class CommonService {
  final CommonRepository _commonRepository;

  CommonService(
    this._commonRepository,
  );

  Future<Result<List<Queue>>> fetchHome(
    String doctorId,
    DateTime startDate,
    DateTime endDate,
  ) async {
    final resultEvents = await _commonRepository.fetchQueues(doctorId: doctorId, startDate: startDate, endDate: endDate);
    return resultEvents;
  }

  Future<Result<Home>> fetchHomeConvert(List<Queue> queue) async {
    final resultEvents = await _commonRepository.fetchQueuesConvert(queue);
    return CommonMapper.mapToHome(resultEvents);
  }

  Future<Result<String?>> addQueue(Queue queue) async {
    final result = await _commonRepository.addQueue(queue);
    return result.when(
      success: (data) {
        return Result.success(data);
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  Future<Result<String?>> addPatient(Patient patient) async {
    final result = await _commonRepository.addPatient(patient);
    return result.when(
      success: (data) {
        return Result.success(data);
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  Future<Result<List<MedicalRecordConvert>>> getMedicalRecord(String queueId) async {
    final result = await _commonRepository.getMedicalRecord(queueId);
    return result;
  }

  Future<Result<User>> getProfile() async {
    String? uid = auth.FirebaseAuth.instance.currentUser?.uid;

    if (uid == null) {
      return Result.failure(
        const NetworkExceptions.notFound('USER IS NOT LOGIN'),
        StackTrace.current,
      );
    }

    final result = await _commonRepository.fetchProfile(uid);
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
