import 'package:klinnika/src/features/medical_record/domain/medical.dart';
import 'package:klinnika/src/features/medical_record/domain/medical_record.dart';
import 'package:klinnika/src/features/patient/domain/patient.dart';

class MedicalRecordConvert {
  final String? id;
  final String? queueId;
  final String? doctorName;
  final Patient? patient;
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
    this.patient,
    this.clinicId,
    this.createdAt,
    this.diagnose,
    this.actType,
    this.medicalId,
    this.medical,
  });

  factory MedicalRecordConvert.fromMedicalRecord(
      MedicalRecord medicalRecord, Medical medical, String doctorName, Patient patient) {
    return MedicalRecordConvert(
      id: medicalRecord.id,
      queueId: medicalRecord.queueId,
      doctorName: doctorName,
      patient: patient,
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
    Patient? patient,
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
      patient: patient ?? this.patient,
      clinicId: clinicId ?? this.clinicId,
      createdAt: createdAt ?? this.createdAt,
      diagnose: diagnose ?? this.diagnose,
      actType: actType ?? this.actType,
      medicalId: medicalId ?? this.medicalId,
      medical: medical ?? this.medical,
    );
  }
}
