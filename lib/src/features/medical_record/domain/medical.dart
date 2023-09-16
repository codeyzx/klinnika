import 'package:klinnika/src/features/medical_record/domain/medicine.dart';

class Medical {
  final DateTime? createdAt;
  final List<Medicine>? medicals;

  Medical({
    this.createdAt,
    this.medicals,
  });

  factory Medical.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>> medicineJson = json['medicals']?.cast<Map<String, dynamic>>() ?? [];
    List<Medicine> medicine = medicineJson.map((e) => Medicine.fromJson(e)).toList();
    return Medical(
      createdAt: json['created_at']?.toDate(),
      medicals: medicine,
    );
  }

  Map<String, dynamic> toJson() => {
        'created_at': createdAt,
        'medicals': medicals?.map((e) => e.toJson()).toList(),
      };

  Medical copyWith({
    DateTime? createdAt,
    List<Medicine>? medicals,
  }) {
    return Medical(
      createdAt: createdAt ?? this.createdAt,
      medicals: medicals ?? this.medicals,
    );
  }
}
