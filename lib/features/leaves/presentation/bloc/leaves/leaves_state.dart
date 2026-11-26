part of 'leaves_bloc.dart';

@freezed
class LeavesState with _$LeavesState {
  const factory LeavesState.initial() = Initial;
  const factory LeavesState.loadingLeaves() = LoadingLeaves;
  const factory LeavesState.leavesSuccess(LeavesResponseModel leaves) =
      LeavesSuccess;
  const factory LeavesState.errorLeaves(String message) = ErrorLeaves;
}
