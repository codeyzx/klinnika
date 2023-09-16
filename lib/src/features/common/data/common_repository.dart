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

  Future<Result<User>> getProfile(String uid) async {
    try {
      final result = await userDb.doc(uid).get();
      final user = result.data()!;
      final schedule = await getSchedule(user.clinicId);
      final userConverted = user.copyWith(schedule: schedule);
      return Result.success(userConverted);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }
}

final commonRepositoryProvider = Provider<CommonRepository>((ref) {
  return CommonRepository();
});
