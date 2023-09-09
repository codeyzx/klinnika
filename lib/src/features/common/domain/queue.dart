class Queue {
  final String id;
  final String userId;
  final String doctorId;
  final DateTime appointmentDate;
  final DateTime finishAt;
  final DateTime createdAt;
  final String polyId;
  final String complaintType;
  final String complaintDesc;
  final String clinicId;
  final String type;

  Queue({
    required this.id,
    required this.userId,
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

  factory Queue.fromMap(Map<String, dynamic> map) {
    return Queue(
      id: map['id'] as String,
      userId: map['userId'] as String,
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
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

  factory Queue.fromJson(Map<String, dynamic> json) {
    return Queue(
      id: json['id'] as String,
      userId: json['userId'] as String,
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
        'userId': userId,
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

  Queue copyWith({
    String? id,
    String? userId,
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
    return Queue(
      id: id ?? this.id,
      userId: userId ?? this.userId,
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
