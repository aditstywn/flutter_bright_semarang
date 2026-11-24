import 'dart:convert';

class RegisterRequestModel {
  final String? nama;
  final String? email;
  final String? password;
  final String? passwordConfirmation;

  RegisterRequestModel({
    this.nama,
    this.email,
    this.password,
    this.passwordConfirmation,
  });

  factory RegisterRequestModel.fromJson(String str) =>
      RegisterRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterRequestModel.fromMap(Map<String, dynamic> json) =>
      RegisterRequestModel(
        nama: json["nama"],
        email: json["email"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
      );

  Map<String, dynamic> toMap() => {
    "nama": nama,
    "email": email,
    "password": password,
    "password_confirmation": passwordConfirmation,
  };
}
