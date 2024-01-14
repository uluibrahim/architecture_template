import 'package:flutter/material.dart';

@immutable
final class LoginResponse {
  final String? userId;
  final String? email;
  final String? name;
  final String? surname;

  const LoginResponse({
    required this.userId,
    required this.email,
    required this.name,
    required this.surname,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        userId: json["userId"],
        email: json["email"],
        name: json["name"],
        surname: json["surname"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "email": email,
        "name": name,
        "surname": surname,
      };
}
