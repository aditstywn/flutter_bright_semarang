part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;
  const factory AuthState.loadingLogin() = LoadingLogin;
  const factory AuthState.loadingRegister() = LoadingRegister;
  const factory AuthState.loadingResetPassword() = LoadingResetPassword;
  const factory AuthState.loginSucces(LoginResponseModel login) = LoginSucces;
  const factory AuthState.registerSucces(RegisterResponseModel register) =
      RegisterSucces;
  const factory AuthState.resetPasswordSucces(RegisterResponseModel reset) =
      ResetPasswordSucces;
  const factory AuthState.errorAuth(String message) = ErrorAuth;
}
