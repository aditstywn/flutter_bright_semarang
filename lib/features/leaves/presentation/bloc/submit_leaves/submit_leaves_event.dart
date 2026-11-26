part of 'submit_leaves_bloc.dart';

@freezed
class SubmitLeavesEvent with _$SubmitLeavesEvent {
  const factory SubmitLeavesEvent.started() = _Started;
  const factory SubmitLeavesEvent.submit(CreateLeavesRequestModel request) =
      _Submit;
}
