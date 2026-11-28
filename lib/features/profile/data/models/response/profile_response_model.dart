import 'dart:convert';

class ProfileResponseModel {
  final bool? success;
  final int? code;
  final String? message;
  final Profile? data;

  ProfileResponseModel({this.success, this.code, this.message, this.data});

  factory ProfileResponseModel.fromJson(String str) =>
      ProfileResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProfileResponseModel.fromMap(Map<String, dynamic> json) =>
      ProfileResponseModel(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : Profile.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
    "success": success,
    "code": code,
    "message": message,
    "data": data?.toMap(),
  };
}

class Profile {
  final int? id;
  final String? nama;
  final String? email;
  final String? role;
  final DateTime? ttl;
  final String? alamat;
  final String? noHp;
  final String? fotoUrl;
  final Academic? academic;
  final Internship? internship;

  Profile({
    this.id,
    this.nama,
    this.email,
    this.role,
    this.ttl,
    this.alamat,
    this.noHp,
    this.fotoUrl,
    this.academic,
    this.internship,
  });

  factory Profile.fromJson(String str) => Profile.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
    id: json["id"],
    nama: json["nama"],
    email: json["email"],
    role: json["role"],
    ttl: json["ttl"] == null ? null : DateTime.parse(json["ttl"]),
    alamat: json["alamat"],
    noHp: json["no_hp"],
    fotoUrl: json["foto_url"],
    academic: json["academic"] == null
        ? null
        : Academic.fromMap(json["academic"]),
    internship: json["internship"] == null
        ? null
        : Internship.fromMap(json["internship"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "nama": nama,
    "email": email,
    "role": role,
    "ttl": ttl == null
        ? null
        : "${ttl!.year.toString().padLeft(4, '0')}-${ttl!.month.toString().padLeft(2, '0')}-${ttl!.day.toString().padLeft(2, '0')}",
    "alamat": alamat,
    "no_hp": noHp,
    "foto_url": fotoUrl,
    "academic": academic?.toMap(),
    "internship": internship?.toMap(),
  };
}

class Academic {
  final String? universitas;
  final String? fakultas;
  final String? prodi;
  final String? nim;
  final String? jenjang;
  final int? semester;

  Academic({
    this.universitas,
    this.fakultas,
    this.prodi,
    this.nim,
    this.jenjang,
    this.semester,
  });

  factory Academic.fromJson(String str) => Academic.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Academic.fromMap(Map<String, dynamic> json) => Academic(
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

class Internship {
  final DateTime? tglMasukMagang;
  final DateTime? tglSelesaiMagang;
  final int? durasiMagangBulan;
  final int? sisaHari;
  final int? progressPersen;
  final String? statusMagang;
  final String? suratPermohonanUrl;

  Internship({
    this.tglMasukMagang,
    this.tglSelesaiMagang,
    this.durasiMagangBulan,
    this.sisaHari,
    this.progressPersen,
    this.statusMagang,
    this.suratPermohonanUrl,
  });

  factory Internship.fromJson(String str) =>
      Internship.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Internship.fromMap(Map<String, dynamic> json) => Internship(
    tglMasukMagang: json["tgl_masuk_magang"] == null
        ? null
        : DateTime.parse(json["tgl_masuk_magang"]),
    tglSelesaiMagang: json["tgl_selesai_magang"] == null
        ? null
        : DateTime.parse(json["tgl_selesai_magang"]),
    durasiMagangBulan: json["durasi_magang_bulan"],
    sisaHari: json["sisa_hari"],
    progressPersen: json["progress_persen"],
    statusMagang: json["status_magang"],
    suratPermohonanUrl: json["surat_permohonan_url"],
  );

  Map<String, dynamic> toMap() => {
    "tgl_masuk_magang": tglMasukMagang == null
        ? null
        : "${tglMasukMagang!.year.toString().padLeft(4, '0')}-${tglMasukMagang!.month.toString().padLeft(2, '0')}-${tglMasukMagang!.day.toString().padLeft(2, '0')}",
    "tgl_selesai_magang": tglSelesaiMagang == null
        ? null
        : "${tglSelesaiMagang!.year.toString().padLeft(4, '0')}-${tglSelesaiMagang!.month.toString().padLeft(2, '0')}-${tglSelesaiMagang!.day.toString().padLeft(2, '0')}",
    "durasi_magang_bulan": durasiMagangBulan,
    "sisa_hari": sisaHari,
    "progress_persen": progressPersen,
    "status_magang": statusMagang,
    "surat_permohonan_url": suratPermohonanUrl,
  };
}
