import 'dart:convert';

class RegisterResponseModel {
  final bool? success;
  final int? code;
  final String? message;
  final Data? data;

  RegisterResponseModel({this.success, this.code, this.message, this.data});

  factory RegisterResponseModel.fromJson(String str) =>
      RegisterResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterResponseModel.fromMap(Map<String, dynamic> json) =>
      RegisterResponseModel(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
    "success": success,
    "code": code,
    "message": message,
    "data": data?.toMap(),
  };
}

class Data {
  final int? userId;
  final String? nama;
  final String? email;

  Data({this.userId, this.nama, this.email});

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) =>
      Data(userId: json["user_id"], nama: json["nama"], email: json["email"]);

  Map<String, dynamic> toMap() => {
    "user_id": userId,
    "nama": nama,
    "email": email,
  };
}
