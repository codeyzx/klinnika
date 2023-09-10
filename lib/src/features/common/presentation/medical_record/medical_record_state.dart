import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/common/domain/medical_record_convert.dart';

class MedicalRecordState {
  final AsyncValue<List<MedicalRecordConvert>?> medicalValue;
  final List<MedicalRecordConvert>? medical;

  const MedicalRecordState({
    this.medicalValue = const AsyncLoading(),
    this.medical,
  });

  MedicalRecordState copyWith({
    AsyncValue<List<MedicalRecordConvert>?>? medicalValue,
    List<MedicalRecordConvert>? medical,
  }) {
    return MedicalRecordState(
      medicalValue: medicalValue ?? this.medicalValue,
      medical: medical ?? this.medical,
    );
  }
}
