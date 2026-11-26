import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/datasource/leaves_remote_datasource.dart';
import '../../../data/models/request/create_leaves_request_model.dart';
import '../../../data/models/response/create_leaves_response_model.dart';

part 'submit_leaves_event.dart';
part 'submit_leaves_state.dart';
part 'submit_leaves_bloc.freezed.dart';

class SubmitLeavesBloc extends Bloc<SubmitLeavesEvent, SubmitLeavesState> {
  final LeavesRemoteDatasource _leavesRemoteDatasource;

  SubmitLeavesBloc(this._leavesRemoteDatasource) : super(Initial()) {
    on<_Submit>((event, emit) async {
      emit(LoadingSubmitLeaves());
      final result = await _leavesRemoteDatasource.submitLeave(event.request);
      result.fold(
        (error) => emit(ErrorSubmitLeaves(error)),
        (response) => emit(SubmitLeavesSuccess(response)),
      );
    });
  }
}
