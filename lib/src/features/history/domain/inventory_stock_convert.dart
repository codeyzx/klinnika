import 'package:klinnika/src/features/history/domain/inventory.dart';
import 'package:klinnika/src/features/history/domain/inventory_stock.dart';

class InventoryStockConvert {
  int? amount;
  String? clinicId;
  DateTime? createdAt;
  String? id;
  String? inventoryId;
  DateTime? expiredAt;
  Inventory? inventory;

  factory InventoryStockConvert.fromInventoryStock(InventoryStock inventoryStock, Inventory inventory) {
    return InventoryStockConvert(
      amount: inventoryStock.amount,
      clinicId: inventoryStock.clinicId,
      createdAt: inventoryStock.createdAt,
      id: inventoryStock.id,
      inventoryId: inventoryStock.inventoryId,
      expiredAt: inventoryStock.expiredAt,
      inventory: inventory,
    );
  }

  InventoryStockConvert({
    this.amount,
    this.clinicId,
    this.createdAt,
    this.id,
    this.inventoryId,
    this.expiredAt,
    this.inventory,
  });

  InventoryStockConvert copyWith({
    int? amount,
    String? clinicId,
    DateTime? createdAt,
    String? id,
    String? inventoryId,
    DateTime? expiredAt,
    Inventory? inventory,
  }) {
    return InventoryStockConvert(
      amount: amount ?? this.amount,
      clinicId: clinicId ?? this.clinicId,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      inventoryId: inventoryId ?? this.inventoryId,
      expiredAt: expiredAt ?? this.expiredAt,
      inventory: inventory ?? this.inventory,
    );
  }
}
