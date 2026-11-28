part of 'submit_profile_bloc.dart';

@freezed
class SubmitProfileEvent with _$SubmitProfileEvent {
  const factory SubmitProfileEvent.started() = _Started;
  const factory SubmitProfileEvent.updateProfile(
    UpdateProfileRequestModel request,
  ) = _UpdateProfile;
  const factory SubmitProfileEvent.updateProfileAcademic(
    UpdateProfileAcademicRequestModel request,
  ) = _UpdateProfileAcademic;
  const factory SubmitProfileEvent.uploadFoto(XFile foto) = _UploadFoto;
}
