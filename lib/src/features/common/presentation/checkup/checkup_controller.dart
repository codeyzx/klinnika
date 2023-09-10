import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/application.dart';
import 'package:klinnika/src/features/common/domain/medical.dart';
import 'package:klinnika/src/features/common/domain/medical_record.dart';
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
      id: 'queue_id_5',
      patientId: 'ONVBjSU9xlsnHbSuw8pP',
      doctorId: doctorId,
      appointmentDate: DateTime.now().add(const Duration(days: 1)),
      createdAt: DateTime.now(),
      polyId: '21312',
      complaintType: ['Nyeri Punggung', 'Demam', 'Pusing'],
      complaintDesc:
          'Patient is experiencing intense lower back pain, high fever, and severe headaches. These symptoms have persisted for the past five days and are causing significant discomfort.',
      clinicId: '12312',
      type: 'Dalam Proses',
    );

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
      name: 'Sophia Lee',
      birthDate: DateTime(1988, 04, 25),
      email: 'sophia.lee@example.com',
      gender: 'Perempuan',
      phone: '08122345678',
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

  Future<void> addMedicalRecord(String medicalId) async {
    state = state.copyWith(
      checkupValue: const AsyncLoading(),
    );

    final requestMedicalRecord = MedicalRecord(
      actType: 'Pemberian Obat',
      diagnose:
          'Gangguan pada saluran pernafasan yang disebabkan oleh virus corona dan gejalanya adalah demam, batuk, dan sesak napas. Serta dapat menyerang siapa saja, baik anak-anak, orang dewasa, maupun lansia.',
      createdAt: DateTime.now(),
      clinicId: 'noP17V2AyWGw1AGGKtbT',
      docId: 'Hy9jrTiXmqZ3aXuEBVOvqZz3THV2',
      patientId: 'wxSp6GZYpI6cI8CT9xNa',
      queueId: '3MsWSMPAuT3Rcd7MptW3',
      medicalId: medicalId,
    );

    final result = await _commonService.addMedicalRecord(requestMedicalRecord);

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

  Future<void> addMedical() async {
    state = state.copyWith(
      checkupValue: const AsyncLoading(),
    );

    final requestMedical = Medical(
      medicals: [
        'Paracetamol',
        'Antibiotik',
        'Vitamin',
        'Obat Batuk',
      ],
    );

    final result = await _commonService.addMedical(requestMedical);

    result.when(
      success: (data) {
        state = state.copyWith(
          checkupValue: AsyncData(data),
          medicalId: data,
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
