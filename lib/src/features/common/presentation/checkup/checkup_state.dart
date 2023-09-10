import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/common/domain/queue.dart';

class CheckupState {
  final AsyncValue<Queue?> queueValue;
  final AsyncValue<String?> checkupValue;
  final Queue? queue;
  final String? medicalId;
  CheckupState({
    this.queueValue = const AsyncLoading(),
    this.checkupValue = const AsyncData(null),
    this.queue,
    this.medicalId,
  });

  bool get isLoading => checkupValue.isLoading;

  CheckupState copyWith({
    AsyncValue<Queue?>? queueValue,
    AsyncValue<String?>? checkupValue,
    Queue? queue,
    String? medicalId,
  }) {
    return CheckupState(
      queueValue: queueValue ?? this.queueValue,
      queue: queue ?? this.queue,
      checkupValue: checkupValue ?? this.checkupValue,
      medicalId: medicalId ?? this.medicalId,
    );
  }
}
