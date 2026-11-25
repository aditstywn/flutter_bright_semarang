part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = Initial;
  const factory HomeState.loadingDashboard() = LoadingDashboard;
  const factory HomeState.dashboardSucces(DashboardResponseModel dashboard) =
      DashboardSucces;
  const factory HomeState.errorHome(String message) = ErrorHome;
}
