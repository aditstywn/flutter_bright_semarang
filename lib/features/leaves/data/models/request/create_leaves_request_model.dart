import 'package:image_picker/image_picker.dart';

class CreateLeavesRequestModel {
  final String? jenis;
  final DateTime? tanggalMulai;
  final DateTime? tanggalSelesai;
  final String? alasan;
  final XFile? bukti;

  CreateLeavesRequestModel({
    this.jenis,
    this.tanggalMulai,
    this.tanggalSelesai,
    this.alasan,
    this.bukti,
  });

  Map<String, String> toMap() => {
    "jenis": jenis ?? '',
    "tanggal_mulai": tanggalMulai?.toIso8601String() ?? '',
    "tanggal_selesai": tanggalSelesai?.toIso8601String() ?? '',
    "alasan": alasan ?? '',
  };
}
