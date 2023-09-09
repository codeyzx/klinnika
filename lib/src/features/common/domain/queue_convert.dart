import 'package:klinnika/src/features/auth/domain/user.dart';
import 'package:klinnika/src/features/common/domain/queue.dart';

class QueueConvert {
  final String id;
  final User user;
  final String doctorId;
  final DateTime appointmentDate;
  final DateTime finishAt;
  final DateTime createdAt;
  final String polyId;
  final String complaintType;
  final String complaintDesc;
  final String clinicId;
  final String type;

  QueueConvert({
    required this.id,
    required this.user,
    required this.doctorId,
    required this.appointmentDate,
    required this.finishAt,
    required this.createdAt,
    required this.polyId,
    required this.complaintType,
    required this.complaintDesc,
    required this.clinicId,
    required this.type,
  });

  factory QueueConvert.fromMap(Map<String, dynamic> map) {
    return QueueConvert(
      id: map['id'] as String,
      user: map['user'] as User,
      doctorId: map['doctorId'] as String,
      appointmentDate: map['appointmentDate'] as DateTime,
      finishAt: map['finishAt'] as DateTime,
      createdAt: map['createdAt'] as DateTime,
      polyId: map['polyId'] as String,
      complaintType: map['complaintType'] as String,
      complaintDesc: map['complaintDesc'] as String,
      clinicId: map['clinicId'] as String,
      type: map['type'] as String,
    );
  }

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user': user,
      'doctorId': doctorId,
      'appointmentDate': appointmentDate,
      'finishAt': finishAt,
      'createdAt': createdAt,
      'polyId': polyId,
      'complaintType': complaintType,
      'complaintDesc': complaintDesc,
      'clinicId': clinicId,
      'type': type,
    };
  }

  factory QueueConvert.fromJson(Map<String, dynamic> json) {
    return QueueConvert(
      id: json['id'] as String,
      user: json['user'] as User,
      doctorId: json['doctorId'] as String,
      appointmentDate: json['appointmentDate'].toDate(),
      finishAt: json['finishAt'].toDate(),
      createdAt: json['createdAt'].toDate(),
      polyId: json['polyId'] as String,
      complaintType: json['complaintType'] as String,
      complaintDesc: json['complaintDesc'] as String,
      clinicId: json['clinicId'] as String,
      type: json['type'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'user': user,
        'doctorId': doctorId,
        'appointmentDate': appointmentDate,
        'finishAt': finishAt,
        'createdAt': createdAt,
        'polyId': polyId,
        'complaintType': complaintType,
        'complaintDesc': complaintDesc,
        'clinicId': clinicId,
        'type': type,
      };

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
