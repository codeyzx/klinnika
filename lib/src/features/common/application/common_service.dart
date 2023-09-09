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

  Future<Result<List<Queue>>> fetchHome() async {
    final resultEvents = await _commonRepository.fetchQueues(doctorId: '567890123');
    return resultEvents;
  }

  Future<Result<Home>> fetchHomeConvert(List<Queue> queue) async {
    final resultEvents = await _commonRepository.fetchQueuesConvert(queue);
    return CommonMapper.mapToHome(resultEvents);
  }

  Future<Result<String?>> createQueue(Queue queue) async {
    final result = await _commonRepository.postQueue(queue);
    return result.when(
      success: (data) {
        return Result.success(data);
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  Future<Result<Event>> getEventById(int id) async {
    final result = await _commonRepository.fetchDetail(id);
    return CommonMapper.mapToEventDetail(result);
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
    // if (token == null) {
    return Result.failure(
      const NetworkExceptions.notFound('Token is null'),
      StackTrace.current,
    );
    // }

    // final result = await _commonRepository.fetchProfile(token);
    // return CommonMapper.mapToProfile(result);
  }

  void logout() {
    // _hiveService.logout();
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
