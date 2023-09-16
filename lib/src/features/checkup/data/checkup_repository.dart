import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/history/domain/inventory.dart';
import 'package:klinnika/src/features/history/domain/inventory_stock.dart';
import 'package:klinnika/src/features/history/domain/inventory_stock_convert.dart';
import 'package:klinnika/src/features/patient/domain/patient.dart';
import 'package:klinnika/src/features/queue/domain/queue.dart';
import 'package:klinnika/src/features/medical_record/domain/medical_record.dart';
import 'package:klinnika/src/services/services.dart';

class CheckupRepository {
  final inventoryDb = FirebaseFirestore.instance.collection('inventory').withConverter(
        fromFirestore: (snapshot, _) => Inventory.fromJson(snapshot.data()!),
        toFirestore: (Inventory inventory, _) => inventory.toJson(),
      );

  final inventoryStockDb = FirebaseFirestore.instance.collection('inventory_stock').withConverter(
        fromFirestore: (snapshot, _) => InventoryStock.fromJson(snapshot.data()!),
        toFirestore: (InventoryStock inventoryStock, _) => inventoryStock.toJson(),
      );

  final queueDb = FirebaseFirestore.instance.collection('queue').withConverter(
        fromFirestore: (snapshot, _) => Queue.fromJson(snapshot.data()!),
        toFirestore: (Queue queue, _) => queue.toJson(),
      );

  final medicalRecordDb = FirebaseFirestore.instance.collection('medical_record').withConverter(
        fromFirestore: (snapshot, _) => MedicalRecord.fromJson(snapshot.data()!),
        toFirestore: (MedicalRecord medicalRecord, _) => medicalRecord.toJson(),
      );

  final medicalDb = FirebaseFirestore.instance.collection('medical');

  final patientDb = FirebaseFirestore.instance.collection('patient').withConverter(
        fromFirestore: (snapshot, _) => Patient.fromJson(snapshot.data()!),
        toFirestore: (Patient patient, _) => patient.toJson(),
      );

  Future<Inventory> getInventory(String inventoryId) async {
    try {
      final data = await inventoryDb.doc(inventoryId).get();
      final inventory = data.data()!;
      return inventory;
    } catch (e) {
      throw NetworkExceptions.getFirebaseException(e);
    }
  }

  Future<List<InventoryStockConvert>> getInventoryStockConvert(List<InventoryStock> inventoryStockList) async {
    try {
      List<InventoryStockConvert> result = [];

      for (var inventoryStock in inventoryStockList) {
        Inventory inventory = await getInventory(inventoryStock.inventoryId.toString());
        if (inventory.type == "medicines") result.add(InventoryStockConvert.fromInventoryStock(inventoryStock, inventory));
      }

      return result;
    } catch (e) {
      throw NetworkExceptions.getFirebaseException(e);
    }
  }

  Future<Result<List<InventoryStockConvert>>> getInventoryStock(String clinicId) async {
    try {
      final result = await inventoryStockDb
          .where('clinic_id', isEqualTo: clinicId)
          .where('expired_at', isGreaterThanOrEqualTo: DateTime.now())
          .get();

      final data = result.docs.map((e) => {"id": e.id, "data": e.data()}).toList();
      List<InventoryStock> inventoryStockList = [];
      data.map((e) => inventoryStockList.add(InventoryStock.fromMap(e))).toList();
      final dataConvert = await getInventoryStockConvert(inventoryStockList);
      return Result.success(dataConvert);
      // final data = result.docs.map((e) => e.data()).toList();
      // final dataConvert = await getInventoryStockConvert(data);
      // return Result.success(dataConvert);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }

  Future<Result<String?>> addQueue(Queue queue) async {
    try {
      final ref = queueDb.doc();
      final temp = queue.copyWith(id: ref.id);
      await ref.set(temp);
      return const Result.success('Success');
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }

  Future<Result<String?>> addPatient(Patient patient) async {
    try {
      final ref = patientDb.doc();
      final temp = patient.copyWith(id: ref.id);
      await ref.set(temp);
      return const Result.success('Success');
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }

  Future<Result<String?>> updateQueue(String queueId) async {
    try {
      final ref = queueDb.doc(queueId);
      await ref.update({'finish_at': DateTime.now()});
      return const Result.success('Success');
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }

  Future<Result<String?>> addMedicalRecord(MedicalRecord medicalRecord) async {
    try {
      final ref = medicalRecordDb.doc();
      final temp = medicalRecord.copyWith(id: ref.id);
      await ref.set(temp);
      return const Result.success('Success');
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }

  Future<Result<String?>> addMedical(Map<String, dynamic> medical) async {
    try {
      final ref = medicalDb.doc();
      await ref.set(medical);
      return Result.success(ref.id);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }
}

final checkupRepositoryProvider = Provider<CheckupRepository>((ref) {
  // return CheckupRepository(ref.read(dioClientProvider));
  return CheckupRepository();
});
