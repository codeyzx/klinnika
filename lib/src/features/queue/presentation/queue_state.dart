import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/queue/domain/queue_convert.dart';

class QueueState {
  final AsyncValue<List<QueueConvert>?> queueValue;
  final List<QueueConvert>? queue;
  final String startDate;
  final String endDate;

  QueueState({
    this.queueValue = const AsyncLoading(),
    this.queue,
    this.startDate = '',
    this.endDate = '',
  });

  QueueState copyWith({
    AsyncValue<List<QueueConvert>?>? queueValue,
    List<QueueConvert>? queue,
    String? startDate,
    String? endDate,
  }) {
    return QueueState(
      queueValue: queueValue ?? this.queueValue,
      queue: queue ?? this.queue,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}
