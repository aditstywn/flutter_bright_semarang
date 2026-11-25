part of 'presence_bloc.dart';

@freezed
class PresenceState with _$PresenceState {
  const factory PresenceState.initial() = Initial;
  const factory PresenceState.loadingPresence() = LoadingPresence;
  const factory PresenceState.presenceSuccess(PresenceResponseModel presence) =
      PresenceSuccess;
  const factory PresenceState.errorPresence(String message) = ErrorPresence;
}
