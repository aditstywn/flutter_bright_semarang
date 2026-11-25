import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/datasource/presence_remote_datasource.dart';
import '../../../data/models/request/presence_history_request_model.dart';
import '../../../data/models/response/presence_history_response_model.dart';

part 'presence_history_event.dart';
part 'presence_history_state.dart';
part 'presence_history_bloc.freezed.dart';

class PresenceHistoryBloc
    extends Bloc<PresenceHistoryEvent, PresenceHistoryState> {
  final PresenceRemoteDatasource _presenceRemoteDatasource;

  PresenceHistoryBloc(this._presenceRemoteDatasource) : super(Initial()) {
    on<_GetHistory>((event, emit) async {
      emit(LoadingPresenceHistory());
      final result = await _presenceRemoteDatasource.getHistory(event.request);
      result.fold(
        (error) => emit(ErrorPresenceHistory(error)),
        (history) => emit(PresenceHistorySuccess(history)),
      );
    });
  }
}
