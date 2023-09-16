import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/history/domain/inventory_stock.dart';
import 'package:klinnika/src/features/inventory/data/inventory_repository.dart';
import 'package:klinnika/src/features/history/domain/inventory_stock_convert.dart';
import 'package:klinnika/src/services/services.dart';

class InventoryService {
  final InventoryRepository _inventoryRepository;

  InventoryService(
    this._inventoryRepository,
  );

  Future<Result<List<InventoryStockConvert>>> getInventoryStock(String clinicId) async {
    final result = await _inventoryRepository.getInventoryStock(clinicId);
    return result;
  }

  Future<Result<List<InventoryStock>>> getInventoryList(String inventoryId) async {
    final result = await _inventoryRepository.getInventoryList(inventoryId);
    return result;
  }
}

final inventoryServiceProvider = Provider<InventoryService>((ref) {
  final inventoryRepository = ref.read(inventoryRepositoryProvider);

  return InventoryService(inventoryRepository);
});
