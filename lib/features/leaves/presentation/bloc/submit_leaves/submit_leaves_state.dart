part of 'submit_leaves_bloc.dart';

@freezed
class SubmitLeavesState with _$SubmitLeavesState {
  const factory SubmitLeavesState.initial() = Initial;
  const factory SubmitLeavesState.loadingSubmitLeaves() = LoadingSubmitLeaves;
  const factory SubmitLeavesState.submitLeavesSuccess(
    CreateLeavesResponseModel response,
  ) = SubmitLeavesSuccess;
  const factory SubmitLeavesState.errorSubmitLeaves(String message) =
      ErrorSubmitLeaves;
}
