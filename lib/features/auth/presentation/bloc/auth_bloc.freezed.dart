// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _Login value)?  login,TResult Function( _Register value)?  register,TResult Function( _ResetPassword value)?  resetPassword,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Login() when login != null:
return login(_that);case _Register() when register != null:
return register(_that);case _ResetPassword() when resetPassword != null:
return resetPassword(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _Login value)  login,required TResult Function( _Register value)  register,required TResult Function( _ResetPassword value)  resetPassword,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _Login():
return login(_that);case _Register():
return register(_that);case _ResetPassword():
return resetPassword(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _Login value)?  login,TResult? Function( _Register value)?  register,TResult? Function( _ResetPassword value)?  resetPassword,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Login() when login != null:
return login(_that);case _Register() when register != null:
return register(_that);case _ResetPassword() when resetPassword != null:
return resetPassword(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( LoginRequestModel login)?  login,TResult Function( RegisterRequestModel register)?  register,TResult Function( String email)?  resetPassword,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Login() when login != null:
return login(_that.login);case _Register() when register != null:
return register(_that.register);case _ResetPassword() when resetPassword != null:
return resetPassword(_that.email);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( LoginRequestModel login)  login,required TResult Function( RegisterRequestModel register)  register,required TResult Function( String email)  resetPassword,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _Login():
return login(_that.login);case _Register():
return register(_that.register);case _ResetPassword():
return resetPassword(_that.email);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( LoginRequestModel login)?  login,TResult? Function( RegisterRequestModel register)?  register,TResult? Function( String email)?  resetPassword,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Login() when login != null:
return login(_that.login);case _Register() when register != null:
return register(_that.register);case _ResetPassword() when resetPassword != null:
return resetPassword(_that.email);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements AuthEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthEvent.started()';
}


}




/// @nodoc


class _Login implements AuthEvent {
  const _Login(this.login);
  

 final  LoginRequestModel login;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginCopyWith<_Login> get copyWith => __$LoginCopyWithImpl<_Login>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Login&&(identical(other.login, login) || other.login == login));
}


@override
int get hashCode {
    return Object.hash(runtimeType,login);
}

@override
String toString() {
    return 'AuthEvent.login(login: $login)';
}


}

/// @nodoc
abstract mixin class _$LoginCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$LoginCopyWith(_Login value, $Res Function(_Login) _then) = __$LoginCopyWithImpl;
@useResult
$Res call({
 LoginRequestModel login
});




}
/// @nodoc
class __$LoginCopyWithImpl<$Res>
    implements _$LoginCopyWith<$Res> {
  __$LoginCopyWithImpl(this._self, this._then);

  final _Login _self;
  final $Res Function(_Login) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? login = null,}) {
  return _then(_Login(
null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as LoginRequestModel,
  ));
}


}

/// @nodoc


class _Register implements AuthEvent {
  const _Register(this.register);
  

 final  RegisterRequestModel register;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterCopyWith<_Register> get copyWith => __$RegisterCopyWithImpl<_Register>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Register&&(identical(other.register, register) || other.register == register));
}


@override
int get hashCode {
    return Object.hash(runtimeType,register);
}

@override
String toString() {
    return 'AuthEvent.register(register: $register)';
}


}

/// @nodoc
abstract mixin class _$RegisterCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$RegisterCopyWith(_Register value, $Res Function(_Register) _then) = __$RegisterCopyWithImpl;
@useResult
$Res call({
 RegisterRequestModel register
});




}
/// @nodoc
class __$RegisterCopyWithImpl<$Res>
    implements _$RegisterCopyWith<$Res> {
  __$RegisterCopyWithImpl(this._self, this._then);

  final _Register _self;
  final $Res Function(_Register) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? register = null,}) {
  return _then(_Register(
null == register ? _self.register : register // ignore: cast_nullable_to_non_nullable
as RegisterRequestModel,
  ));
}


}

/// @nodoc


class _ResetPassword implements AuthEvent {
  const _ResetPassword(this.email);
  

 final  String email;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetPasswordCopyWith<_ResetPassword> get copyWith => __$ResetPasswordCopyWithImpl<_ResetPassword>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetPassword&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode {
    return Object.hash(runtimeType,email);
}

@override
String toString() {
    return 'AuthEvent.resetPassword(email: $email)';
}


}

