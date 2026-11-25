import 'dart:convert';

class PresenceHistoryRequestModel {
  final int? bulan;
  final int? tahun;
  final String? status;
  final int? page;
  final int? limit;

  PresenceHistoryRequestModel({
    this.page,
    this.limit,
    this.bulan,
    this.tahun,
    this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bulan': bulan,
      'tahun': tahun,
      'status': status,
      'page': page,
      'limit': limit,
    };
  }

  factory PresenceHistoryRequestModel.fromMap(Map<String, dynamic> map) {
    return PresenceHistoryRequestModel(
      bulan: map['bulan'] != null ? map['bulan'] as int : null,
      tahun: map['tahun'] != null ? map['tahun'] as int : null,
      status: map['status'] != null ? map['status'] as String : null,
      page: map['page'] != null ? map['page'] as int : null,
      limit: map['limit'] != null ? map['limit'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PresenceHistoryRequestModel.fromJson(String source) =>
      PresenceHistoryRequestModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
