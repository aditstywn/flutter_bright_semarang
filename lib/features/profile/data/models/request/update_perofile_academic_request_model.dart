import 'dart:convert';

class UpdateProfileAcademicRequestModel {
  final String? universitas;
  final String? fakultas;
  final String? prodi;
  final String? nim;
  final String? jenjang;
  final int? semester;

  UpdateProfileAcademicRequestModel({
    this.universitas,
    this.fakultas,
    this.prodi,
    this.nim,
    this.jenjang,
    this.semester,
  });

  factory UpdateProfileAcademicRequestModel.fromJson(String str) =>
      UpdateProfileAcademicRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdateProfileAcademicRequestModel.fromMap(
    Map<String, dynamic> json,
  ) => UpdateProfileAcademicRequestModel(
    universitas: json["universitas"],
    fakultas: json["fakultas"],
    prodi: json["prodi"],
    nim: json["nim"],
    jenjang: json["jenjang"],
    semester: json["semester"],
  );

  Map<String, dynamic> toMap() => {
    "universitas": universitas,
    "fakultas": fakultas,
    "prodi": prodi,
    "nim": nim,
    "jenjang": jenjang,
    "semester": semester,
  };
}
