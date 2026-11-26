import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/datasource/leaves_remote_datasource.dart';
import '../../../data/models/response/leaves_response_model.dart';

part 'leaves_event.dart';
part 'leaves_state.dart';
part 'leaves_bloc.freezed.dart';

class LeavesBloc extends Bloc<LeavesEvent, LeavesState> {
  final LeavesRemoteDatasource _leavesRemoteDatasource;

  LeavesBloc(this._leavesRemoteDatasource) : super(Initial()) {
    on<_GetLeaves>((event, emit) async {
      emit(LoadingLeaves());
      final result = await _leavesRemoteDatasource.getLeaves();
      result.fold(
        (error) => emit(ErrorLeaves(error)),
        (leaves) => emit(LeavesSuccess(leaves)),
      );
    });
  }
}