/// @nodoc
abstract mixin class _$ResetPasswordCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$ResetPasswordCopyWith(_ResetPassword value, $Res Function(_ResetPassword) _then) = __$ResetPasswordCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class __$ResetPasswordCopyWithImpl<$Res>
    implements _$ResetPasswordCopyWith<$Res> {
  __$ResetPasswordCopyWithImpl(this._self, this._then);

  final _ResetPassword _self;
  final $Res Function(_ResetPassword) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_ResetPassword(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( LoadingLogin value)?  loadingLogin,TResult Function( LoadingRegister value)?  loadingRegister,TResult Function( LoadingResetPassword value)?  loadingResetPassword,TResult Function( LoginSucces value)?  loginSucces,TResult Function( RegisterSucces value)?  registerSucces,TResult Function( ResetPasswordSucces value)?  resetPasswordSucces,TResult Function( ErrorAuth value)?  errorAuth,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case LoadingLogin() when loadingLogin != null:
return loadingLogin(_that);case LoadingRegister() when loadingRegister != null:
return loadingRegister(_that);case LoadingResetPassword() when loadingResetPassword != null:
return loadingResetPassword(_that);case LoginSucces() when loginSucces != null:
return loginSucces(_that);case RegisterSucces() when registerSucces != null:
return registerSucces(_that);case ResetPasswordSucces() when resetPasswordSucces != null:
return resetPasswordSucces(_that);case ErrorAuth() when errorAuth != null:
return errorAuth(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( LoadingLogin value)  loadingLogin,required TResult Function( LoadingRegister value)  loadingRegister,required TResult Function( LoadingResetPassword value)  loadingResetPassword,required TResult Function( LoginSucces value)  loginSucces,required TResult Function( RegisterSucces value)  registerSucces,required TResult Function( ResetPasswordSucces value)  resetPasswordSucces,required TResult Function( ErrorAuth value)  errorAuth,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case LoadingLogin():
return loadingLogin(_that);case LoadingRegister():
return loadingRegister(_that);case LoadingResetPassword():
return loadingResetPassword(_that);case LoginSucces():
return loginSucces(_that);case RegisterSucces():
return registerSucces(_that);case ResetPasswordSucces():
return resetPasswordSucces(_that);case ErrorAuth():
return errorAuth(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( LoadingLogin value)?  loadingLogin,TResult? Function( LoadingRegister value)?  loadingRegister,TResult? Function( LoadingResetPassword value)?  loadingResetPassword,TResult? Function( LoginSucces value)?  loginSucces,TResult? Function( RegisterSucces value)?  registerSucces,TResult? Function( ResetPasswordSucces value)?  resetPasswordSucces,TResult? Function( ErrorAuth value)?  errorAuth,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case LoadingLogin() when loadingLogin != null:
return loadingLogin(_that);case LoadingRegister() when loadingRegister != null:
return loadingRegister(_that);case LoadingResetPassword() when loadingResetPassword != null:
return loadingResetPassword(_that);case LoginSucces() when loginSucces != null:
return loginSucces(_that);case RegisterSucces() when registerSucces != null:
return registerSucces(_that);case ResetPasswordSucces() when resetPasswordSucces != null:
return resetPasswordSucces(_that);case ErrorAuth() when errorAuth != null:
return errorAuth(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loadingLogin,TResult Function()?  loadingRegister,TResult Function()?  loadingResetPassword,TResult Function( LoginResponseModel login)?  loginSucces,TResult Function( RegisterResponseModel register)?  registerSucces,TResult Function( RegisterResponseModel reset)?  resetPasswordSucces,TResult Function( String message)?  errorAuth,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case LoadingLogin() when loadingLogin != null:
return loadingLogin();case LoadingRegister() when loadingRegister != null:
return loadingRegister();case LoadingResetPassword() when loadingResetPassword != null:
return loadingResetPassword();case LoginSucces() when loginSucces != null:
return loginSucces(_that.login);case RegisterSucces() when registerSucces != null:
return registerSucces(_that.register);case ResetPasswordSucces() when resetPasswordSucces != null:
return resetPasswordSucces(_that.reset);case ErrorAuth() when errorAuth != null:
return errorAuth(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loadingLogin,required TResult Function()  loadingRegister,required TResult Function()  loadingResetPassword,required TResult Function( LoginResponseModel login)  loginSucces,required TResult Function( RegisterResponseModel register)  registerSucces,required TResult Function( RegisterResponseModel reset)  resetPasswordSucces,required TResult Function( String message)  errorAuth,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case LoadingLogin():
return loadingLogin();case LoadingRegister():
return loadingRegister();case LoadingResetPassword():
return loadingResetPassword();case LoginSucces():
return loginSucces(_that.login);case RegisterSucces():
return registerSucces(_that.register);case ResetPasswordSucces():
return resetPasswordSucces(_that.reset);case ErrorAuth():
return errorAuth(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loadingLogin,TResult? Function()?  loadingRegister,TResult? Function()?  loadingResetPassword,TResult? Function( LoginResponseModel login)?  loginSucces,TResult? Function( RegisterResponseModel register)?  registerSucces,TResult? Function( RegisterResponseModel reset)?  resetPasswordSucces,TResult? Function( String message)?  errorAuth,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case LoadingLogin() when loadingLogin != null:
return loadingLogin();case LoadingRegister() when loadingRegister != null:
return loadingRegister();case LoadingResetPassword() when loadingResetPassword != null:
return loadingResetPassword();case LoginSucces() when loginSucces != null:
return loginSucces(_that.login);case RegisterSucces() when registerSucces != null:
return registerSucces(_that.register);case ResetPasswordSucces() when resetPasswordSucces != null:
return resetPasswordSucces(_that.reset);case ErrorAuth() when errorAuth != null:
return errorAuth(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements AuthState {
  const Initial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthState.initial()';
}


}




/// @nodoc


class LoadingLogin implements AuthState {
  const LoadingLogin();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingLogin);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthState.loadingLogin()';
}


}




/// @nodoc


class LoadingRegister implements AuthState {
  const LoadingRegister();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingRegister);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthState.loadingRegister()';
}


}




/// @nodoc


class LoadingResetPassword implements AuthState {
  const LoadingResetPassword();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingResetPassword);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthState.loadingResetPassword()';
}


}




/// @nodoc


class LoginSucces implements AuthState {
  const LoginSucces(this.login);
  

 final  LoginResponseModel login;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginSuccesCopyWith<LoginSucces> get copyWith => _$LoginSuccesCopyWithImpl<LoginSucces>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginSucces&&(identical(other.login, login) || other.login == login));
}


