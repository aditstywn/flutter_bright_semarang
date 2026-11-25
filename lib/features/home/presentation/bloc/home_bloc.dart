import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasource/home_remote_datasource.dart';
import '../../data/models/response/dashboard_response_model.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRemoteDatasource _homeRemoteDatasource;

  HomeBloc(this._homeRemoteDatasource) : super(Initial()) {
    on<_GetDashboard>((event, emit) async {
      emit(LoadingDashboard());

      final result = await _homeRemoteDatasource.getDashboard();

      result.fold(
        (error) => emit(ErrorHome(error)),
        (dashboard) => emit(DashboardSucces(dashboard)),
      );
    });
  }
}
