import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/auth/domain/user.dart';
import 'package:klinnika/src/features/common/data/responses/responses.dart';
import 'package:klinnika/src/features/common/domain/patient.dart';
import 'package:klinnika/src/features/common/domain/queue.dart';
import 'package:klinnika/src/features/common/domain/queue_convert.dart';
import 'package:klinnika/src/services/services.dart';

class CommonRepository {
  final queueDb = FirebaseFirestore.instance.collection('queue').withConverter(
        fromFirestore: (snapshot, _) => Queue.fromJson(snapshot.data()!),
        toFirestore: (Queue queue, _) => queue.toJson(),
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
      final data = await FirebaseFirestore.instance.collection('patient').doc(patientId).get();
      final patient = data.data();
      return Patient.fromJson(patient!);
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
      final ref = FirebaseFirestore.instance
          .collection('patient')
          .withConverter(
            fromFirestore: (snapshot, _) => Patient.fromJson(snapshot.data()!),
            toFirestore: (Patient queue, _) => queue.toJson(),
          )
          .doc();
      final temp = patient.copyWith(id: ref.id);
      await ref.set(temp);
      return const Result.success('Success');
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }

  Future<Result<List<EventResponse>>> fetchEvents() async {
    try {
      // final result = await _dioClientTmdb.get(Endpoint.event);
      // final resultBody = result['body']['body'];
      // final eventList = resultBody.map<EventResponse>((e) => EventResponse.fromJson(e)).toList();
      // return Result.success(eventList);

      return const Result.success([]);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }

  Future<Result<EventResponse>> fetchDetail(int id) async {
    try {
      // final result = await _dioClientTmdb.get('${Endpoint.event}/$id');
      // final resultBody = result['body']['body'];
      // final event = EventResponse.fromJson(resultBody);
      // return Result.success(event);

      return const Result.success(EventResponse());
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }

  // Future<Result<ApiResponse>> postTicket(RequestTicket data) async {
  //   try {
  //     // final response =
  //     //     await _dioClientTmdb.post(Endpoint.ticket, data: data.toJson());

  //     // return Result.success(ApiResponse.fromJson(response['body']));

  //     // final ref = db.doc();
  //     // final temp = data.copyWith(eventId: ref.id);
  //     // await ref.set(temp);
  //     return const Result.success(ApiResponse(message: 'Success'));
  //   } catch (e, st) {
  //     return Result.failure(NetworkExceptions.getFirebaseException(e), st);
  //   }
  // }

  Future<Result<User>> fetchProfile(String uid) async {
    try {
      final result = await FirebaseFirestore.instance.collection('user').doc(uid).get();
      final resultBody = result.data();
      final user = User.fromJson(resultBody!);
      return Result.success(user);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }

  Future<Result<MyEventResponse>> fetchMyEvents(String token) async {
    try {
      // final result = await _dioClientTmdb.get(
      //   Endpoint.myEvents,
      //   options: Options(
      //     headers: {'Authorization': 'Bearer $token'},
      //   ),
      // );
      // final resultBody = result['body']['body'];
      // final user = MyEventResponse.fromJson(resultBody);
      // return Result.success(user);
      return const Result.success(MyEventResponse());
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }
}

final commonRepositoryProvider = Provider<CommonRepository>((ref) {
  // return CommonRepository(ref.read(dioClientProvider));
  return CommonRepository();
});
