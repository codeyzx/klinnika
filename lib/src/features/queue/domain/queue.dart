class Queue {
  final String? id;
  final String? patientId;
  final String? doctorId;
  final DateTime? appointmentDate;
  final DateTime? finishAt;
  final DateTime? createdAt;
  final String? polyId;
  final List<String>? complaintType;
  final String? complaintDesc;
  final String? clinicId;
  final String? type;

  Queue({
    this.id,
    this.patientId,
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

  factory Queue.fromMap(Map<String, dynamic> map) {
    return Queue(
      id: map['id'] as String,
      patientId: map['patient_id'] as String,
      doctorId: map['doctor_id'] as String,
      appointmentDate: map['appointment_date'].toDate(),
      finishAt: map['finish_at'].toDate(),
      createdAt: map['created_at'].toDate(),
      polyId: map['poly_id'] as String,
      complaintType: List<String>.from(map['complaint_type']),
      complaintDesc: map['complaint_desc'] as String,
      clinicId: map['clinic_id'] as String,
      type: map['type'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'patient_id': patientId,
      'doctor_id': doctorId,
      'appointment_date': appointmentDate,
      'finish_at': finishAt,
      'created_at': createdAt,
      'poly_id': polyId,
      'complaint_type': complaintType,
      'complaint_desc': complaintDesc,
      'clinic_id': clinicId,
      'type': type,
    };
  }

  factory Queue.fromJson(Map<String, dynamic> json) {
    return Queue(
      id: json['id'] ?? '',
      patientId: json['patient_id'] ?? '',
      doctorId: json['doctor_id'] ?? '',
      appointmentDate: json['appointment_date']?.toDate(),
      finishAt: json['finish_at']?.toDate(),
      createdAt: json['created_at']?.toDate(),
      polyId: json['poly_id'] ?? '',
      complaintType: List<String>.from(json['complaint_type'] ?? []),
      complaintDesc: json['complaint_desc'] ?? '',
      clinicId: json['clinic_id'] ?? '',
      type: json['type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'patient_id': patientId,
        'doctor_id': doctorId,
        'appointment_date': appointmentDate,
        'finish_at': finishAt,
        'created_at': createdAt,
        'poly_id': polyId,
        'complaint_type': complaintType,
        'complaint_desc': complaintDesc,
        'clinic_id': clinicId,
        'type': type,
      };

  Queue copyWith({
    String? id,
    String? patientId,
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
    return Queue(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
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
