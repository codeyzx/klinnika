import 'package:klinnika/src/features/auth/domain/schedule.dart';
import 'package:klinnika/src/shared/extensions/extensions.dart';

enum RoleUser {
  user('USER'),
  superadmin('SUPERADMIN'),
  doctor('DOCTOR');

  final String value;
  const RoleUser(this.value);
}

class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final RoleUser role;
  final DateTime createdAt;
  final String profileUrl;
  final String clinicId;
  final bool isVerified;
  Schedule? schedule;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.createdAt,
    required this.profileUrl,
    required this.clinicId,
    required this.isVerified,
    this.schedule,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      role: json['role'].toString().roleUser,
      createdAt: json['created_at'].toDate(),
      profileUrl: json['profile_url'] as String,
      clinicId: json['clinic_id'] as String,
      isVerified: json['is_verified'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'role': role.value,
      'created_at': createdAt,
      'profile_url': profileUrl,
      'clinic_id': clinicId,
      'is_verified': isVerified,
    };
  }

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    RoleUser? role,
    DateTime? createdAt,
    String? profileUrl,
    String? clinicId,
    bool? isVerified,
    Schedule? schedule,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      profileUrl: profileUrl ?? this.profileUrl,
      clinicId: clinicId ?? this.clinicId,
      isVerified: isVerified ?? this.isVerified,
      schedule: schedule ?? this.schedule,
    );
  }
}
