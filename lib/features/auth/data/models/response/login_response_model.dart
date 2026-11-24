import 'dart:convert';

class LoginResponseModel {
  final bool? success;
  final int? code;
  final String? message;
  final Data? data;

  LoginResponseModel({this.success, this.code, this.message, this.data});

  factory LoginResponseModel.fromJson(String str) =>
      LoginResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromMap(Map<String, dynamic> json) =>
      LoginResponseModel(
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
  final String? token;
  final String? tokenType;
  final int? expiresIn;
  final User? user;

  Data({this.token, this.tokenType, this.expiresIn, this.user});

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    token: json["token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
    user: json["user"] == null ? null : User.fromMap(json["user"]),
  );

  Map<String, dynamic> toMap() => {
    "token": token,
    "token_type": tokenType,
    "expires_in": expiresIn,
    "user": user?.toMap(),
  };
}

class User {
  final int? id;
  final String? nama;
  final String? email;
  final String? role;
  final String? status;
  final String? universitas;
  final String? fotoUrl;
  final int? isIdentityUpdated;

  User({
    this.id,
    this.nama,
    this.email,
    this.role,
    this.status,
    this.universitas,
    this.fotoUrl,
    this.isIdentityUpdated,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
    id: json["id"],
    nama: json["nama"],
    email: json["email"],
    role: json["role"],
    status: json["status"],
    universitas: json["universitas"],
    fotoUrl: json["foto_url"],
    isIdentityUpdated: json["is_identity_updated"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "nama": nama,
    "email": email,
    "role": role,
    "status": status,
    "universitas": universitas,
    "foto_url": fotoUrl,
    "is_identity_updated": isIdentityUpdated,
  };
}
