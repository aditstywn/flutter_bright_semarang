part of 'presence_history_bloc.dart';

@freezed
class PresenceHistoryEvent with _$PresenceHistoryEvent {
  const factory PresenceHistoryEvent.started() = _Started;
  const factory PresenceHistoryEvent.getHistory(
    PresenceHistoryRequestModel request,
  ) = _GetHistory;
}
