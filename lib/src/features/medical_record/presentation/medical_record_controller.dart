import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/medical_record/application/medical_record_service.dart';
import 'package:klinnika/src/features/medical_record/presentation/medical_record_state.dart';

class MedicalRecordController extends StateNotifier<MedicalRecordState> {
  final MedicalRecordService _medicalRecordService;

  MedicalRecordController(this._medicalRecordService) : super(const MedicalRecordState());

  void getMedicalRecord(String queueId) async {
    state = state.copyWith(
      medicalValue: const AsyncLoading(),
    );

    final result = await _medicalRecordService.getMedicalRecord(queueId);

    result.when(
      success: (data) {
        state = state.copyWith(
          medical: data,
          medicalValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          medicalValue: AsyncError(error, stackTrace),
        );
      },
    );
  }
}

final medicalRecordControllerProvider = StateNotifierProvider<MedicalRecordController, MedicalRecordState>((ref) {
  final medicalRecordService = ref.read(medicalRecordServiceProvider);
  return MedicalRecordController(medicalRecordService);
});
