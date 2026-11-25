import 'dart:convert';

class DashboardResponseModel {
  final bool? success;
  final int? code;
  final String? message;
  final Data? data;

  DashboardResponseModel({this.success, this.code, this.message, this.data});

  factory DashboardResponseModel.fromJson(String str) =>
      DashboardResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DashboardResponseModel.fromMap(Map<String, dynamic> json) =>
      DashboardResponseModel(
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
  final String? sapaan;
  final HariIni? hariIni;
  final StatistikBulanan? statistikBulanan;
  final MagangProgress? magangProgress;
  final List<TrendKehadiran>? trendKehadiran;
  final ChartKehadiran? chartKehadiran;
  final List<Leaderboard>? leaderboard;

  Data({
    this.sapaan,
    this.hariIni,
    this.statistikBulanan,
    this.magangProgress,
    this.trendKehadiran,
    this.chartKehadiran,
    this.leaderboard,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    sapaan: json["sapaan"],
    hariIni: json["hari_ini"] == null
        ? null
        : HariIni.fromMap(json["hari_ini"]),
    statistikBulanan: json["statistik_bulanan"] == null
        ? null
        : StatistikBulanan.fromMap(json["statistik_bulanan"]),
    magangProgress: json["magang_progress"] == null
        ? null
        : MagangProgress.fromMap(json["magang_progress"]),
    trendKehadiran: json["trend_kehadiran"] == null
        ? []
        : List<TrendKehadiran>.from(
            json["trend_kehadiran"]!.map((x) => TrendKehadiran.fromMap(x)),
          ),
    chartKehadiran: json["chart_kehadiran"] == null
        ? null
        : ChartKehadiran.fromMap(json["chart_kehadiran"]),
    leaderboard: json["leaderboard"] == null
        ? []
        : List<Leaderboard>.from(
            json["leaderboard"]!.map((x) => Leaderboard.fromMap(x)),
          ),
  );

  Map<String, dynamic> toMap() => {
    "sapaan": sapaan,
    "hari_ini": hariIni?.toMap(),
    "statistik_bulanan": statistikBulanan?.toMap(),
    "magang_progress": magangProgress?.toMap(),
    "trend_kehadiran": trendKehadiran == null
        ? []
        : List<dynamic>.from(trendKehadiran!.map((x) => x.toMap())),
    "chart_kehadiran": chartKehadiran?.toMap(),
    "leaderboard": leaderboard == null
        ? []
        : List<dynamic>.from(leaderboard!.map((x) => x.toMap())),
  };
}

class ChartKehadiran {
  final List<String>? labels;
  final List<int>? hadir;
  final List<int>? telat;

  ChartKehadiran({this.labels, this.hadir, this.telat});

  factory ChartKehadiran.fromJson(String str) =>
      ChartKehadiran.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChartKehadiran.fromMap(Map<String, dynamic> json) => ChartKehadiran(
    labels: json["labels"] == null
        ? []
        : List<String>.from(json["labels"]!.map((x) => x)),
    hadir: json["hadir"] == null
        ? []
        : List<int>.from(json["hadir"]!.map((x) => x)),
    telat: json["telat"] == null
        ? []
        : List<int>.from(json["telat"]!.map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "labels": labels == null ? [] : List<dynamic>.from(labels!.map((x) => x)),
    "hadir": hadir == null ? [] : List<dynamic>.from(hadir!.map((x) => x)),
    "telat": telat == null ? [] : List<dynamic>.from(telat!.map((x) => x)),
  };
}

class HariIni {
  final DateTime? tanggal;
  final String? namaHari;
  final JamKerja? jamKerja;
  final StatusPresensi? statusPresensi;

  HariIni({this.tanggal, this.namaHari, this.jamKerja, this.statusPresensi});

  factory HariIni.fromJson(String str) => HariIni.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HariIni.fromMap(Map<String, dynamic> json) => HariIni(
    tanggal: json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
    namaHari: json["nama_hari"],
    jamKerja: json["jam_kerja"] == null
        ? null
        : JamKerja.fromMap(json["jam_kerja"]),
    statusPresensi: json["status_presensi"] == null
        ? null
        : StatusPresensi.fromMap(json["status_presensi"]),
  );

  Map<String, dynamic> toMap() => {
    "tanggal": tanggal == null
        ? null
        : "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
    "nama_hari": namaHari,
    "jam_kerja": jamKerja?.toMap(),
    "status_presensi": statusPresensi?.toMap(),
  };
}

class JamKerja {
  final String? batasMasuk;
  final String? batasPulang;

  JamKerja({this.batasMasuk, this.batasPulang});

  factory JamKerja.fromJson(String str) => JamKerja.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory JamKerja.fromMap(Map<String, dynamic> json) => JamKerja(
    batasMasuk: json["batas_masuk"],
    batasPulang: json["batas_pulang"],
  );

  Map<String, dynamic> toMap() => {
    "batas_masuk": batasMasuk,
    "batas_pulang": batasPulang,
  };
}

class StatusPresensi {
  final bool? sudahMasuk;
  final dynamic waktuMasuk;
  final dynamic statusMasuk;
  final bool? sudahPulang;
  final dynamic waktuPulang;
  final dynamic statusPulang;

  StatusPresensi({
    this.sudahMasuk,
    this.waktuMasuk,
    this.statusMasuk,
    this.sudahPulang,
    this.waktuPulang,
    this.statusPulang,
  });

  factory StatusPresensi.fromJson(String str) =>
      StatusPresensi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StatusPresensi.fromMap(Map<String, dynamic> json) => StatusPresensi(
    sudahMasuk: json["sudah_masuk"],
    waktuMasuk: json["waktu_masuk"],
    statusMasuk: json["status_masuk"],
    sudahPulang: json["sudah_pulang"],
    waktuPulang: json["waktu_pulang"],
    statusPulang: json["status_pulang"],
  );

  Map<String, dynamic> toMap() => {
    "sudah_masuk": sudahMasuk,
    "waktu_masuk": waktuMasuk,
    "status_masuk": statusMasuk,
    "sudah_pulang": sudahPulang,
    "waktu_pulang": waktuPulang,
    "status_pulang": statusPulang,
  };
}

class Leaderboard {
  final int? rank;
  final String? nama;
  final String? universitas;
  final String? fotoUrl;
  final int? totalHadir;
  final double? persentase;

  Leaderboard({
    this.rank,
    this.nama,
    this.universitas,
    this.fotoUrl,
    this.totalHadir,
    this.persentase,
  });

  factory Leaderboard.fromJson(String str) =>
      Leaderboard.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Leaderboard.fromMap(Map<String, dynamic> json) => Leaderboard(
    rank: json["rank"],
    nama: json["nama"],
    universitas: json["universitas"],
    fotoUrl: json["foto_url"],
    totalHadir: json["total_hadir"],
    persentase: json["persentase"]?.toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "rank": rank,
    "nama": nama,
    "universitas": universitas,
    "foto_url": fotoUrl,
    "total_hadir": totalHadir,
    "persentase": persentase,
  };
}

class MagangProgress {
  final DateTime? tglSelesai;
  final int? sisaHari;
  final int? persentase;

  MagangProgress({this.tglSelesai, this.sisaHari, this.persentase});

  factory MagangProgress.fromJson(String str) =>
      MagangProgress.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MagangProgress.fromMap(Map<String, dynamic> json) => MagangProgress(
    tglSelesai: json["tgl_selesai"] == null
        ? null
        : DateTime.parse(json["tgl_selesai"]),
    sisaHari: json["sisa_hari"],
    persentase: json["persentase"],
  );

  Map<String, dynamic> toMap() => {
    "tgl_selesai": tglSelesai == null
        ? null
        : "${tglSelesai!.year.toString().padLeft(4, '0')}-${tglSelesai!.month.toString().padLeft(2, '0')}-${tglSelesai!.day.toString().padLeft(2, '0')}",
    "sisa_hari": sisaHari,
    "persentase": persentase,
  };
}

class StatistikBulanan {
  final String? bulan;
  final int? tepatWaktu;
  final int? terlambat;
  final int? izin;
  final int? sakit;
  final int? totalKehadiran;
  final int? totalHariKerja;
  final int? totalHariKerjaBulanIni;
  final int? hariKerjaBerjalan;
  final double? persentaseKehadiran;

  StatistikBulanan({
    this.bulan,
    this.tepatWaktu,
    this.terlambat,
    this.izin,
    this.sakit,
    this.totalKehadiran,
    this.totalHariKerja,
    this.totalHariKerjaBulanIni,
    this.hariKerjaBerjalan,
    this.persentaseKehadiran,
  });

  factory StatistikBulanan.fromJson(String str) =>
      StatistikBulanan.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StatistikBulanan.fromMap(Map<String, dynamic> json) =>
      StatistikBulanan(
        bulan: json["bulan"],
        tepatWaktu: json["tepat_waktu"],
        terlambat: json["terlambat"],
        izin: json["izin"],
        sakit: json["sakit"],
        totalKehadiran: json["total_kehadiran"],
        totalHariKerja: json["total_hari_kerja"],
        totalHariKerjaBulanIni: json["total_hari_kerja_bulan_ini"],
        hariKerjaBerjalan: json["hari_kerja_berjalan"],
        persentaseKehadiran: json["persentase_kehadiran"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
    "bulan": bulan,
    "tepat_waktu": tepatWaktu,
    "terlambat": terlambat,
    "izin": izin,
    "sakit": sakit,
    "total_kehadiran": totalKehadiran,
    "total_hari_kerja": totalHariKerja,
    "total_hari_kerja_bulan_ini": totalHariKerjaBulanIni,
    "hari_kerja_berjalan": hariKerjaBerjalan,
    "persentase_kehadiran": persentaseKehadiran,
  };
}

class TrendKehadiran {
  final String? bulan;
  final String? label;
  final int? month;
  final int? year;
  final int? tepatWaktu;
  final int? terlambat;
  final int? izin;
  final int? sakit;
  final int? totalHadir;

  TrendKehadiran({
    this.bulan,
    this.label,
    this.month,
    this.year,
    this.tepatWaktu,
    this.terlambat,
    this.izin,
    this.sakit,
    this.totalHadir,
  });

  factory TrendKehadiran.fromJson(String str) =>
      TrendKehadiran.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TrendKehadiran.fromMap(Map<String, dynamic> json) => TrendKehadiran(
    bulan: json["bulan"],
    label: json["label"],
    month: json["month"],
    year: json["year"],
    tepatWaktu: json["tepat_waktu"],
    terlambat: json["terlambat"],
    izin: json["izin"],
    sakit: json["sakit"],
    totalHadir: json["total_hadir"],
  );

  Map<String, dynamic> toMap() => {
    "bulan": bulan,
    "label": label,
    "month": month,
    "year": year,
    "tepat_waktu": tepatWaktu,
    "terlambat": terlambat,
    "izin": izin,
    "sakit": sakit,
    "total_hadir": totalHadir,
  };
}
