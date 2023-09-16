import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/queue/domain/queue.dart';
import 'package:klinnika/src/features/data.dart';
import 'package:klinnika/src/features/queue/domain/queue_convert.dart';
import 'package:klinnika/src/services/services.dart';

class QueueService {
  final QueueRepository _queueRepository;

  QueueService(
    this._queueRepository,
  );

  Future<Result<List<Queue>>> fetchQueue(
    String doctorId,
    DateTime startDate,
    DateTime endDate,
  ) async {
    final resultEvents = await _queueRepository.fetchQueues(doctorId: doctorId, startDate: startDate, endDate: endDate);
    return resultEvents;
  }

  Future<Result<List<QueueConvert>>> fetchQueueConvert(List<Queue> queue) async {
    final resultEvents = await _queueRepository.fetchQueuesConvert(queue);
    return resultEvents;
  }
}

final queueServiceProvider = Provider<QueueService>((ref) {
  final queueRepository = ref.read(queueRepositoryProvider);

  return QueueService(queueRepository);
});
