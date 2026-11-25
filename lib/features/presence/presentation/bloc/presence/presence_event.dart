part of 'presence_bloc.dart';

@freezed
class PresenceEvent with _$PresenceEvent {
  const factory PresenceEvent.started() = _Started;
  const factory PresenceEvent.checkIn(PresenceRequestModel request) = _CheckIn;
  const factory PresenceEvent.checkOut(PresenceRequestModel request) =
      _CheckOut;
}
