import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/auth/data/responses/responses.dart';
import 'package:klinnika/src/features/common/data/responses/responses.dart';
import 'package:klinnika/src/features/common/domain/queue.dart';
import 'package:klinnika/src/services/services.dart';

class CommonRepository {
  final queueDb = FirebaseFirestore.instance.collection('queue').withConverter(
        fromFirestore: (snapshot, _) => Queue.fromJson(snapshot.data()!),
        toFirestore: (Queue queue, _) => queue.toJson(),
      );

  Future<Result<List<Queue>>> fetchQueues({required String doctorId}) async {
    try {
      final data = await queueDb.where('doctorId', isEqualTo: doctorId).get();
      final queueList = data.docs.map((e) => e.data()).toList();
      return Result.success(queueList);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }

  Future<Result<String?>> postQueue(Queue queue) async {
    try {
      final ref = queueDb.doc();
      final temp = queue.copyWith(id: ref.id);
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

  Future<Result<UserResponse>> fetchProfile(String token) async {
    try {
      // final result = await _dioClientTmdb.get(
      //   Endpoint.profile,
      //   options: Options(
      //     headers: {'Authorization': 'Bearer $token'},
      //   ),
      // );
      // final resultBody = result['body']['body'];
      // final user = UserResponse.fromJson(resultBody);
      return const Result.success(UserResponse());
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
