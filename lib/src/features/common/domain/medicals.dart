class Medicals {
  final String? id;
  final List<String>? medicals;

  Medicals({
    this.id,
    this.medicals,
  });

  factory Medicals.fromMap(Map<String, dynamic> map) {
    return Medicals(
      id: map['id'] as String,
      medicals: List<String>.from(map['medicals']),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'medicals': medicals,
    };
  }

  factory Medicals.fromJson(Map<String, dynamic> json) {
    return Medicals(
      id: json['id'] ?? '',
      medicals: List<String>.from(json['medicals'] ?? []),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'medicals': medicals,
      };

  Medicals copyWith({
    String? id,
    List<String>? medicals,
  }) {
    return Medicals(
      id: id ?? this.id,
      medicals: medicals ?? this.medicals,
    );
  }
}
