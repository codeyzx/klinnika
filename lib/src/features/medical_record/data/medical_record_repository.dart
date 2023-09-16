import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/auth/domain/user.dart';
import 'package:klinnika/src/features/medical_record/domain/medical.dart';
import 'package:klinnika/src/features/medical_record/domain/medical_record.dart';
import 'package:klinnika/src/features/medical_record/domain/medical_record_convert.dart';
import 'package:klinnika/src/services/services.dart';

class MedicalRecordRepository {
  final medicalRecordDb = FirebaseFirestore.instance.collection('medical_record').withConverter(
        fromFirestore: (snapshot, _) => MedicalRecord.fromJson(snapshot.data()!),
        toFirestore: (MedicalRecord medicalRecord, _) => medicalRecord.toJson(),
      );

  final medicalDb = FirebaseFirestore.instance.collection('medical').withConverter(
        fromFirestore: (snapshot, _) => Medical.fromJson(snapshot.data()!),
        toFirestore: (Medical medical, _) => medical.toJson(),
      );

  final userDb = FirebaseFirestore.instance.collection('user').withConverter(
        fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
        toFirestore: (User user, _) => user.toJson(),
      );

  Future<Medical> fetchMedical(String medicalId) async {
    try {
      final data = await medicalDb.doc(medicalId).get();
      final medical = data.data()!;
      return medical;
    } catch (e) {
      throw NetworkExceptions.getFirebaseException(e);
    }
  }

  Future<String> getDoctorName(String doctorId) async {
    try {
      final data = await userDb.doc(doctorId).get();
      final user = data.data()!;
      return user.name;
    } catch (e) {
      throw NetworkExceptions.getFirebaseException(e);
    }
  }

  Future<List<MedicalRecordConvert>> getMedical(List<MedicalRecord> medicalRecordList) async {
    try {
      List<MedicalRecordConvert> result = [];

      for (var medicalRecord in medicalRecordList) {
        Medical medical = await fetchMedical(medicalRecord.medicalId.toString());
        String doctorName = await getDoctorName(medicalRecord.docId.toString());
        result.add(MedicalRecordConvert.fromMedicalRecord(medicalRecord, medical, doctorName));
      }

      return result;
    } catch (e) {
      throw NetworkExceptions.getFirebaseException(e);
    }
  }

  Future<Result<List<MedicalRecordConvert>>> getMedicalRecord(String queueId) async {
    try {
      final data = await medicalRecordDb.where('queue_id', isEqualTo: queueId).get();
      final medicalRecordList = data.docs.map((e) => e.data()).toList();
      final medicalRecordConvert = await getMedical(medicalRecordList);
      return Result.success(medicalRecordConvert);
    } catch (e, st) {
      final error = NetworkExceptions.getFirebaseException(e);
      return Result.failure(error, st);
    }
  }
}

final medicalRecordRepositoryProvider = Provider<MedicalRecordRepository>((ref) {
  // return MedicalRecordRepository(ref.read(dioClientProvider));
  return MedicalRecordRepository();
});
