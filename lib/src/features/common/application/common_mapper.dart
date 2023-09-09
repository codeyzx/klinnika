import 'package:klinnika/src/features/common/domain/queue_convert.dart';
import 'package:klinnika/src/features/data.dart';
import 'package:klinnika/src/features/domain.dart';
import 'package:klinnika/src/services/services.dart';

class CommonMapper {
  static Result<Home> mapToHome(
    Result<List<QueueConvert>> result,
  ) {
    return result.when(
      success: (data) {
        List<QueueConvert> queue = [...data];
        return Result.success(
          Home(
            queueList: queue,
          ),
        );
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  static Result<Event> mapToEventDetail(Result<EventResponse> result) {
    return result.when(
      success: (item) {
        return Result.success(Event.fromResponse(item));
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }
}
