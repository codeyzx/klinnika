import 'package:klinnika/src/features/common/domain/medical_record.dart';
import 'package:klinnika/src/features/common/domain/medicals.dart';

class MedicalRecordConvert {
  final String? id;
  final String? queueId;
  final String? docId;
  final String? patientId;
  final String? clinicId;
  final DateTime? createdAt;
  final String? diagnose;
  final String? actType;
  final String? medicalId;
  final Medicals? medicals;

  MedicalRecordConvert({
    this.id,
    this.queueId,
    this.docId,
    this.patientId,
    this.clinicId,
    this.createdAt,
    this.diagnose,
    this.actType,
    this.medicalId,
    this.medicals,
  });

  factory MedicalRecordConvert.fromMedicalRecord(MedicalRecord medicalRecord, Medicals medicals) {
    return MedicalRecordConvert(
      id: medicalRecord.id,
      queueId: medicalRecord.queueId,
      docId: medicalRecord.docId,
      patientId: medicalRecord.patientId,
      clinicId: medicalRecord.clinicId,
      createdAt: medicalRecord.createdAt,
      diagnose: medicalRecord.diagnose,
      actType: medicalRecord.actType,
      medicalId: medicalRecord.medicalId,
      medicals: medicals,
    );
  }

  MedicalRecordConvert copyWith({
    String? id,
    String? queueId,
    String? docId,
    String? patientId,
    String? clinicId,
    DateTime? createdAt,
    String? diagnose,
    String? actType,
    String? medicalId,
    Medicals? medicals,
  }) {
    return MedicalRecordConvert(
      id: id ?? this.id,
      queueId: queueId ?? this.queueId,
      docId: docId ?? this.docId,
      patientId: patientId ?? this.patientId,
      clinicId: clinicId ?? this.clinicId,
      createdAt: createdAt ?? this.createdAt,
      diagnose: diagnose ?? this.diagnose,
      actType: actType ?? this.actType,
      medicalId: medicalId ?? this.medicalId,
      medicals: medicals ?? this.medicals,
    );
  }
}
