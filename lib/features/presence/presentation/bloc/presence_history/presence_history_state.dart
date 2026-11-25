part of 'presence_history_bloc.dart';

@freezed
class PresenceHistoryState with _$PresenceHistoryState {
  const factory PresenceHistoryState.initial() = Initial;
  const factory PresenceHistoryState.loadingPresenceHistory() =
      LoadingPresenceHistory;
  const factory PresenceHistoryState.presenceHistorySuccess(
    PresenceHistoryResponseModel history,
  ) = PresenceHistorySuccess;
  const factory PresenceHistoryState.errorPresenceHistory(String message) =
      ErrorPresenceHistory;
}
