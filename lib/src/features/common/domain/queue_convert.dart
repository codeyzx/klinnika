import 'package:klinnika/src/features/auth/domain/user.dart';
import 'package:klinnika/src/features/common/domain/queue.dart';

class QueueConvert {
  final String? id;
  final User? user;
  final String? doctorId;
  final DateTime? appointmentDate;
  final DateTime? finishAt;
  final DateTime? createdAt;
  final String? polyId;
  final String? complaintType;
  final String? complaintDesc;
  final String? clinicId;
  final String? type;

  QueueConvert({
    this.id,
    this.user,
    this.doctorId,
    this.appointmentDate,
    this.finishAt,
    this.createdAt,
    this.polyId,
    this.complaintType,
    this.complaintDesc,
    this.clinicId,
    this.type,
  });

  factory QueueConvert.fromQueue(Queue queue, User user) {
    return QueueConvert(
      id: queue.id,
      user: user,
      doctorId: queue.doctorId,
      appointmentDate: queue.appointmentDate,
      finishAt: queue.finishAt,
      createdAt: queue.createdAt,
      polyId: queue.polyId,
      complaintType: queue.complaintType,
      complaintDesc: queue.complaintDesc,
      clinicId: queue.clinicId,
      type: queue.type,
    );
  }

  QueueConvert copyWith({
    String? id,
    User? user,
    String? doctorId,
    DateTime? appointmentDate,
    DateTime? finishAt,
    DateTime? createdAt,
    String? polyId,
    String? complaintType,
    String? complaintDesc,
    String? clinicId,
    String? type,
  }) {
    return QueueConvert(
      id: id ?? this.id,
      user: user ?? this.user,
      doctorId: doctorId ?? this.doctorId,
      appointmentDate: appointmentDate ?? this.appointmentDate,
      finishAt: finishAt ?? this.finishAt,
      createdAt: createdAt ?? this.createdAt,
      polyId: polyId ?? this.polyId,
      complaintType: complaintType ?? this.complaintType,
      complaintDesc: complaintDesc ?? this.complaintDesc,
      clinicId: clinicId ?? this.clinicId,
      type: type ?? this.type,
    );
  }
}
