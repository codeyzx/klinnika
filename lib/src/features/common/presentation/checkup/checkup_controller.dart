import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/application.dart';
import 'package:klinnika/src/features/common/domain/queue.dart';

import 'package:klinnika/src/features/common/presentation/checkup/checkup_state.dart';

class CheckupController extends StateNotifier<CheckupState> {
  final CommonService _commonService;
  CheckupController(this._commonService) : super(CheckupState());

  Future<void> createQueue() async {
    state = state.copyWith(
      checkupValue: const AsyncLoading(),
    );

    final requestQueue = Queue(
        id: '',
        userId: 'Hy9jrTiXmqZ3aXuEBVOvqZz3THV2',
        doctorId: '567890123',
        appointmentDate: DateTime.now(),
        finishAt: DateTime.now(),
        createdAt: DateTime.now(),
        polyId: '21312',
        complaintType: 'General Checkup',
        complaintDesc: 'Patient experiencing mild fever and headach',
        clinicId: '12312',
        type: 'Scheduled');

    final result = await _commonService.createQueue(requestQueue);

    result.when(
      success: (data) {
        state = state.copyWith(
          checkupValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          checkupValue: AsyncError(error, stackTrace),
        );
      },
    );
  }
}

final checkupControllerProvider = StateNotifierProvider<CheckupController, CheckupState>((ref) {
  final commonService = ref.read(commonServiceProvider);
  return CheckupController(commonService);
});
