import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/medical_record/data/medical_record_repository.dart';
import 'package:klinnika/src/features/medical_record/domain/medical_record_convert.dart';
import 'package:klinnika/src/services/services.dart';

class MedicalRecordService {
  final MedicalRecordRepository _medicalRecordRepository;

  MedicalRecordService(
    this._medicalRecordRepository,
  );

  Future<Result<List<MedicalRecordConvert>>> getMedicalRecord(String queueId) async {
    final result = await _medicalRecordRepository.getMedicalRecord(queueId);
    return result;
  }
}

final medicalRecordServiceProvider = Provider<MedicalRecordService>((ref) {
  final medicalRecordRepository = ref.read(medicalRecordRepositoryProvider);

  return MedicalRecordService(medicalRecordRepository);
});