@override
int get hashCode {
    return Object.hash(runtimeType,login);
}

@override
String toString() {
    return 'AuthState.loginSucces(login: $login)';
}


}

/// @nodoc
abstract mixin class $LoginSuccesCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $LoginSuccesCopyWith(LoginSucces value, $Res Function(LoginSucces) _then) = _$LoginSuccesCopyWithImpl;
@useResult
$Res call({
 LoginResponseModel login
});




}
/// @nodoc
class _$LoginSuccesCopyWithImpl<$Res>
    implements $LoginSuccesCopyWith<$Res> {
  _$LoginSuccesCopyWithImpl(this._self, this._then);

  final LoginSucces _self;
  final $Res Function(LoginSucces) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? login = null,}) {
  return _then(LoginSucces(
null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as LoginResponseModel,
  ));
}


}

/// @nodoc


class RegisterSucces implements AuthState {
  const RegisterSucces(this.register);
  

 final  RegisterResponseModel register;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterSuccesCopyWith<RegisterSucces> get copyWith => _$RegisterSuccesCopyWithImpl<RegisterSucces>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterSucces&&(identical(other.register, register) || other.register == register));
}


@override
int get hashCode {
    return Object.hash(runtimeType,register);
}

@override
String toString() {
    return 'AuthState.registerSucces(register: $register)';
}


}

/// @nodoc
abstract mixin class $RegisterSuccesCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $RegisterSuccesCopyWith(RegisterSucces value, $Res Function(RegisterSucces) _then) = _$RegisterSuccesCopyWithImpl;
@useResult
$Res call({
 RegisterResponseModel register
});




}
/// @nodoc
class _$RegisterSuccesCopyWithImpl<$Res>
    implements $RegisterSuccesCopyWith<$Res> {
  _$RegisterSuccesCopyWithImpl(this._self, this._then);

  final RegisterSucces _self;
  final $Res Function(RegisterSucces) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? register = null,}) {
  return _then(RegisterSucces(
null == register ? _self.register : register // ignore: cast_nullable_to_non_nullable
as RegisterResponseModel,
  ));
}


}

/// @nodoc


class ResetPasswordSucces implements AuthState {
  const ResetPasswordSucces(this.reset);
  

 final  RegisterResponseModel reset;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPasswordSuccesCopyWith<ResetPasswordSucces> get copyWith => _$ResetPasswordSuccesCopyWithImpl<ResetPasswordSucces>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordSucces&&(identical(other.reset, reset) || other.reset == reset));
}


@override
int get hashCode {
    return Object.hash(runtimeType,reset);
}

@override
String toString() {
    return 'AuthState.resetPasswordSucces(reset: $reset)';
}


}

/// @nodoc
abstract mixin class $ResetPasswordSuccesCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $ResetPasswordSuccesCopyWith(ResetPasswordSucces value, $Res Function(ResetPasswordSucces) _then) = _$ResetPasswordSuccesCopyWithImpl;
@useResult
$Res call({
 RegisterResponseModel reset
});




}
/// @nodoc
class _$ResetPasswordSuccesCopyWithImpl<$Res>
    implements $ResetPasswordSuccesCopyWith<$Res> {
  _$ResetPasswordSuccesCopyWithImpl(this._self, this._then);

  final ResetPasswordSucces _self;
  final $Res Function(ResetPasswordSucces) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reset = null,}) {
  return _then(ResetPasswordSucces(
null == reset ? _self.reset : reset // ignore: cast_nullable_to_non_nullable
as RegisterResponseModel,
  ));
}


}

/// @nodoc


class ErrorAuth implements AuthState {
  const ErrorAuth(this.message);
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorAuthCopyWith<ErrorAuth> get copyWith => _$ErrorAuthCopyWithImpl<ErrorAuth>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorAuth&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'AuthState.errorAuth(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorAuthCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $ErrorAuthCopyWith(ErrorAuth value, $Res Function(ErrorAuth) _then) = _$ErrorAuthCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorAuthCopyWithImpl<$Res>
    implements $ErrorAuthCopyWith<$Res> {
  _$ErrorAuthCopyWithImpl(this._self, this._then);

  final ErrorAuth _self;
  final $Res Function(ErrorAuth) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorAuth(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
