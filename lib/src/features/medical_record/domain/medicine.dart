class Medicine {
  String? id;
  String? inventoryId;
  dynamic expiredAt;
  String? name;
  String? desc;
  int? quantity;
  int? amount;

  Medicine({
    this.id,
    this.inventoryId,
    this.expiredAt,
    this.name,
    this.desc,
    this.quantity,
    this.amount,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      id: json['id'] ?? '',
      inventoryId: json['inventory_id'] ?? '',
      expiredAt: json['expired_at'],
      name: json['name'] ?? '',
      desc: json['desc'] ?? '',
      quantity: json['quantity'] ?? 0,
      amount: json['amount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'inventory_id': inventoryId,
        'expired_at': expiredAt,
        'name': name,
        'desc': desc,
        'quantity': quantity,
        'amount': amount,
      };

  Medicine copyWith({
    String? id,
    String? inventoryId,
    dynamic expiredAt,
    String? name,
    String? desc,
    int? quantity,
    int? amount,
  }) {
    return Medicine(
      id: id ?? this.id,
      inventoryId: inventoryId ?? this.inventoryId,
      expiredAt: expiredAt ?? this.expiredAt,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      quantity: quantity ?? this.quantity,
      amount: amount ?? this.amount,
    );
  }
}
