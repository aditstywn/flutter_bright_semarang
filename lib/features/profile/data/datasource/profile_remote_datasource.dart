import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../../core/config/api_driver.dart';
import '../../../../core/config/handle_response.dart';
import '../models/request/update_perofile_academic_request_model.dart';
import '../models/request/update_profile_request_model.dart';
import '../models/response/profile_response_model.dart';

class ProfileRemoteDatasource {
  final _driver = ApiDriver();

  Future<Either<String, ProfileResponseModel>> getProfile() async {
    try {
      final response = await _driver.request(
        method: ApiMethod.get,
        url: '/profile',
      );

      return handleResponse(
        response: response,
        fromJson: (String body) => ProfileResponseModel.fromJson(body),
        errorMessage: 'Gagal memuat data profil, silakan coba lagi',
      );
    } catch (e) {
      return const Left('Gagal memuat data profil, silakan coba lagi');
    }
  }

  Future<Either<String, String>> updateProfile(
    UpdateProfileRequestModel request,
  ) async {
    try {
      final response = await _driver.request(
        method: ApiMethod.post,
        url: '/profile',
        body: request.toJson(),
      );

      return handleResponse(
        response: response,
        fromJson: (String body) {
          final decoded = json.decode(body);
          if (decoded is Map<String, dynamic> && decoded['message'] is String) {
            return decoded['message'] as String;
          }
          return 'Profil berhasil diperbarui';
        },
        errorMessage: 'Gagal memperbarui profil, silakan coba lagi',
      );
    } catch (e) {
      return const Left('Gagal memperbarui profil, silakan coba lagi');
    }
  }

  Future<Either<String, String>> updateProfileAcademic(
    UpdateProfileAcademicRequestModel request,
  ) async {
    try {
      final response = await _driver.request(
        method: ApiMethod.post,
        url: '/profile/academic',
        body: request.toJson(),
      );

      return handleResponse(
        response: response,
        fromJson: (String body) {
          final decoded = json.decode(body);
          if (decoded is Map<String, dynamic> && decoded['message'] is String) {
            return decoded['message'] as String;
          }
          return 'Data akademik berhasil diperbarui';
        },
        errorMessage: 'Gagal memperbarui data akademik, silakan coba lagi',
      );
    } catch (e) {
      return const Left('Gagal memperbarui data akademik, silakan coba lagi');
    }
  }

  Future<Either<String, String>> uploadFoto(XFile foto) async {
    try {
      final files = <http.MultipartFile>[
        await http.MultipartFile.fromPath('foto', foto.path),
      ];

      final response = await _driver.request(
        method: ApiMethod.post,
        url: '/profile/photo',
        files: files,
        isMultipart: true,
      );

      return handleResponse(
        response: response,
        fromJson: (String body) {
          final decoded = json.decode(body);
          if (decoded is Map<String, dynamic> && decoded['message'] is String) {
            return decoded['message'] as String;
          }
          return 'Foto profil berhasil diperbarui';
        },
        errorMessage: 'Gagal mengunggah foto profil, silakan coba lagi',
      );
    } catch (e) {
      return const Left('Gagal mengunggah foto profil, silakan coba lagi');
    }
  }
}
