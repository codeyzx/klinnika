import 'package:klinnika/src/features/common/domain/medical_record.dart';
import 'package:klinnika/src/features/common/domain/medical.dart';

class MedicalRecordConvert {
  final String? id;
  final String? queueId;
  final String? doctorName;
  final String? patientId;
  final String? clinicId;
  final DateTime? createdAt;
  final String? diagnose;
  final String? actType;
  final String? medicalId;
  final Medical? medical;

  MedicalRecordConvert({
    this.id,
    this.queueId,
    this.doctorName,
    this.patientId,
    this.clinicId,
    this.createdAt,
    this.diagnose,
    this.actType,
    this.medicalId,
    this.medical,
  });

  factory MedicalRecordConvert.fromMedicalRecord(MedicalRecord medicalRecord, Medical medical, String doctorName) {
    return MedicalRecordConvert(
      id: medicalRecord.id,
      queueId: medicalRecord.queueId,
      doctorName: doctorName,
      patientId: medicalRecord.patientId,
      clinicId: medicalRecord.clinicId,
      createdAt: medicalRecord.createdAt,
      diagnose: medicalRecord.diagnose,
      actType: medicalRecord.actType,
      medicalId: medicalRecord.medicalId,
      medical: medical,
    );
  }

  MedicalRecordConvert copyWith({
    String? id,
    String? queueId,
    String? doctorName,
    String? patientId,
    String? clinicId,
    DateTime? createdAt,
    String? diagnose,
    String? actType,
    String? medicalId,
    Medical? medical,
  }) {
    return MedicalRecordConvert(
      id: id ?? this.id,
      queueId: queueId ?? this.queueId,
      doctorName: doctorName ?? this.doctorName,
      patientId: patientId ?? this.patientId,
      clinicId: clinicId ?? this.clinicId,
      createdAt: createdAt ?? this.createdAt,
      diagnose: diagnose ?? this.diagnose,
      actType: actType ?? this.actType,
      medicalId: medicalId ?? this.medicalId,
      medical: medical ?? this.medical,
    );
  }
}
