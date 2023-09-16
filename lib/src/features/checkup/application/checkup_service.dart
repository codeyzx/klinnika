import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/checkup/data/checkup_repository.dart';
import 'package:klinnika/src/features/history/domain/inventory_stock_convert.dart';
import 'package:klinnika/src/features/patient/domain/patient.dart';
import 'package:klinnika/src/features/queue/domain/queue.dart';
import 'package:klinnika/src/features/medical_record/domain/medical_record.dart';
import 'package:klinnika/src/services/services.dart';

class CheckupService {
  final CheckupRepository _checkupRepository;

  CheckupService(
    this._checkupRepository,
  );

  Future<Result<List<InventoryStockConvert>>> getInventoryStock(String clinicId) async {
    final result = await _checkupRepository.getInventoryStock(clinicId);
    return result;
  }

  Future<Result<String?>> addQueue(Queue queue) async {
    final result = await _checkupRepository.addQueue(queue);
    return result.when(
      success: (data) {
        return Result.success(data);
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  Future<Result<String?>> addPatient(Patient patient) async {
    final result = await _checkupRepository.addPatient(patient);
    return result.when(
      success: (data) {
        return Result.success(data);
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  Future<Result<String?>> addMedicalRecord(MedicalRecord medicalRecord) async {
    var result = await _checkupRepository.addMedicalRecord(medicalRecord);
    result = await _checkupRepository.updateQueue(medicalRecord.queueId.toString());
    return result.when(
      success: (data) {
        return Result.success(data);
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  Future<Result<String?>> addMedical(Map<String, dynamic> medical) async {
    final result = await _checkupRepository.addMedical(medical);
    return result.when(
      success: (data) {
        return Result.success(data);
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }
}

final checkupServiceProvider = Provider<CheckupService>((ref) {
  final checkupRepository = ref.read(checkupRepositoryProvider);

  return CheckupService(checkupRepository);
});
