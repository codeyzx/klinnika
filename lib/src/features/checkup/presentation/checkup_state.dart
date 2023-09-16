import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/history/domain/inventory_stock_convert.dart';
import 'package:klinnika/src/features/medical_record/domain/medicine.dart';
import 'package:klinnika/src/features/queue/domain/queue.dart';

List<String> actType = [
  "Pemberian Obat",
  "Pemberian Rujukan",
  "Check-Up",
  "Operasi",
  "Fisioterapi",
  "Rehabilitasi",
  "Terapi Psikologi",
  "Pemeriksaan Darah",
  "Pemeriksaan Radiologi",
  "Terapi Okupasi",
  "Perawatan Rawat",
  "Konsultasi Dokter",
  "Terapi Wicara",
];

class CheckupState {
  final AsyncValue<Queue?> queueValue;
  final AsyncValue<List<InventoryStockConvert>?> searchValue;
  final AsyncValue<String?> checkupValue;
  final AsyncValue<String?> buttonValue;
  final AsyncValue<List<InventoryStockConvert>?> inventoryStockValue;
  final List<InventoryStockConvert>? inventoryStock;
  final List<InventoryStockConvert>? searchData;
  final List<Medicine>? medicine;
  final List<TextEditingController>? medicineController;
  final Queue? queue;
  final String? medicalId;
  final String? actType;
  CheckupState({
    this.searchValue = const AsyncData(null),
    this.queueValue = const AsyncLoading(),
    this.checkupValue = const AsyncLoading(),
    this.buttonValue = const AsyncData(null),
    this.inventoryStockValue = const AsyncLoading(),
    this.inventoryStock,
    this.searchData,
    this.medicine,
    this.medicineController,
    this.queue,
    this.medicalId,
    this.actType = 'Pemberian Obat',
  });

  bool get isLoading => checkupValue.isLoading;

  CheckupState copyWith({
    AsyncValue<Queue?>? queueValue,
    AsyncValue<List<InventoryStockConvert>?>? searchValue,
    AsyncValue<String?>? checkupValue,
    AsyncValue<String?>? buttonValue,
    AsyncValue<List<InventoryStockConvert>?>? inventoryStockValue,
    List<InventoryStockConvert>? inventoryStock,
    List<InventoryStockConvert>? searchData,
    List<Medicine>? medicine,
    List<TextEditingController>? medicineController,
    Queue? queue,
    String? medicalId,
    String? actType,
  }) {
    return CheckupState(
      searchValue: searchValue ?? this.searchValue,
      queueValue: queueValue ?? this.queueValue,
      checkupValue: checkupValue ?? this.checkupValue,
      buttonValue: buttonValue ?? this.buttonValue,
      inventoryStockValue: inventoryStockValue ?? this.inventoryStockValue,
      inventoryStock: inventoryStock ?? this.inventoryStock,
      searchData: searchData ?? this.searchData,
      medicine: medicine ?? this.medicine,
      medicineController: medicineController ?? this.medicineController,
      queue: queue ?? this.queue,
      medicalId: medicalId ?? this.medicalId,
      actType: actType ?? this.actType,
    );
  }
}
