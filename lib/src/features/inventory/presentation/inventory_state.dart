import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/history/domain/inventory_stock.dart';
import 'package:klinnika/src/features/history/domain/inventory_stock_convert.dart';

class InventoryState {
  final AsyncValue<List<InventoryStockConvert>?> inventoryStockValue;
  final AsyncValue<List<InventoryStock>?> inventoryListValue;
  final AsyncValue<List<InventoryStockConvert>?> searchValue;
  final List<InventoryStockConvert>? inventoryStock;
  final List<InventoryStock>? inventoryList;
  final List<InventoryStockConvert>? searchData;

  const InventoryState({
    this.inventoryStockValue = const AsyncLoading(),
    this.inventoryListValue = const AsyncLoading(),
    this.searchValue = const AsyncLoading(),
    this.inventoryStock,
    this.inventoryList,
    this.searchData,
  });

  InventoryState copyWith({
    AsyncValue<List<InventoryStockConvert>?>? inventoryStockValue,
    AsyncValue<List<InventoryStock>?>? inventoryListValue,
    AsyncValue<List<InventoryStockConvert>?>? searchValue,
    List<InventoryStockConvert>? inventoryStock,
    List<InventoryStock>? inventoryList,
    List<InventoryStockConvert>? searchData,
  }) {
    return InventoryState(
      inventoryStockValue: inventoryStockValue ?? this.inventoryStockValue,
      inventoryListValue: inventoryListValue ?? this.inventoryListValue,
      searchValue: searchValue ?? this.searchValue,
      inventoryStock: inventoryStock ?? this.inventoryStock,
      inventoryList: inventoryList ?? this.inventoryList,
      searchData: searchData ?? this.searchData,
    );
  }
}
