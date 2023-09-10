import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/application.dart';
import 'package:klinnika/src/features/common/presentation/medical_record/medical_record_state.dart';

class MedicalRecordController extends StateNotifier<MedicalRecordState> {
  final CommonService _commonService;

  MedicalRecordController(this._commonService) : super(const MedicalRecordState());

  void getMedicalRecord(String queueId) async {
    state = state.copyWith(
      medicalValue: const AsyncLoading(),
    );

    final result = await _commonService.getMedicalRecord(queueId);

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

  final medicalDetailControllerProvider = StateNotifierProvider<MedicalRecordController, MedicalRecordState>((ref) {
    final commonService = ref.read(commonServiceProvider);
    return MedicalRecordController(commonService);
  });
}
