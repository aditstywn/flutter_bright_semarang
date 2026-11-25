import 'package:camera/camera.dart';

class PresenceRequestModel {
  final XFile? fotoBase64;
  final double? latitude;
  final double? longitude;
  final String? keterangan;

  PresenceRequestModel({
    this.fotoBase64,
    this.latitude,
    this.longitude,
    this.keterangan,
  });

  Map<String, dynamic> toMap() => {
    "latitude": latitude,
    "longitude": longitude,
    "keterangan": keterangan,
  };
}
