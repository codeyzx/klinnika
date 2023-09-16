import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/features/auth/domain/user.dart';
import 'package:klinnika/src/features/checkup/presentation/checkup_state.dart';
import 'package:klinnika/src/features/checkup/application/checkup_service.dart';
import 'package:klinnika/src/features/history/domain/inventory_stock_convert.dart';
import 'package:klinnika/src/features/medical_record/domain/medical_record.dart';
import 'package:klinnika/src/features/medical_record/domain/medicine.dart';
import 'package:klinnika/src/features/medical_record/domain/medicine_request.dart';
import 'package:klinnika/src/features/patient/domain/patient.dart';
import 'package:klinnika/src/features/queue/domain/queue.dart';
import 'package:klinnika/src/features/queue/domain/queue_convert.dart';

class CheckupController extends StateNotifier<CheckupState> {
  final CheckupService _checkupService;
  CheckupController(this._checkupService) : super(CheckupState());

  final diagnosaController = TextEditingController();
  final searchController = TextEditingController();

  Future<void> getInventoryStock(String clinicId) async {
    state = state.copyWith(
      inventoryStockValue: const AsyncLoading(),
    );

    final result = await _checkupService.getInventoryStock(clinicId);

    result.when(
      success: (data) {
        state = state.copyWith(
          inventoryStockValue: AsyncData(data),
          inventoryStock: data,
          searchData: data,
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          inventoryStockValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  Future<void> addQueue(String doctorId) async {
    state = state.copyWith(
      checkupValue: const AsyncLoading(),
    );

    // final requestQueue = Queue(
    //     id: '',
    //     userId: doctorId,
    //     doctorId: doctorId,
    //     appointmentDate: DateTime.now(),
    //     createdAt: DateTime.now(),
    //     finishAt: DateTime.now(),
    //     polyId: '21312',
    //     complaintType: 'General Checkup',
    //     complaintDesc: 'Patient experiencing mild fever and headach',
    //     clinicId: '12312',
    //     type: 'Scheduled');

    final requestQueue = Queue(
      id: 'queue_id_5',
      patientId: 'ONVBjSU9xlsnHbSuw8pP',
      doctorId: doctorId,
      appointmentDate: DateTime.now().add(const Duration(days: 1)),
      createdAt: DateTime.now(),
      polyId: '21312',
      complaintType: ['Nyeri Punggung', 'Demam', 'Pusing'],
      complaintDesc:
          'Patient is experiencing intense lower back pain, high fever, and severe headaches. These symptoms have persisted for the past five days and are causing significant discomfort.',
      clinicId: '12312',
      type: 'Dalam Proses',
    );

    final result = await _checkupService.addQueue(requestQueue);

    result.when(
      success: (data) {
        state = state.copyWith(
          checkupValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          checkupValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  Future<void> addPatient() async {
    state = state.copyWith(
      checkupValue: const AsyncLoading(),
    );

    // final requestPatient = Patient(
    //   name: 'Ahmad Joni',
    //   birthDate: DateTime.now(),
    //   email: 'ahmadjoni@gmail.com',
    //   gender: 'Laki-laki',
    //   phone: '081234567890',
    // );

    final requestPatient = Patient(
      name: 'Sophia Lee',
      birthDate: DateTime(1988, 04, 25),
      email: 'sophia.lee@example.com',
      gender: 'Perempuan',
      phone: '08122345678',
    );

    final result = await _checkupService.addPatient(requestPatient);

    result.when(
      success: (data) {
        state = state.copyWith(
          checkupValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          checkupValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  Future<void> addMedicalRecord({required QueueConvert queue, required User user, required String medicalId}) async {
    state = state.copyWith(
      checkupValue: const AsyncLoading(),
    );

    final medicalRecord = MedicalRecord(
      actType: state.actType,
      diagnose: diagnosaController.text,
      createdAt: DateTime.now(),
      docId: user.id,
      clinicId: user.clinicId,
      patientId: queue.patient?.id.toString(),
      queueId: queue.id.toString(),
      medicalId: state.medicalId,
    );

    final result = await _checkupService.addMedicalRecord(medicalRecord);

    result.when(
      success: (data) {
        state = state.copyWith(
          checkupValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          checkupValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  Future<String?> addMedical() async {
    state = state.copyWith(
      checkupValue: const AsyncLoading(),
    );

    final medicals = state.medicine?.map((e) => MedicineRequest.fromJson(e.toJson()).toJson()).toList();

    final requestMedical = {
      "createdAt": DateTime.now(),
      "medicals": medicals,
    };

    final result = await _checkupService.addMedical(requestMedical);

    return result.when(
      success: (data) {
        state = state.copyWith(
          checkupValue: AsyncData(data),
          medicalId: data,
        );
        return data;
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          checkupValue: AsyncError(error, stackTrace),
        );
        return null;
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
    List<InventoryStockConvert> medicine = state.inventoryStock ?? [];
    final result =
        medicine.where((element) => element.inventory!.name!.toLowerCase().contains(query.toLowerCase())).toList();
    state = state.copyWith(
      searchData: result,
      searchValue: AsyncData(result),
    );
  }

  void addMedicine(Medicine medicine) {
    state = state.copyWith(
      medicine: [...state.medicine ?? [], medicine],
      medicineController: [...state.medicineController ?? [], TextEditingController()],
    );
  }

  void removeMedicine(int index) {
    final medicine = state.medicine;
    final medicineController = state.medicineController;

    if (medicine != null && medicineController != null) {
      final newMedicine = medicine.asMap().entries.map((e) {
        final key = e.key;
        final value = e.value;

        if (key == index) {
          return null;
        }

        return value;
      }).toList();

      final newMedicineController = medicineController.asMap().entries.map((e) {
        final key = e.key;
        final value = e.value;

        if (key == index) {
          return null;
        }

        return value;
      }).toList();

      state = state.copyWith(
        medicine: newMedicine.where((element) => element != null).toList().cast<Medicine>(),
        medicineController: newMedicineController.where((element) => element != null).toList().cast<TextEditingController>(),
      );
    }
  }

  void setActType(String? actType) {
    state = state.copyWith(
      actType: actType,
    );
  }

  void addQty(int index) {
    final medicine = state.medicine;
    final newMedicine = medicine?.asMap().entries.map((e) {
      final key = e.key;
      final value = e.value;

      if (key == index) {
        return value.copyWith(
          quantity: (value.quantity ?? 0) + 1,
        );
      }

      return value;
    }).toList();

    state = state.copyWith(
      medicine: newMedicine,
    );
  }

  void removeQty(int index) {
    final medicine = state.medicine;
    final newMedicine = medicine?.asMap().entries.map((e) {
      final key = e.key;
      final value = e.value;

      if (key == index) {
        return value.copyWith(
          quantity: value.quantity == 1 ? 1 : (value.quantity ?? 0) - 1,
        );
      }

      return value;
    }).toList();

    state = state.copyWith(
      medicine: newMedicine,
    );
  }

  void setMedicine() {
    state = state.copyWith(
      buttonValue: const AsyncLoading(),
    );
    final medicine = state.medicine;
    final medicineController = state.medicineController;

    if (medicine != null && medicineController != null) {
      final newMedicine = medicine.asMap().entries.map((e) {
        final index = e.key;
        final value = e.value;
        final controller = medicineController[index];

        return value.copyWith(
          desc: controller.text,
        );
      }).toList();

      state = state.copyWith(
        medicine: newMedicine,
      );
    }
  }

  @override
  void dispose() {
    diagnosaController.dispose();
    searchController.dispose();
    state.medicineController?.forEach((element) {
      element.dispose();
    });
    super.dispose();
  }
}

final checkupControllerProvider = StateNotifierProvider.autoDispose<CheckupController, CheckupState>((ref) {
  final checkupService = ref.read(checkupServiceProvider);
  return CheckupController(checkupService);
});
