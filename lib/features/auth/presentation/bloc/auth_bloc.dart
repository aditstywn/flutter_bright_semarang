import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasource/auth_remote_datasourec.dart';
import '../../data/models/request/login_request_model.dart';
import '../../data/models/request/register_request_model.dart';
import '../../data/models/response/login_response_model.dart';
import '../../data/models/response/register_response_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRemoteDatasource _authRemoteDatasource;
  AuthBloc(this._authRemoteDatasource) : super(Initial()) {
    on<_Login>((event, emit) async {
      emit(LoadingLogin());
      final result = await _authRemoteDatasource.login(event.login);
      result.fold(
        (error) => emit(ErrorAuth(error)),
        (login) => emit(LoginSucces(login)),
      );
    });
    on<_Register>((event, emit) async {
      emit(LoadingRegister());
      final result = await _authRemoteDatasource.register(event.register);
      result.fold(
        (error) => emit(ErrorAuth(error)),
        (register) => emit(RegisterSucces(register)),
      );
    });
    on<_ResetPassword>((event, emit) async {
      emit(LoadingResetPassword());
      final result = await _authRemoteDatasource.resetPassword(event.email);
      result.fold(
        (error) => emit(ErrorAuth(error)),
        (reset) => emit(ResetPasswordSucces(reset)),
      );
    });
  }
}
