import 'package:dartz/dartz.dart';

import '../../../../core/config/api_driver.dart';
import '../../../../core/config/handle_response.dart';
import '../models/response/dashboard_response_model.dart';
import '../models/response/leaderboard_response_model.dart';

class HomeRemoteDatasource {
  final _driver = ApiDriver();

  Future<Either<String, DashboardResponseModel>> getDashboard() async {
    try {
      final response = await _driver.request(
        method: ApiMethod.get,
        url: '/dashboard',
      );

      return handleResponse(
        response: response,
        fromJson: (String body) => DashboardResponseModel.fromJson(body),
        errorMessage: 'Gagal memuat data dashboard, silakan coba lagi',
      );
    } catch (e) {
      return const Left('Gagal memuat data dashboard, silakan coba lagi');
    }
  }

  Future<Either<String, LeaderboardResponseModel>> getLeaderboard() async {
    try {
      final response = await _driver.request(
        method: ApiMethod.get,
        url: '/dashboard/leaderboard',
      );

      return handleResponse(
        response: response,
        fromJson: (String body) => LeaderboardResponseModel.fromJson(body),
        errorMessage: 'Gagal memuat data leaderboard, silakan coba lagi',
      );
    } catch (e) {
      return const Left('Gagal memuat data leaderboard, silakan coba lagi');
    }
  }
}
