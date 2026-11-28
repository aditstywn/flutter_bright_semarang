import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/datasource/profile_remote_datasource.dart';
import '../../../data/models/request/update_perofile_academic_request_model.dart';
import '../../../data/models/request/update_profile_request_model.dart';

part 'submit_profile_event.dart';
part 'submit_profile_state.dart';
part 'submit_profile_bloc.freezed.dart';

class SubmitProfileBloc extends Bloc<SubmitProfileEvent, SubmitProfileState> {
  final ProfileRemoteDatasource _profileRemoteDatasource;

  SubmitProfileBloc(this._profileRemoteDatasource) : super(Initial()) {
    on<_UpdateProfile>((event, emit) async {
      emit(LoadingSubmitProfile());
      final result = await _profileRemoteDatasource.updateProfile(
        event.request,
      );
      result.fold(
        (error) => emit(ErrorSubmitProfile(error)),
        (message) => emit(SubmitProfileSuccess(message)),
      );
    });

    on<_UpdateProfileAcademic>((event, emit) async {
      emit(LoadingSubmitProfile());
      final result = await _profileRemoteDatasource.updateProfileAcademic(
        event.request,
      );
      result.fold(
        (error) => emit(ErrorSubmitProfile(error)),
        (message) => emit(SubmitProfileSuccess(message)),
      );
    });

    on<_UploadFoto>((event, emit) async {
      emit(LoadingUploadFoto());
      final result = await _profileRemoteDatasource.uploadFoto(event.foto);
      result.fold(
        (error) => emit(ErrorUploadFoto(error)),
        (message) => emit(UploadFotoSuccess(message)),
      );
    });
  }
}
