import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:klinnika/src/features/auth/domain/request_user.dart';
import 'package:klinnika/src/features/auth/domain/schedule.dart';
import 'package:klinnika/src/features/auth/domain/user.dart';
import 'package:klinnika/src/services/services.dart';
import 'package:klinnika/src/shared/extensions/extensions.dart';

class CommonRepository {
  final userDb = FirebaseFirestore.instance.collection('user').withConverter(
        fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
        toFirestore: (User user, _) => user.toJson(),
      );

  final requestUserDb = FirebaseFirestore.instance.collection('user').withConverter(
        fromFirestore: (snapshot, _) => RequestUser.fromJson(snapshot.data()!),
        toFirestore: (RequestUser user, _) => user.toJson(),
      );

  final scheduleDb = FirebaseFirestore.instance.collection('schedule').withConverter(
        fromFirestore: (snapshot, _) => Schedule.fromJson(snapshot.data()!),
        toFirestore: (Schedule schedule, _) => schedule.toJson(),
      );

  Future<Schedule> getSchedule(String uid) async {
    try {
      final day = DateFormat('EEEE').format(DateTime.now());
      final result = await userDb.doc(uid).collection('schedules').doc(day.ind.capitalize).get();
      final temp = result.data()!;
      final schedule = Schedule.fromJson(temp);
      return schedule;
    } catch (e) {
      throw NetworkExceptions.getFirebaseException(e);
    }
  }

  Future<List<Schedule>> getScheduleList(String uid) async {
    try {
      final result = await userDb.doc(uid).collection('schedules').get();
      final temp = result.docs.map((e) => e.data()).toList();

      final schedule = temp.map((e) => Schedule.fromJson(e)).toList();

      Map<String, int> dayMap = {
        "Senin": 1,
        "Selasa": 2,
        "Rabu": 3,
        "Kamis": 4,
        "Jumat": 5,
        "Sabtu": 6,
        "Minggu": 7,
      };

      schedule.sort((a, b) {
        int dayA = dayMap[a.days ?? '']!;
        int dayB = dayMap[b.days ?? '']!;
        return dayA.compareTo(dayB);
      });

      return schedule;
    } catch (e) {
      throw NetworkExceptions.getFirebaseException(e);
    }
  }

  Future<Result<User>> getProfile(String uid) async {
    try {
      final result = await userDb.doc(uid).get();
      final user = result.data()!;
      final schedule = await getSchedule(user.id);
      final scheduleList = await getScheduleList(user.id);
      final userConverted = user.copyWith(schedule: schedule, scheduleList: scheduleList);
      return Result.success(userConverted);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }

  Future<Result<String>> updateProfile(RequestUser user) async {
    try {
      await requestUserDb.doc(user.id).update(user.toJson());
      return const Result.success('Success');
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }
}

final commonRepositoryProvider = Provider<CommonRepository>((ref) {
  return CommonRepository();
});
