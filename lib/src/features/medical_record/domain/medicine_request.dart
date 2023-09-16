class MedicineRequest {
  String? id;
  String? inventoryId;
  dynamic expiredAt;
  String? name;
  String? desc;
  int? quantity;

  MedicineRequest({
    this.id,
    this.inventoryId,
    this.expiredAt,
    this.name,
    this.desc,
    this.quantity,
  });

  factory MedicineRequest.fromJson(Map<String, dynamic> json) {
    return MedicineRequest(
      id: json['id'] ?? '',
      inventoryId: json['inventory_id'] ?? '',
      expiredAt: json['expired_at'],
      name: json['name'] ?? '',
      desc: json['desc'] ?? '',
      quantity: json['quantity'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'inventory_id': inventoryId,
        'expired_at': expiredAt,
        'name': name,
        'desc': desc,
        'quantity': quantity,
      };

  MedicineRequest copyWith({
    String? id,
    String? inventoryId,
    dynamic expiredAt,
    String? name,
    String? desc,
    int? quantity,
  }) {
    return MedicineRequest(
      id: id ?? this.id,
      inventoryId: inventoryId ?? this.inventoryId,
      expiredAt: expiredAt ?? this.expiredAt,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      quantity: quantity ?? this.quantity,
    );
  }
}
