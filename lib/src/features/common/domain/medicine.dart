class Medicine {
  String? name;
  String? note;
  int? qty;
  int? amount;

  Medicine({
    this.name,
    this.note,
    this.qty,
    this.amount,
  });

  factory Medicine.fromMap(Map<String, dynamic> map) {
    return Medicine(
      name: map['name'] as String,
      note: map['note'] as String,
      qty: map['qty'] as int,
      amount: map['amount'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'note': note,
      'qty': qty,
      'amount': amount,
    };
  }

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      name: json['name'] ?? '',
      note: json['note'] ?? '',
      qty: json['qty'] ?? '',
      amount: json['amount'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'note': note,
        'qty': qty,
        'amount': amount,
      };

  Medicine copyWith({
    String? name,
    String? note,
    int? qty,
    int? amount,
  }) {
    return Medicine(
      name: name ?? this.name,
      note: note ?? this.note,
      qty: qty ?? this.qty,
      amount: amount ?? this.amount,
    );
  }
}
