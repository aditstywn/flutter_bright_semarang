import 'dart:convert';

class LeavesResponseModel {
  final bool? success;
  final int? code;
  final String? message;
  final List<Datum>? data;

  LeavesResponseModel({this.success, this.code, this.message, this.data});

  factory LeavesResponseModel.fromJson(String str) =>
      LeavesResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LeavesResponseModel.fromMap(Map<String, dynamic> json) =>
      LeavesResponseModel(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
    "success": success,
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class Datum {
  final int? id;
  final String? jenis;
  final DateTime? tanggalMulai;
  final DateTime? tanggalSelesai;
  final String? alasan;
  final String? buktiFotoUrl;
  final String? status;
  final String? catatanAdmin;
  final String? createdAt;

  Datum({
    this.id,
    this.jenis,
    this.tanggalMulai,
    this.tanggalSelesai,
    this.alasan,
    this.buktiFotoUrl,
    this.status,
    this.catatanAdmin,
    this.createdAt,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    jenis: json["jenis"],
    tanggalMulai: json["tanggal_mulai"] == null
        ? null
        : DateTime.parse(json["tanggal_mulai"]),
    tanggalSelesai: json["tanggal_selesai"] == null
        ? null
        : DateTime.parse(json["tanggal_selesai"]),
    alasan: json["alasan"],
    buktiFotoUrl: json["bukti_foto_url"],
    status: json["status"],
    catatanAdmin: json["catatan_admin"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "jenis": jenis,
    "tanggal_mulai": tanggalMulai == null
        ? null
        : "${tanggalMulai!.year.toString().padLeft(4, '0')}-${tanggalMulai!.month.toString().padLeft(2, '0')}-${tanggalMulai!.day.toString().padLeft(2, '0')}",
    "tanggal_selesai": tanggalSelesai == null
        ? null
        : "${tanggalSelesai!.year.toString().padLeft(4, '0')}-${tanggalSelesai!.month.toString().padLeft(2, '0')}-${tanggalSelesai!.day.toString().padLeft(2, '0')}",
    "alasan": alasan,
    "bukti_foto_url": buktiFotoUrl,
    "status": status,
    "catatan_admin": catatanAdmin,
    "created_at": createdAt,
  };
}
