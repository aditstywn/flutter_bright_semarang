import 'package:dartz/dartz.dart';

import '../../../../core/config/api_driver.dart';
import '../../../../core/config/handle_response.dart';
import '../models/request/presence_history_request_model.dart';
import '../models/request/presence_request_model.dart';
import '../models/response/presence_history_response_model.dart';
import '../models/response/presence_response_model.dart';

class PresenceRemoteDatasource {
  final _driver = ApiDriver();

  Future<Either<String, PresenceResponseModel>> checkIn(
    PresenceRequestModel request,
  ) async {
    try {
      final response = await _driver.request(
        method: ApiMethod.post,
        url: '/attendance/checkin',
        body: request.toMap(),
        isMultipart: true,
      );

      return handleResponse(
        response: response,
        fromJson: (String body) => PresenceResponseModel.fromJson(body),
        errorMessage: 'Presensi masuk gagal, silakan coba lagi',
      );
    } catch (e) {
      return const Left('Presensi masuk gagal, silakan coba lagi');
    }
  }

  Future<Either<String, PresenceResponseModel>> checkOut(
    PresenceRequestModel request,
  ) async {
    try {
      final response = await _driver.request(
        method: ApiMethod.post,
        url: '/attendance/checkout',
        body: request.toMap(),
        isMultipart: true,
      );

      return handleResponse(
        response: response,
        fromJson: (String body) => PresenceResponseModel.fromJson(body),
        errorMessage: 'Presensi keluar gagal, silakan coba lagi',
      );
    } catch (e) {
      return const Left('Presensi keluar gagal, silakan coba lagi');
    }
  }

  Future<Either<String, PresenceHistoryResponseModel>> getHistory(
    PresenceHistoryRequestModel request,
  ) async {
    try {
      final queryParams = <String, String>{};
      request.toMap().forEach((key, value) {
        if (value != null && value.toString().trim().isNotEmpty) {
          queryParams[key] = value.toString();
        }
      });

      final url = Uri(
        path: '/attendance/history',
        queryParameters: queryParams.isEmpty ? null : queryParams,
      ).toString();

      final response = await _driver.request(
        method: ApiMethod.get,
        url: url,
      );

      return handleResponse(
        response: response,
        fromJson: (String body) => PresenceHistoryResponseModel.fromJson(body),
        errorMessage: 'Gagal memuat riwayat presensi, silakan coba lagi',
      );
    } catch (e) {
      return const Left('Gagal memuat riwayat presensi, silakan coba lagi');
    }
  }
}
