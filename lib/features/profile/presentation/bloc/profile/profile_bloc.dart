import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/datasource/profile_remote_datasource.dart';
import '../../../data/models/response/profile_response_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRemoteDatasource _profileRemoteDatasource;

  ProfileBloc(this._profileRemoteDatasource) : super(Initial()) {
    on<_GetProfile>((event, emit) async {
      emit(LoadingProfile());
      final result = await _profileRemoteDatasource.getProfile();
      result.fold(
        (error) => emit(ErrorProfile(error)),
        (profile) => emit(ProfileSuccess(profile)),
      );
    });
  }
}
