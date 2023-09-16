import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/history/domain/inventory_stock_convert.dart';
import 'package:klinnika/src/features/inventory/application/inventory_service.dart';
import 'package:klinnika/src/features/inventory/presentation/inventory_state.dart';

class InventoryController extends StateNotifier<InventoryState> {
  final InventoryService _inventoryService;

  InventoryController(this._inventoryService) : super(const InventoryState());

  final searchController = TextEditingController();

  void getInventory(String clinicId) async {
    state = state.copyWith(
      inventoryStockValue: const AsyncLoading(),
    );

    final result = await _inventoryService.getInventoryStock(clinicId);

    result.when(
      success: (data) {
        state = state.copyWith(
          inventoryStock: data,
          searchData: data,
          inventoryStockValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          inventoryStockValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  void getListInventory(String inventoryId) async {
    state = state.copyWith(
      inventoryListValue: const AsyncLoading(),
    );

    final result = await _inventoryService.getInventoryList(inventoryId);

    result.when(
      success: (data) {
        state = state.copyWith(
          inventoryList: data,
          inventoryListValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          inventoryListValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  void searchData(String query) {
    if (query.isEmpty) {
      state = state.copyWith(
        searchData: state.inventoryStock ?? [],
        searchValue: AsyncData(state.inventoryStock ?? []),
      );
    }
    state = state.copyWith(
      searchValue: const AsyncLoading(),
    );
    List<InventoryStockConvert> inventory = state.inventoryStock ?? [];
    final result =
        inventory.where((element) => element.inventory!.name!.toLowerCase().contains(query.toLowerCase())).toList();
    state = state.copyWith(
      searchData: result,
      searchValue: AsyncData(result),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}

final inventoryControllerProvider = StateNotifierProvider.autoDispose<InventoryController, InventoryState>((ref) {
  final inventoryService = ref.read(inventoryServiceProvider);
  return InventoryController(inventoryService);
});
