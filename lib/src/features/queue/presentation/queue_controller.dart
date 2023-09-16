import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/queue/application/queue_service.dart';
import 'package:klinnika/src/features/queue/presentation/queue_state.dart';

class QueueController extends StateNotifier<QueueState> {
  final QueueService _queueService;

  QueueController(
    this._queueService,
  ) : super(QueueState());

  void fetchQueue(
    String docterId,
    DateTime startDate,
    DateTime endDate,
  ) async {
    state = state.copyWith(
      queueValue: const AsyncLoading(),
    );
    final result = await _queueService.fetchQueue(docterId, startDate, endDate);
    result.when(
      success: (data) async {
        final convertResult = await _queueService.fetchQueueConvert(data);
        convertResult.when(
          success: (data) {
            state = state.copyWith(
              queue: data,
              startDate: startDate.toString(),
              endDate: endDate.toString(),
              queueValue: AsyncData(data),
            );
          },
          failure: (error, stackTrace) {
            state = state.copyWith(
              queueValue: AsyncError(error, stackTrace),
            );
          },
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          queueValue: AsyncError(error, stackTrace),
        );
      },
    );
  }
}

final queueControllerProvider = StateNotifierProvider<QueueController, QueueState>((ref) {
  final queueService = ref.read(queueServiceProvider);
  return QueueController(queueService);
});
