import 'dart:convert';

class UpdateProfileRequestModel {
  final String? nama;
  final DateTime? ttl;
  final String? alamat;
  final String? noHp;

  UpdateProfileRequestModel({this.nama, this.ttl, this.alamat, this.noHp});

  factory UpdateProfileRequestModel.fromJson(String str) =>
      UpdateProfileRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdateProfileRequestModel.fromMap(Map<String, dynamic> json) =>
      UpdateProfileRequestModel(
        nama: json["nama"],
        ttl: json["ttl"] == null ? null : DateTime.parse(json["ttl"]),
        alamat: json["alamat"],
        noHp: json["no_hp"],
      );

  Map<String, dynamic> toMap() => {
    "nama": nama,
    "ttl": ttl == null
        ? null
        : "${ttl!.year.toString().padLeft(4, '0')}-${ttl!.month.toString().padLeft(2, '0')}-${ttl!.day.toString().padLeft(2, '0')}",
    "alamat": alamat,
    "no_hp": noHp,
  };
}
