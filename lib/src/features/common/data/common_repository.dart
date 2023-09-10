import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/auth/domain/user.dart';
import 'package:klinnika/src/features/common/domain/medical_record.dart';
import 'package:klinnika/src/features/common/domain/medical_record_convert.dart';
import 'package:klinnika/src/features/common/domain/medicals.dart';
import 'package:klinnika/src/features/common/domain/patient.dart';
import 'package:klinnika/src/features/common/domain/queue.dart';
import 'package:klinnika/src/features/common/domain/queue_convert.dart';
import 'package:klinnika/src/services/services.dart';

class CommonRepository {
  final queueDb = FirebaseFirestore.instance.collection('queue').withConverter(
        fromFirestore: (snapshot, _) => Queue.fromJson(snapshot.data()!),
        toFirestore: (Queue queue, _) => queue.toJson(),
      );

  final medicalRecordDb = FirebaseFirestore.instance.collection('medical_record').withConverter(
        fromFirestore: (snapshot, _) => MedicalRecord.fromJson(snapshot.data()!),
        toFirestore: (MedicalRecord medicalRecord, _) => medicalRecord.toJson(),
      );

  final medicalDb = FirebaseFirestore.instance.collection('medical').withConverter(
        fromFirestore: (snapshot, _) => Medicals.fromJson(snapshot.data()!),
        toFirestore: (Medicals medicals, _) => medicals.toJson(),
      );

  final patientDb = FirebaseFirestore.instance.collection('patient').withConverter(
        fromFirestore: (snapshot, _) => Patient.fromJson(snapshot.data()!),
        toFirestore: (Patient patient, _) => patient.toJson(),
      );

  final userDb = FirebaseFirestore.instance.collection('user').withConverter(
        fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
        toFirestore: (User user, _) => user.toJson(),
      );

  Future<Result<List<Queue>>> fetchQueues({
    required String doctorId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final data = await queueDb
          .where('finish_at', isNull: true)
          .where('doctor_id', isEqualTo: doctorId)
          .where('appointment_date', isGreaterThanOrEqualTo: startDate)
          .where('appointment_date', isLessThan: endDate)
          .orderBy('appointment_date')
          .get();
      final queueList = data.docs.map((e) => e.data()).toList();
      return Result.success(queueList);
    } catch (e, st) {
      final error = NetworkExceptions.getFirebaseException(e);
      return Result.failure(error, st);
    }
  }

  Future<Result<List<QueueConvert>>> fetchQueuesConvert(List<Queue> queueList) async {
    try {
      List<QueueConvert> convertedList = [];

      for (var queue in queueList) {
        Patient patient = await fetchPatient(queue.patientId.toString());
        convertedList.add(QueueConvert.fromQueue(queue, patient));
      }

      return Result.success(convertedList);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }

  Future<Patient> fetchPatient(String patientId) async {
    try {
      final data = await patientDb.doc(patientId).get();
      final patient = data.data()!;
      return patient;
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

  Future<List<MedicalRecordConvert>> getMedical(List<MedicalRecord> medicalRecordList) async {
    try {
      List<MedicalRecordConvert> result = [];

      for (var medicalRecord in medicalRecordList) {
        Medicals medicals = await fetchMedical(medicalRecord.medicalId.toString());
        result.add(MedicalRecordConvert.fromMedicalRecord(medicalRecord, medicals));
      }

      return result;
    } catch (e) {
      throw NetworkExceptions.getFirebaseException(e);
    }
  }

  Future<Medicals> fetchMedical(String medicalId) async {
    try {
      final data = await medicalDb.doc(medicalId).get();
      final medical = data.data()!;
      return medical;
    } catch (e) {
      throw NetworkExceptions.getFirebaseException(e);
    }
  }

  Future<Result<String?>> addQueue(Queue queue) async {
    try {
      final ref = queueDb.doc();
      final temp = queue.copyWith(id: ref.id);
      await ref.set(temp);
      return const Result.success('Success');
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }

  Future<Result<String?>> addPatient(Patient patient) async {
    try {
      final ref = patientDb.doc();
      final temp = patient.copyWith(id: ref.id);
      await ref.set(temp);
      return const Result.success('Success');
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }

  Future<Result<User>> fetchProfile(String uid) async {
    try {
      final result = await userDb.doc(uid).get();
      final user = result.data()!;
      return Result.success(user);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }
}

final commonRepositoryProvider = Provider<CommonRepository>((ref) {
  // return CommonRepository(ref.read(dioClientProvider));
  return CommonRepository();
});
