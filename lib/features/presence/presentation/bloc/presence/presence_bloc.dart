import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/datasource/presence_remote_datasource.dart';
import '../../../data/models/request/presence_request_model.dart';
import '../../../data/models/response/presence_response_model.dart';

part 'presence_event.dart';
part 'presence_state.dart';
part 'presence_bloc.freezed.dart';

class PresenceBloc extends Bloc<PresenceEvent, PresenceState> {
  final PresenceRemoteDatasource _presenceRemoteDatasource;

  PresenceBloc(this._presenceRemoteDatasource) : super(Initial()) {
    on<_CheckIn>((event, emit) async {
      emit(LoadingPresence());
      final result = await _presenceRemoteDatasource.checkIn(event.request);
      result.fold(
        (error) => emit(ErrorPresence(error)),
        (checkIn) => emit(PresenceSuccess(checkIn)),
      );
    });

    on<_CheckOut>((event, emit) async {
      emit(LoadingPresence());
      final result = await _presenceRemoteDatasource.checkOut(event.request);
      result.fold(
        (error) => emit(ErrorPresence(error)),
        (checkOut) => emit(PresenceSuccess(checkOut)),
      );
    });
  }
}
