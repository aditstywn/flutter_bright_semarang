import 'dart:convert';

class CreateLeavesResponseModel {
  final bool? success;
  final int? code;
  final String? message;
  final Data? data;

  CreateLeavesResponseModel({this.success, this.code, this.message, this.data});

  factory CreateLeavesResponseModel.fromJson(String str) =>
      CreateLeavesResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateLeavesResponseModel.fromMap(Map<String, dynamic> json) =>
      CreateLeavesResponseModel(
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
  final int? leaveId;
  final String? status;

  Data({this.leaveId, this.status});

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) =>
      Data(leaveId: json["leave_id"], status: json["status"]);

  Map<String, dynamic> toMap() => {"leave_id": leaveId, "status": status};
}
