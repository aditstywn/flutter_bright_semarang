import 'dart:convert';

class PresenceHistoryResponseModel {
  final bool? success;
  final int? code;
  final String? message;
  final Data? data;

  PresenceHistoryResponseModel({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  factory PresenceHistoryResponseModel.fromJson(String str) =>
      PresenceHistoryResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PresenceHistoryResponseModel.fromMap(Map<String, dynamic> json) =>
      PresenceHistoryResponseModel(
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
  final int? currentPage;
  final int? totalPages;
  final int? totalRecords;
  final List<RecordHistory>? records;

  Data({this.currentPage, this.totalPages, this.totalRecords, this.records});

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    totalPages: json["total_pages"],
    totalRecords: json["total_records"],
    records: json["records"] == null
        ? []
        : List<RecordHistory>.from(
            json["records"]!.map((x) => RecordHistory.fromMap(x)),
          ),
  );

  Map<String, dynamic> toMap() => {
    "current_page": currentPage,
    "total_pages": totalPages,
    "total_records": totalRecords,
    "records": records == null
        ? []
        : List<dynamic>.from(records!.map((x) => x.toMap())),
  };
}

class RecordHistory {
  final int? id;
  final DateTime? date;
  final String? waktuAbsen;
  final String? waktuPulang;
  final String? status;
  final String? statusPulang;
  final String? keterangan;
  final String? fotoMasukUrl;
  final String? fotoPulangUrl;

  RecordHistory({
    this.id,
    this.date,
    this.waktuAbsen,
    this.waktuPulang,
    this.status,
    this.statusPulang,
    this.keterangan,
    this.fotoMasukUrl,
    this.fotoPulangUrl,
  });

  factory RecordHistory.fromJson(String str) =>
      RecordHistory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RecordHistory.fromMap(Map<String, dynamic> json) => RecordHistory(
    id: json["id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    waktuAbsen: json["waktu_absen"],
    waktuPulang: json["waktu_pulang"],
    status: json["status"],
    statusPulang: json["status_pulang"],
    keterangan: json["keterangan"],
    fotoMasukUrl: json["foto_masuk_url"],
    fotoPulangUrl: json["foto_pulang_url"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "date": date == null
        ? null
        : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "waktu_absen": waktuAbsen,
    "waktu_pulang": waktuPulang,
    "status": status,
    "status_pulang": statusPulang,
    "keterangan": keterangan,
    "foto_masuk_url": fotoMasukUrl,
    "foto_pulang_url": fotoPulangUrl,
  };
}
