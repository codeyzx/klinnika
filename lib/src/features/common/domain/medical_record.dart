class MedicalRecord {
  final String? id;
  final String? queueId;
  final String? docId;
  final String? patientId;
  final String? clinicId;
  final DateTime? createdAt;
  final String? diagnose;
  final String? actType;
  final String? medicalId;

  MedicalRecord({
    this.id,
    this.queueId,
    this.docId,
    this.patientId,
    this.clinicId,
    this.createdAt,
    this.diagnose,
    this.actType,
    this.medicalId,
  });

  factory MedicalRecord.fromMap(Map<String, dynamic> map) {
    return MedicalRecord(
      id: map['id'] as String,
      queueId: map['queue_id'] as String,
      docId: map['doc_id'] as String,
      patientId: map['patient_id'] as String,
      clinicId: map['clinic_id'] as String,
      createdAt: map['created_at'].toDate(),
      diagnose: map['diagnose'] as String,
      actType: map['act_type'] as String,
      medicalId: map['medical_id'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'queue_id': queueId,
      'doc_id': docId,
      'patient_id': patientId,
      'clinic_id': clinicId,
      'created_at': createdAt,
      'diagnose': diagnose,
      'act_type': actType,
      'medical_id': medicalId,
    };
  }

  factory MedicalRecord.fromJson(Map<String, dynamic> json) {
    return MedicalRecord(
      id: json['id'] ?? '',
      queueId: json['queue_id'] ?? '',
      docId: json['doc_id'] ?? '',
      patientId: json['patient_id'] ?? '',
      clinicId: json['clinic_id'] ?? '',
      createdAt: json['created_at']?.toDate(),
      diagnose: json['diagnose'] ?? '',
      actType: json['act_type'] ?? '',
      medicalId: json['medical_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'queue_id': queueId,
        'doc_id': docId,
        'patient_id': patientId,
        'clinic_id': clinicId,
        'created_at': createdAt,
        'diagnose': diagnose,
        'act_type': actType,
        'medical_id': medicalId,
      };

  MedicalRecord copyWith({
    String? id,
    String? queueId,
    String? docId,
    String? patientId,
    String? clinicId,
    DateTime? createdAt,
    String? diagnose,
    String? actType,
    String? medicalId,
  }) {
    return MedicalRecord(
      id: id ?? this.id,
      queueId: queueId ?? this.queueId,
      docId: docId ?? this.docId,
      patientId: patientId ?? this.patientId,
      clinicId: clinicId ?? this.clinicId,
      createdAt: createdAt ?? this.createdAt,
      diagnose: diagnose ?? this.diagnose,
      actType: actType ?? this.actType,
      medicalId: medicalId ?? this.medicalId,
    );
  }
}
