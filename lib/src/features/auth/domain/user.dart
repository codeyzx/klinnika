// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:klinnika/src/features/auth/data/responses/responses.dart';

class User {
  final String id;
  final String email;
  final String name;

  User({
    required this.id,
    required this.email,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'name': name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
    );
  }

  factory User.fromResponse(UserResponse response) {
    return User(
      id: response.id ?? '',
      email: response.email ?? '',
      name: response.fullname ?? '',
    );
  }
}
