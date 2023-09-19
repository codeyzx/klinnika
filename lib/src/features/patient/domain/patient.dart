class Patient {
  final String? id;
  final String? name;
  final String? gender;
  final DateTime? birthDate;
  final String? email;
  final String? phone;

  Patient({
    this.id,
    this.name,
    this.gender,
    this.birthDate,
    this.email,
    this.phone,
  });

  factory Patient.fromPatient(Patient patient, String patientId) {
    return Patient(
      id: patientId,
      birthDate: patient.birthDate,
      email: patient.email,
      gender: patient.gender,
      name: patient.name,
      phone: patient.phone,
    );
  }

  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      id: map['id'] as String,
      name: map['name'] as String,
      gender: map['gender'] as String,
      birthDate: map['birth_date'].toDate(),
      email: map['email'] as String,
      phone: map['phone'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'gender': gender,
      'birth_date': birthDate,
      'email': email,
      'phone': phone,
    };
  }

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      gender: json['gender'] ?? '',
      birthDate: json['birth_date']?.toDate(),
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'gender': gender,
        'birth_date': birthDate,
        'email': email,
        'phone': phone,
      };

  Patient copyWith({
    String? id,
    String? name,
    String? gender,
    DateTime? birthDate,
    String? email,
    String? phone,
  }) {
    return Patient(
      id: id ?? this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }
}
