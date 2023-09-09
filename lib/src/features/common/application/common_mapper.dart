import 'package:klinnika/src/features/common/domain/queue_convert.dart';
import 'package:klinnika/src/features/domain.dart';
import 'package:klinnika/src/services/services.dart';

class CommonMapper {
  static Result<Home> mapToHome(Result<List<QueueConvert>> result) {
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

  // static Result<List<Queue>> mapToQueue(Result<List<Queue>> result) {
  //   return result.when(
  //     success: (data) {
  //       return Result.success(
  //         data.map((e) => Queue.fromJson(e)).toList(),
  //       );
  //     },
  //     failure: (error, stackTrace) {
  //       return Result.failure(error, stackTrace);
  //     },
  //   );
  // }
}
