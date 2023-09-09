import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/application.dart';
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

  Future<Result<List<EventResponse>>> getEventList() async {
    final result = await _commonRepository.fetchEvents();
    return result;
  }

  // Future<Result<String?>> createTicket(RequestTicket ticket) async {
  //   final result = await _commonRepository.postTicket(ticket);
  //   return result.when(
  //     success: (data) {
  //       return Result.success(data.message);
  //     },
  //     failure: (error, stackTrace) {
  //       return Result.failure(error, stackTrace);
  //     },
  //   );
  // }

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

  // Future<Result<MyEvents>> getMyEvents() async {
  //   // String? token = _hiveService.getToken();

  //   // if (token == null) {
  //   return Result.failure(
  //     const NetworkExceptions.notFound('Token is null'),
  //     StackTrace.current,
  //   );
  //   // }

  //   // final result = await _commonRepository.fetchMyEvents(token);
  //   // return CommonMapper.mapToMyEvents(result);
  // }
}

final commonServiceProvider = Provider<CommonService>((ref) {
  final commonRepository = ref.read(commonRepositoryProvider);
  // final hiveService = ref.read(hiveServiceProvider);
  return CommonService(commonRepository);
});
