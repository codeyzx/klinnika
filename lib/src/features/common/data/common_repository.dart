import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:klinnika/src/features/auth/domain/schedule.dart';
import 'package:klinnika/src/features/auth/domain/user.dart';
import 'package:klinnika/src/services/services.dart';
import 'package:klinnika/src/shared/extensions/extensions.dart';

class CommonRepository {
  final userDb = FirebaseFirestore.instance.collection('user').withConverter(
        fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
        toFirestore: (User user, _) => user.toJson(),
      );

  final scheduleDb = FirebaseFirestore.instance.collection('schedule').withConverter(
        fromFirestore: (snapshot, _) => Schedule.fromJson(snapshot.data()!),
        toFirestore: (Schedule schedule, _) => schedule.toJson(),
      );

  Future<Schedule> getSchedule(String clinicId) async {
    try {
      final day = DateFormat('EEEE').format(DateTime.now());
      final result =
          await scheduleDb.where('clinic_id', isEqualTo: clinicId).where('day', isEqualTo: day.ind.toUpperCase()).get();

      final schedule = result.docs.first.data();
      return schedule;
    } catch (e) {
      throw NetworkExceptions.getFirebaseException(e);
    }
  }

  Future<List<Schedule>> getScheduleList(String clinicId) async {
    try {
      final result = await scheduleDb.where('clinic_id', isEqualTo: clinicId).get();
      final schedule = result.docs.map((e) => e.data()).toList();

      final day = ['SENIN', 'SELASA', 'RABU', 'KAMIS', 'JUMAT', 'SABTU', 'MINGGU'];
      final listSort = schedule.map((e) => e.day).toList();
      listSort.sort((a, b) => day.indexOf(a).compareTo(day.indexOf(b)));

      final listSortDay = listSort.map((e) => Schedule(day: e, endTime: '', startTime: '')).toList();
      final listSortDayWithTime = listSortDay.map((e) {
        final sorted = schedule.firstWhere((element) => element.day == e.day);
        return e.copyWith(day: e.day.capitalize, startTime: sorted.startTime, endTime: sorted.endTime);
      }).toList();

      return listSortDayWithTime;
    } catch (e) {
      throw NetworkExceptions.getFirebaseException(e);
    }
  }

  Future<Result<User>> getProfile(String uid) async {
    try {
      final result = await userDb.doc(uid).get();
      final user = result.data()!;
      final schedule = await getSchedule(user.clinicId);
      final scheduleList = await getScheduleList(user.clinicId);
      final userConverted = user.copyWith(schedule: schedule, scheduleList: scheduleList);
      return Result.success(userConverted);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }
}

final commonRepositoryProvider = Provider<CommonRepository>((ref) {
  return CommonRepository();
});
