class InventoryStock {
  int? amount;
  String? clinicId;
  DateTime? createdAt;
  String? desc;
  String? id;
  DateTime? expiredAt;
  String? inventoryId;

  InventoryStock({
    this.amount,
    this.clinicId,
    this.createdAt,
    this.desc,
    this.id,
    this.expiredAt,
    this.inventoryId,
  });

  factory InventoryStock.fromMap(Map<String, dynamic> map) {
    InventoryStock inventoryStock = map['data'];
    return InventoryStock(
      id: map['id'] ?? '',
      amount: inventoryStock.amount,
      clinicId: inventoryStock.clinicId,
      createdAt: inventoryStock.createdAt,
      desc: inventoryStock.desc,
      expiredAt: inventoryStock.expiredAt,
      inventoryId: inventoryStock.inventoryId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'amount': amount,
      'clinicId': clinicId,
      'createdAt': createdAt,
      'desc': desc,
      'id': id,
      'expiredAt': expiredAt,
      'inventoryId': inventoryId,
    };
  }

  factory InventoryStock.fromJson(Map<String, dynamic> json) {
    return InventoryStock(
      amount: json['amount'] ?? '',
      clinicId: json['clinic_id'] ?? '',
      createdAt: json['created_at']?.toDate(),
      desc: json['desc'] ?? '',
      id: json['id'] ?? '',
      expiredAt: json['expired_at']?.toDate(),
      inventoryId: json['inventory_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'clinic_id': clinicId,
        'created_at': createdAt,
        'desc': desc,
        'id': id,
        'expired_at': expiredAt,
        'inventory_id': inventoryId,
      };

  InventoryStock copyWith({
    int? amount,
    String? clinicId,
    DateTime? createdAt,
    String? desc,
    String? id,
    DateTime? expiredAt,
    String? inventoryId,
  }) {
    return InventoryStock(
      amount: amount ?? this.amount,
      clinicId: clinicId ?? this.clinicId,
      createdAt: createdAt ?? this.createdAt,
      desc: desc ?? this.desc,
      id: id ?? this.id,
      expiredAt: expiredAt ?? this.expiredAt,
      inventoryId: inventoryId ?? this.inventoryId,
    );
  }
}
