class Medical {
  final String? id;
  final List<String>? medicals;

  Medical({
    this.id,
    this.medicals,
  });

  factory Medical.fromMap(Map<String, dynamic> map) {
    return Medical(
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

  factory Medical.fromJson(Map<String, dynamic> json) {
    return Medical(
      id: json['id'] ?? '',
      medicals: List<String>.from(json['medicals'] ?? []),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'medicals': medicals,
      };

  Medical copyWith({
    String? id,
    List<String>? medicals,
  }) {
    return Medical(
      id: id ?? this.id,
      medicals: medicals ?? this.medicals,
    );
  }
}
