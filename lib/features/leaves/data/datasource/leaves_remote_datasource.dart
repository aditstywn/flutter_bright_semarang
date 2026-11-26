import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/config/api_driver.dart';
import '../../../../core/config/handle_response.dart';
import '../models/request/create_leaves_request_model.dart';
import '../models/response/create_leaves_response_model.dart';
import '../models/response/leaves_response_model.dart';

class LeavesRemoteDatasource {
  final _driver = ApiDriver();

  Future<Either<String, LeavesResponseModel>> getLeaves() async {
    try {
      final response = await _driver.request(
        method: ApiMethod.get,
        url: '/leaves',
      );

      return handleResponse(
        response: response,
        fromJson: (String body) => LeavesResponseModel.fromJson(body),
        errorMessage: 'Gagal memuat data pengajuan izin, silakan coba lagi',
      );
    } catch (e) {
      return const Left('Gagal memuat data pengajuan izin, silakan coba lagi');
    }
  }

  Future<Either<String, CreateLeavesResponseModel>> submitLeave(
    CreateLeavesRequestModel request,
  ) async {
    try {
      final files = <http.MultipartFile>[];
      if (request.bukti != null) {
        files.add(
          await http.MultipartFile.fromPath(
            'bukti',
            request.bukti!.path,
          ),
        );
      }

      final response = await _driver.request(
        method: ApiMethod.post,
        url: '/leaves',
        fields: request.toMap(),
        files: files,
        isMultipart: true,
      );

      return handleResponse(
        response: response,
        fromJson: (String body) => CreateLeavesResponseModel.fromJson(body),
        errorMessage: 'Pengajuan izin gagal dikirim, silakan coba lagi',
      );
    } catch (e) {
      return const Left('Pengajuan izin gagal dikirim, silakan coba lagi');
    }
  }
}
