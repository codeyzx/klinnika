import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/application.dart';
import 'package:klinnika/src/features/common/domain/patient.dart';
import 'package:klinnika/src/features/common/domain/queue.dart';

import 'package:klinnika/src/features/common/presentation/checkup/checkup_state.dart';

class CheckupController extends StateNotifier<CheckupState> {
  final CommonService _commonService;
  CheckupController(this._commonService) : super(CheckupState());

  Future<void> addQueue(String doctorId) async {
    state = state.copyWith(
      checkupValue: const AsyncLoading(),
    );

    // final requestQueue = Queue(
    //     id: '',
    //     userId: doctorId,
    //     doctorId: doctorId,
    //     appointmentDate: DateTime.now(),
    //     createdAt: DateTime.now(),
    //     finishAt: DateTime.now(),
    //     polyId: '21312',
    //     complaintType: 'General Checkup',
    //     complaintDesc: 'Patient experiencing mild fever and headach',
    //     clinicId: '12312',
    //     type: 'Scheduled');

    final requestQueue = Queue(
        id: '',
        patientId: 'Hy9jrTiXmqZ3aXuEBVOvqZz3THV2',
        doctorId: doctorId,
        appointmentDate: DateTime.now(),
        createdAt: DateTime.now(),
        polyId: '21312',
        complaintType: ['Pusing', 'Demam', 'Mual'],
        complaintDesc: 'Patient experiencing mild fever and headach',
        clinicId: '12312',
        type: 'Scheduled');

    final result = await _commonService.addQueue(requestQueue);

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

  Future<void> addPatient() async {
    state = state.copyWith(
      checkupValue: const AsyncLoading(),
    );

    // final requestPatient = Patient(
    //   name: 'Ahmad Joni',
    //   birthDate: DateTime.now(),
    //   email: 'ahmadjoni@gmail.com',
    //   gender: 'Laki-laki',
    //   phone: '081234567890',
    // );

    final requestPatient = Patient(
      name: 'Mikasa Wolfram',
      birthDate: DateTime.now(),
      email: '',
      gender: 'Perempuan',
      phone: '085624418689',
    );

    final result = await _commonService.addPatient(requestPatient);

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
