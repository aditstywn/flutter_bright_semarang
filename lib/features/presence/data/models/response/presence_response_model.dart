import 'dart:convert';

class PresenceResponseModel {
  final bool? success;
  final int? code;
  final String? message;

  PresenceResponseModel({this.success, this.code, this.message});

  factory PresenceResponseModel.fromJson(String str) =>
      PresenceResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PresenceResponseModel.fromMap(Map<String, dynamic> json) =>
      PresenceResponseModel(
        success: json["success"],
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
    "success": success,
    "code": code,
    "message": message,
  };
}
