import 'package:klinnika/src/features/patient/domain/patient.dart';
import 'package:klinnika/src/features/queue/domain/queue.dart';

class QueueConvert {
  final String? id;
  final Patient? patient;
  final String? doctorId;
  final DateTime? appointmentDate;
  final DateTime? finishAt;
  final DateTime? createdAt;
  final String? polyId;
  final List<String>? complaintType;
  final String? complaintDesc;
  final String? clinicId;
  final String? type;

  QueueConvert({
    this.id,
    this.patient,
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

  factory QueueConvert.fromQueue(Queue queue, Patient patient) {
    return QueueConvert(
      id: queue.id,
      patient: patient,
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
    Patient? patient,
    String? doctorId,
    DateTime? appointmentDate,
    DateTime? finishAt,
    DateTime? createdAt,
    String? polyId,
    List<String>? complaintType,
    String? complaintDesc,
    String? clinicId,
    String? type,
  }) {
    return QueueConvert(
      id: id ?? this.id,
      patient: patient ?? this.patient,
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
