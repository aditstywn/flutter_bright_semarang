part of 'leaves_bloc.dart';

@freezed
class LeavesEvent with _$LeavesEvent {
  const factory LeavesEvent.started() = _Started;
  const factory LeavesEvent.getLeaves() = _GetLeaves;
}
