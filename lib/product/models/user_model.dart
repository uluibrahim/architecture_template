import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    this.identityNumber,
    this.name,
    this.surname,
    this.email,
    this.phoneNumber,
  });

  final String? identityNumber;
  final String? name;
  final String? surname;
  final String? email;
  final String? phoneNumber;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        identityNumber: json['identity_number'] as String,
        name: json['name'] as String,
        surname: json['surname'] as String,
        email: json['email'] as String,
        phoneNumber: json['phone_number'] as String,
      );

  Map<String, dynamic> toJson() => {
        'identity_number': identityNumber,
        'name': name,
        'surname': surname,
        'email': email,
        'phone_number': phoneNumber,
      };

  @override
  List<Object?> get props => [
        identityNumber,
        name,
        surname,
        email,
        phoneNumber,
      ];
}
