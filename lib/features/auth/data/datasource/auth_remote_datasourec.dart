import 'package:dartz/dartz.dart';

import '../../../../core/config/api_driver.dart';
import '../../../../core/config/handle_response.dart';
import '../models/request/login_request_model.dart';
import '../models/request/register_request_model.dart';
import '../models/response/login_response_model.dart';
import '../models/response/register_response_model.dart';

class AuthRemoteDatasource {
  final _driver = ApiDriver();

  Future<Either<String, LoginResponseModel>> login(
    LoginRequestModel request,
  ) async {
    try {
      final response = await _driver.request(
        method: ApiMethod.post,
        url: '/auth/login',
        body: request.toJson(),
      );

      return handleResponse(
        response: response,
        fromJson: (String body) => LoginResponseModel.fromJson(body),
        errorMessage:
            'Login gagal, pastikan email dan password benar dan coba lagi',
      );
    } catch (e) {
      return const Left(
        'Login gagal, pastikan email dan password benar dan coba lagi',
      );
    }
  }

  Future<Either<String, RegisterResponseModel>> register(
    RegisterRequestModel request,
  ) async {
    try {
      final response = await _driver.request(
        method: ApiMethod.post,
        url: '/auth/register',
        body: request.toJson(),
      );

      return handleResponse(
        response: response,
        fromJson: (String body) => RegisterResponseModel.fromJson(body),
        errorMessage:
            'Register gagal, pastikan data yang dimasukkan benar dan coba lagi',
      );
    } catch (e) {
      return const Left(
        'Register gagal, pastikan data yang dimasukkan benar dan coba lagi',
      );
    }
  }

  Future<Either<String, RegisterResponseModel>> resetPassword(
    String email,
  ) async {
    try {
      final response = await _driver.request(
        method: ApiMethod.post,
        url: '/auth/forgot-password',
        body: '{"email": "$email"}',
      );

      return handleResponse(
        response: response,
        fromJson: (String body) => RegisterResponseModel.fromJson(body),
        errorMessage: 'Reset password gagal, pastikan email yang dimasukkan benar dan coba lagi',
      );
    } catch (e) {
      return const Left(
        'Reset password gagal, pastikan email yang dimasukkan benar dan coba lagi',
      );
    }
  }
}
