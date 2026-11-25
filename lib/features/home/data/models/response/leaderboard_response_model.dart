import 'dart:convert';

class LeaderboardResponseModel {
  final bool? success;
  final int? code;
  final String? message;
  final List<LeaderboardData>? data;

  LeaderboardResponseModel({this.success, this.code, this.message, this.data});

  factory LeaderboardResponseModel.fromJson(String str) =>
      LeaderboardResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LeaderboardResponseModel.fromMap(Map<String, dynamic> json) =>
      LeaderboardResponseModel(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<LeaderboardData>.from(
                json["data"]!.map((x) => LeaderboardData.fromMap(x)),
              ),
      );

  Map<String, dynamic> toMap() => {
    "success": success,
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class LeaderboardData {
  final int? rank;
  final String? nama;
  final String? universitas;
  final String? fotoUrl;
  final int? totalHadir;

  LeaderboardData({
    this.rank,
    this.nama,
    this.universitas,
    this.fotoUrl,
    this.totalHadir,
  });

  factory LeaderboardData.fromJson(String str) =>
      LeaderboardData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LeaderboardData.fromMap(Map<String, dynamic> json) => LeaderboardData(
    rank: json["rank"],
    nama: json["nama"],
    universitas: json["universitas"],
    fotoUrl: json["foto_url"],
    totalHadir: json["total_hadir"],
  );

  Map<String, dynamic> toMap() => {
    "rank": rank,
    "nama": nama,
    "universitas": universitas,
    "foto_url": fotoUrl,
    "total_hadir": totalHadir,
  };
}
