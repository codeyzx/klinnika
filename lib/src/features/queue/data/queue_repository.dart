import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/patient/domain/patient.dart';
import 'package:klinnika/src/features/queue/domain/queue.dart';
import 'package:klinnika/src/features/queue/domain/queue_convert.dart';
import 'package:klinnika/src/services/services.dart';

class QueueRepository {
  final queueDb = FirebaseFirestore.instance.collection('queue').withConverter(
        fromFirestore: (snapshot, _) => Queue.fromJson(snapshot.data()!),
        toFirestore: (Queue queue, _) => queue.toJson(),
      );

  final patientDb = FirebaseFirestore.instance.collection('patient').withConverter(
        fromFirestore: (snapshot, _) => Patient.fromJson(snapshot.data()!),
        toFirestore: (Patient patient, _) => patient.toJson(),
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
}

final queueRepositoryProvider = Provider<QueueRepository>((ref) {
  // return QueueRepository(ref.read(dioClientProvider));
  return QueueRepository();
});
