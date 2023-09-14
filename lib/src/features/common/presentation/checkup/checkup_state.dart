import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/common/domain/medicine.dart';
import 'package:klinnika/src/features/common/domain/queue.dart';

class CheckupState {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<TextEditingController>? medicineController;
  final List<Medicine>? medicine;
  final AsyncValue<Queue?> queueValue;
  final AsyncValue<String?> checkupValue;
  final Queue? queue;
  final String? medicalId;
  final String? actType;
  CheckupState({
    this.queueValue = const AsyncLoading(),
    this.checkupValue = const AsyncData(null),
    this.queue,
    this.medicalId,
    this.actType = 'Pemberian Obat',
    this.medicineController,
    this.medicine,
  });

  bool get isLoading => checkupValue.isLoading;

  CheckupState copyWith({
    AsyncValue<Queue?>? queueValue,
    AsyncValue<String?>? checkupValue,
    List<TextEditingController>? medicineController,
    List<Medicine>? medicine,
    Queue? queue,
    String? medicalId,
    String? actType,
  }) {
    return CheckupState(
      queueValue: queueValue ?? this.queueValue,
      queue: queue ?? this.queue,
      checkupValue: checkupValue ?? this.checkupValue,
      medicineController: medicineController ?? this.medicineController,
      medicine: medicine ?? this.medicine,
      medicalId: medicalId ?? this.medicalId,
      actType: actType ?? this.actType,
    );
  }
}
