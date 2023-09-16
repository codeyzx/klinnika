import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/history/domain/inventory.dart';
import 'package:klinnika/src/features/history/domain/inventory_stock.dart';
import 'package:klinnika/src/features/history/domain/inventory_stock_convert.dart';
import 'package:klinnika/src/features/patient/domain/patient.dart';
import 'package:klinnika/src/features/queue/domain/queue.dart';
import 'package:klinnika/src/features/medical_record/domain/medical_record.dart';
import 'package:klinnika/src/services/services.dart';

class InventoryRepository {
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

  Future<Result<List<InventoryStock>>> getInventoryList(String inventoryId) async {
    try {
      final result = await inventoryStockDb.where('inventory_id', isEqualTo: inventoryId).get();
      final data = result.docs.map((e) => {"id": e.id, "data": e.data()}).toList();
      List<InventoryStock> inventoryList = [];
      data.map((e) => inventoryList.add(InventoryStock.fromMap(e))).toList();
      return Result.success(inventoryList);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }

  Future<List<InventoryStockConvert>> getInventoryStockConvert(List<InventoryStock> inventoryStockList) async {
    try {
      List<InventoryStockConvert> result = [];

      for (var inventoryStock in inventoryStockList) {
        Inventory inventory = await getInventory(inventoryStock.inventoryId.toString());
        if (inventory.type == "medicines" &&
            inventoryStock.expiredAt != null &&
            inventoryStock.expiredAt!.isBefore(DateTime.now())) {
        } else {
          result.add(InventoryStockConvert.fromInventoryStock(inventoryStock, inventory));
        }
      }

      List<InventoryStockConvert> inventoryStockConvert = [];
      for (var inventory in result) {
        if (inventoryStockConvert.isEmpty) {
          inventoryStockConvert.add(inventory);
        } else {
          bool isExist = false;
          for (var inventoryConvert in inventoryStockConvert) {
            if (inventory.inventory!.name == inventoryConvert.inventory!.name) {
              isExist = true;
            }
          }
          if (!isExist) {
            inventoryStockConvert.add(inventory);
          }
        }
      }

      return inventoryStockConvert;
    } catch (e) {
      throw NetworkExceptions.getFirebaseException(e);
    }
  }

  Future<Result<List<InventoryStockConvert>>> getInventoryStock(String clinicId) async {
    try {
      final result = await inventoryStockDb.where('clinic_id', isEqualTo: clinicId).get();
      final data = result.docs.map((e) => {"id": e.id, "data": e.data()}).toList();
      List<InventoryStock> inventoryStockList = [];
      data.map((e) => inventoryStockList.add(InventoryStock.fromMap(e))).toList();
      final dataConvert = await getInventoryStockConvert(inventoryStockList);
      return Result.success(dataConvert);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }
}

final inventoryRepositoryProvider = Provider<InventoryRepository>((ref) {
  return InventoryRepository();
});
