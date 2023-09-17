import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/medical_record/domain/medical_record_convert.dart';

class MedicalRecordState {
  final AsyncValue<List<MedicalRecordConvert>?> medicalValue;
  final List<MedicalRecordConvert>? medical;
  final String? startDate;
  final String? endDate;
  final List<MedicalRecordConvert> todayItems;
  final List<MedicalRecordConvert> yesterdayItems;
  final List<MedicalRecordConvert> expiredItems;

  const MedicalRecordState({
    this.medicalValue = const AsyncLoading(),
    this.medical,
    this.startDate = '',
    this.endDate = '',
    this.todayItems = const [],
    this.yesterdayItems = const [],
    this.expiredItems = const [],
  });

  MedicalRecordState copyWith({
    AsyncValue<List<MedicalRecordConvert>?>? medicalValue,
    List<MedicalRecordConvert>? medical,
    String? startDate,
    String? endDate,
    List<MedicalRecordConvert>? todayItems,
    List<MedicalRecordConvert>? yesterdayItems,
    List<MedicalRecordConvert>? expiredItems,
  }) {
    return MedicalRecordState(
      medicalValue: medicalValue ?? this.medicalValue,
      medical: medical ?? this.medical,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      todayItems: todayItems ?? this.todayItems,
      yesterdayItems: yesterdayItems ?? this.yesterdayItems,
      expiredItems: expiredItems ?? this.expiredItems,
    );
  }
}
