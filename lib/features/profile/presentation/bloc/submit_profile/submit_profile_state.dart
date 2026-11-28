part of 'submit_profile_bloc.dart';

@freezed
class SubmitProfileState with _$SubmitProfileState {
  const factory SubmitProfileState.initial() = Initial;
  const factory SubmitProfileState.loadingSubmitProfile() =
      LoadingSubmitProfile;
  const factory SubmitProfileState.submitProfileSuccess(String message) =
      SubmitProfileSuccess;
  const factory SubmitProfileState.errorSubmitProfile(String message) =
      ErrorSubmitProfile;
  const factory SubmitProfileState.loadingUploadFoto() = LoadingUploadFoto;
  const factory SubmitProfileState.uploadFotoSuccess(String message) =
      UploadFotoSuccess;
  const factory SubmitProfileState.errorUploadFoto(String message) =
      ErrorUploadFoto;
}
