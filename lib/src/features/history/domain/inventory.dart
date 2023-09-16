class Inventory {
  String? clinicId;
  DateTime? createdAt;
  String? name;
  String? desc;
  String? type;
  String? unitType;
  int? min;
  int? price;

  Inventory({
    this.clinicId,
    this.createdAt,
    this.name,
    this.desc,
    this.type,
    this.unitType,
    this.min,
    this.price,
  });

  factory Inventory.fromMap(Map<String, dynamic> map) {
    return Inventory(
      clinicId: map['clinic_id'] as String,
      createdAt: map['created_at'].toDate(),
      name: map['name'] as String,
      desc: map['desc'] as String,
      type: map['type'] as String,
      unitType: map['unit_type'] as String,
      min: map['min'] as int,
      price: map['price'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'clinic_id': clinicId,
      'created_at': createdAt,
      'name': name,
      'desc': desc,
      'type': type,
      'unit_type': unitType,
      'min': min,
      'price': price,
    };
  }

  factory Inventory.fromJson(Map<String, dynamic> json) {
    return Inventory(
      clinicId: json['clinic_id'] ?? '',
      createdAt: json['created_at']?.toDate(),
      name: json['name'] ?? '',
      desc: json['desc'] ?? '',
      type: json['type'] ?? '',
      unitType: json['unit_type'] ?? '',
      min: json['min'] ?? '',
      price: json['price'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'clinic_id': clinicId,
        'created_at': createdAt,
        'name': name,
        'desc': desc,
        'type': type,
        'unit_type': unitType,
        'min': min,
        'price': price,
      };

  Inventory copyWith({
    String? clinicId,
    DateTime? createdAt,
    String? name,
    String? desc,
    String? type,
    String? unitType,
    int? min,
    int? price,
  }) {
    return Inventory(
      clinicId: clinicId ?? this.clinicId,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      type: type ?? this.type,
      unitType: unitType ?? this.unitType,
      min: min ?? this.min,
      price: price ?? this.price,
    );
  }
}
