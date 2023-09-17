import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/medical_record/application/medical_record_service.dart';
import 'package:klinnika/src/features/medical_record/domain/medical_record_convert.dart';
import 'package:klinnika/src/features/medical_record/presentation/medical_record_state.dart';
import 'package:klinnika/src/shared/extensions/date_time.dart';

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

  void getListMedicalRecord(
    String docterId,
    DateTime? startDate,
    DateTime? endDate,
  ) async {
    state = state.copyWith(
      medicalValue: const AsyncLoading(),
    );

    final result = await _medicalRecordService.getListMedicalRecord(docterId, startDate, endDate);

    result.when(
      success: (data) {
        mappingMedicalRecord(data);
        if (startDate == null && endDate == null) {
          state = state.copyWith(
            startDate: '',
            endDate: '',
            medical: data,
            medicalValue: AsyncData(data),
          );
        } else {
          state = state.copyWith(
            medical: data,
            startDate: startDate.toString(),
            endDate: endDate.toString(),
            medicalValue: AsyncData(data),
          );
        }
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          medicalValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  void mappingMedicalRecord(List<MedicalRecordConvert> medical) {
    final today = DateTime.now().toYyyyMMDd;
    final yesterday = DateTime.now().subtract(const Duration(days: 1)).toYyyyMMDd;

    final todayItems = medical.where((element) => element.createdAt?.toYyyyMMDd == today).toList();
    final yesterdayItems = medical.where((element) => element.createdAt?.toYyyyMMDd == yesterday).toList();
    final expiredItems = medical
        .where((element) => element.createdAt?.toYyyyMMDd != today && element.createdAt?.toYyyyMMDd != yesterday)
        .toList();

    state = state.copyWith(
      todayItems: todayItems,
      yesterdayItems: yesterdayItems,
      expiredItems: expiredItems,
    );
  }
}

final medicalRecordControllerProvider = StateNotifierProvider<MedicalRecordController, MedicalRecordState>((ref) {
  final medicalRecordService = ref.read(medicalRecordServiceProvider);
  return MedicalRecordController(medicalRecordService);
});
