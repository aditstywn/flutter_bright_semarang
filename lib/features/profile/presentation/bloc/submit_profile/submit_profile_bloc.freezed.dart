// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubmitProfileEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SubmitProfileEvent()';
}


}

/// @nodoc
class $SubmitProfileEventCopyWith<$Res>  {
$SubmitProfileEventCopyWith(SubmitProfileEvent _, $Res Function(SubmitProfileEvent) __);
}


/// Adds pattern-matching-related methods to [SubmitProfileEvent].
extension SubmitProfileEventPatterns on SubmitProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _UpdateProfile value)?  updateProfile,TResult Function( _UpdateProfileAcademic value)?  updateProfileAcademic,TResult Function( _UploadFoto value)?  uploadFoto,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _UpdateProfile() when updateProfile != null:
return updateProfile(_that);case _UpdateProfileAcademic() when updateProfileAcademic != null:
return updateProfileAcademic(_that);case _UploadFoto() when uploadFoto != null:
return uploadFoto(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _UpdateProfile value)  updateProfile,required TResult Function( _UpdateProfileAcademic value)  updateProfileAcademic,required TResult Function( _UploadFoto value)  uploadFoto,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _UpdateProfile():
return updateProfile(_that);case _UpdateProfileAcademic():
return updateProfileAcademic(_that);case _UploadFoto():
return uploadFoto(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _UpdateProfile value)?  updateProfile,TResult? Function( _UpdateProfileAcademic value)?  updateProfileAcademic,TResult? Function( _UploadFoto value)?  uploadFoto,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _UpdateProfile() when updateProfile != null:
return updateProfile(_that);case _UpdateProfileAcademic() when updateProfileAcademic != null:
return updateProfileAcademic(_that);case _UploadFoto() when uploadFoto != null:
return uploadFoto(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( UpdateProfileRequestModel request)?  updateProfile,TResult Function( UpdateProfileAcademicRequestModel request)?  updateProfileAcademic,TResult Function( XFile foto)?  uploadFoto,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _UpdateProfile() when updateProfile != null:
return updateProfile(_that.request);case _UpdateProfileAcademic() when updateProfileAcademic != null:
return updateProfileAcademic(_that.request);case _UploadFoto() when uploadFoto != null:
return uploadFoto(_that.foto);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( UpdateProfileRequestModel request)  updateProfile,required TResult Function( UpdateProfileAcademicRequestModel request)  updateProfileAcademic,required TResult Function( XFile foto)  uploadFoto,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _UpdateProfile():
return updateProfile(_that.request);case _UpdateProfileAcademic():
return updateProfileAcademic(_that.request);case _UploadFoto():
return uploadFoto(_that.foto);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( UpdateProfileRequestModel request)?  updateProfile,TResult? Function( UpdateProfileAcademicRequestModel request)?  updateProfileAcademic,TResult? Function( XFile foto)?  uploadFoto,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _UpdateProfile() when updateProfile != null:
return updateProfile(_that.request);case _UpdateProfileAcademic() when updateProfileAcademic != null:
return updateProfileAcademic(_that.request);case _UploadFoto() when uploadFoto != null:
return uploadFoto(_that.foto);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements SubmitProfileEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SubmitProfileEvent.started()';
}


}




/// @nodoc


class _UpdateProfile implements SubmitProfileEvent {
  const _UpdateProfile(this.request);
  

 final  UpdateProfileRequestModel request;

/// Create a copy of SubmitProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProfileCopyWith<_UpdateProfile> get copyWith => __$UpdateProfileCopyWithImpl<_UpdateProfile>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProfile&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode {
    return Object.hash(runtimeType,request);
}

@override
String toString() {
    return 'SubmitProfileEvent.updateProfile(request: $request)';
}


}

/// @nodoc
abstract mixin class _$UpdateProfileCopyWith<$Res> implements $SubmitProfileEventCopyWith<$Res> {
  factory _$UpdateProfileCopyWith(_UpdateProfile value, $Res Function(_UpdateProfile) _then) = __$UpdateProfileCopyWithImpl;
@useResult
$Res call({
 UpdateProfileRequestModel request
});




}
/// @nodoc
class __$UpdateProfileCopyWithImpl<$Res>
    implements _$UpdateProfileCopyWith<$Res> {
  __$UpdateProfileCopyWithImpl(this._self, this._then);

  final _UpdateProfile _self;
  final $Res Function(_UpdateProfile) _then;

/// Create a copy of SubmitProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(_UpdateProfile(
null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as UpdateProfileRequestModel,
  ));
}


}

/// @nodoc


class _UpdateProfileAcademic implements SubmitProfileEvent {
  const _UpdateProfileAcademic(this.request);
  

 final  UpdateProfileAcademicRequestModel request;

/// Create a copy of SubmitProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProfileAcademicCopyWith<_UpdateProfileAcademic> get copyWith => __$UpdateProfileAcademicCopyWithImpl<_UpdateProfileAcademic>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProfileAcademic&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode {
    return Object.hash(runtimeType,request);
}

@override
String toString() {
    return 'SubmitProfileEvent.updateProfileAcademic(request: $request)';
}


}

/// @nodoc
abstract mixin class _$UpdateProfileAcademicCopyWith<$Res> implements $SubmitProfileEventCopyWith<$Res> {
  factory _$UpdateProfileAcademicCopyWith(_UpdateProfileAcademic value, $Res Function(_UpdateProfileAcademic) _then) = __$UpdateProfileAcademicCopyWithImpl;
@useResult
$Res call({
 UpdateProfileAcademicRequestModel request
});




}
/// @nodoc
class __$UpdateProfileAcademicCopyWithImpl<$Res>
    implements _$UpdateProfileAcademicCopyWith<$Res> {
  __$UpdateProfileAcademicCopyWithImpl(this._self, this._then);

  final _UpdateProfileAcademic _self;
  final $Res Function(_UpdateProfileAcademic) _then;

/// Create a copy of SubmitProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(_UpdateProfileAcademic(
null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as UpdateProfileAcademicRequestModel,
  ));
}


}

/// @nodoc


class _UploadFoto implements SubmitProfileEvent {
  const _UploadFoto(this.foto);
  

 final  XFile foto;

/// Create a copy of SubmitProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadFotoCopyWith<_UploadFoto> get copyWith => __$UploadFotoCopyWithImpl<_UploadFoto>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadFoto&&(identical(other.foto, foto) || other.foto == foto));
}


@override
int get hashCode {
    return Object.hash(runtimeType,foto);
}

@override
String toString() {
    return 'SubmitProfileEvent.uploadFoto(foto: $foto)';
}


}

/// @nodoc
abstract mixin class _$UploadFotoCopyWith<$Res> implements $SubmitProfileEventCopyWith<$Res> {
  factory _$UploadFotoCopyWith(_UploadFoto value, $Res Function(_UploadFoto) _then) = __$UploadFotoCopyWithImpl;
@useResult
$Res call({
 XFile foto
});




}
/// @nodoc
class __$UploadFotoCopyWithImpl<$Res>
    implements _$UploadFotoCopyWith<$Res> {
  __$UploadFotoCopyWithImpl(this._self, this._then);

  final _UploadFoto _self;
  final $Res Function(_UploadFoto) _then;

/// Create a copy of SubmitProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? foto = null,}) {
  return _then(_UploadFoto(
null == foto ? _self.foto : foto // ignore: cast_nullable_to_non_nullable
as XFile,
  ));
}


}

/// @nodoc
mixin _$SubmitProfileState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SubmitProfileState()';
}


}

/// @nodoc
class $SubmitProfileStateCopyWith<$Res>  {
$SubmitProfileStateCopyWith(SubmitProfileState _, $Res Function(SubmitProfileState) __);
}


/// Adds pattern-matching-related methods to [SubmitProfileState].
extension SubmitProfileStatePatterns on SubmitProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( LoadingSubmitProfile value)?  loadingSubmitProfile,TResult Function( SubmitProfileSuccess value)?  submitProfileSuccess,TResult Function( ErrorSubmitProfile value)?  errorSubmitProfile,TResult Function( LoadingUploadFoto value)?  loadingUploadFoto,TResult Function( UploadFotoSuccess value)?  uploadFotoSuccess,TResult Function( ErrorUploadFoto value)?  errorUploadFoto,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case LoadingSubmitProfile() when loadingSubmitProfile != null:
return loadingSubmitProfile(_that);case SubmitProfileSuccess() when submitProfileSuccess != null:
return submitProfileSuccess(_that);case ErrorSubmitProfile() when errorSubmitProfile != null:
return errorSubmitProfile(_that);case LoadingUploadFoto() when loadingUploadFoto != null:
return loadingUploadFoto(_that);case UploadFotoSuccess() when uploadFotoSuccess != null:
return uploadFotoSuccess(_that);case ErrorUploadFoto() when errorUploadFoto != null:
return errorUploadFoto(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( LoadingSubmitProfile value)  loadingSubmitProfile,required TResult Function( SubmitProfileSuccess value)  submitProfileSuccess,required TResult Function( ErrorSubmitProfile value)  errorSubmitProfile,required TResult Function( LoadingUploadFoto value)  loadingUploadFoto,required TResult Function( UploadFotoSuccess value)  uploadFotoSuccess,required TResult Function( ErrorUploadFoto value)  errorUploadFoto,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case LoadingSubmitProfile():
return loadingSubmitProfile(_that);case SubmitProfileSuccess():
return submitProfileSuccess(_that);case ErrorSubmitProfile():
return errorSubmitProfile(_that);case LoadingUploadFoto():
return loadingUploadFoto(_that);case UploadFotoSuccess():
return uploadFotoSuccess(_that);case ErrorUploadFoto():
return errorUploadFoto(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( LoadingSubmitProfile value)?  loadingSubmitProfile,TResult? Function( SubmitProfileSuccess value)?  submitProfileSuccess,TResult? Function( ErrorSubmitProfile value)?  errorSubmitProfile,TResult? Function( LoadingUploadFoto value)?  loadingUploadFoto,TResult? Function( UploadFotoSuccess value)?  uploadFotoSuccess,TResult? Function( ErrorUploadFoto value)?  errorUploadFoto,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case LoadingSubmitProfile() when loadingSubmitProfile != null:
return loadingSubmitProfile(_that);case SubmitProfileSuccess() when submitProfileSuccess != null:
return submitProfileSuccess(_that);case ErrorSubmitProfile() when errorSubmitProfile != null:
return errorSubmitProfile(_that);case LoadingUploadFoto() when loadingUploadFoto != null:
return loadingUploadFoto(_that);case UploadFotoSuccess() when uploadFotoSuccess != null:
return uploadFotoSuccess(_that);case ErrorUploadFoto() when errorUploadFoto != null:
return errorUploadFoto(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loadingSubmitProfile,TResult Function( String message)?  submitProfileSuccess,TResult Function( String message)?  errorSubmitProfile,TResult Function()?  loadingUploadFoto,TResult Function( String message)?  uploadFotoSuccess,TResult Function( String message)?  errorUploadFoto,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case LoadingSubmitProfile() when loadingSubmitProfile != null:
return loadingSubmitProfile();case SubmitProfileSuccess() when submitProfileSuccess != null:
return submitProfileSuccess(_that.message);case ErrorSubmitProfile() when errorSubmitProfile != null:
return errorSubmitProfile(_that.message);case LoadingUploadFoto() when loadingUploadFoto != null:
return loadingUploadFoto();case UploadFotoSuccess() when uploadFotoSuccess != null:
return uploadFotoSuccess(_that.message);case ErrorUploadFoto() when errorUploadFoto != null:
return errorUploadFoto(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loadingSubmitProfile,required TResult Function( String message)  submitProfileSuccess,required TResult Function( String message)  errorSubmitProfile,required TResult Function()  loadingUploadFoto,required TResult Function( String message)  uploadFotoSuccess,required TResult Function( String message)  errorUploadFoto,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case LoadingSubmitProfile():
return loadingSubmitProfile();case SubmitProfileSuccess():
return submitProfileSuccess(_that.message);case ErrorSubmitProfile():
return errorSubmitProfile(_that.message);case LoadingUploadFoto():
return loadingUploadFoto();case UploadFotoSuccess():
return uploadFotoSuccess(_that.message);case ErrorUploadFoto():
return errorUploadFoto(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loadingSubmitProfile,TResult? Function( String message)?  submitProfileSuccess,TResult? Function( String message)?  errorSubmitProfile,TResult? Function()?  loadingUploadFoto,TResult? Function( String message)?  uploadFotoSuccess,TResult? Function( String message)?  errorUploadFoto,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case LoadingSubmitProfile() when loadingSubmitProfile != null:
return loadingSubmitProfile();case SubmitProfileSuccess() when submitProfileSuccess != null:
return submitProfileSuccess(_that.message);case ErrorSubmitProfile() when errorSubmitProfile != null:
return errorSubmitProfile(_that.message);case LoadingUploadFoto() when loadingUploadFoto != null:
return loadingUploadFoto();case UploadFotoSuccess() when uploadFotoSuccess != null:
return uploadFotoSuccess(_that.message);case ErrorUploadFoto() when errorUploadFoto != null:
return errorUploadFoto(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements SubmitProfileState {
  const Initial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SubmitProfileState.initial()';
}


}




/// @nodoc


class LoadingSubmitProfile implements SubmitProfileState {
  const LoadingSubmitProfile();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingSubmitProfile);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SubmitProfileState.loadingSubmitProfile()';
}


}




/// @nodoc


class SubmitProfileSuccess implements SubmitProfileState {
  const SubmitProfileSuccess(this.message);
  

 final  String message;

/// Create a copy of SubmitProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitProfileSuccessCopyWith<SubmitProfileSuccess> get copyWith => _$SubmitProfileSuccessCopyWithImpl<SubmitProfileSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitProfileSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'SubmitProfileState.submitProfileSuccess(message: $message)';
}


}

/// @nodoc
abstract mixin class $SubmitProfileSuccessCopyWith<$Res> implements $SubmitProfileStateCopyWith<$Res> {
  factory $SubmitProfileSuccessCopyWith(SubmitProfileSuccess value, $Res Function(SubmitProfileSuccess) _then) = _$SubmitProfileSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SubmitProfileSuccessCopyWithImpl<$Res>
    implements $SubmitProfileSuccessCopyWith<$Res> {
  _$SubmitProfileSuccessCopyWithImpl(this._self, this._then);

  final SubmitProfileSuccess _self;
  final $Res Function(SubmitProfileSuccess) _then;

/// Create a copy of SubmitProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SubmitProfileSuccess(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ErrorSubmitProfile implements SubmitProfileState {
  const ErrorSubmitProfile(this.message);
  

 final  String message;

/// Create a copy of SubmitProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorSubmitProfileCopyWith<ErrorSubmitProfile> get copyWith => _$ErrorSubmitProfileCopyWithImpl<ErrorSubmitProfile>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorSubmitProfile&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'SubmitProfileState.errorSubmitProfile(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorSubmitProfileCopyWith<$Res> implements $SubmitProfileStateCopyWith<$Res> {
  factory $ErrorSubmitProfileCopyWith(ErrorSubmitProfile value, $Res Function(ErrorSubmitProfile) _then) = _$ErrorSubmitProfileCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorSubmitProfileCopyWithImpl<$Res>
    implements $ErrorSubmitProfileCopyWith<$Res> {
  _$ErrorSubmitProfileCopyWithImpl(this._self, this._then);

  final ErrorSubmitProfile _self;
  final $Res Function(ErrorSubmitProfile) _then;

/// Create a copy of SubmitProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorSubmitProfile(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoadingUploadFoto implements SubmitProfileState {
  const LoadingUploadFoto();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingUploadFoto);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SubmitProfileState.loadingUploadFoto()';
}


}




/// @nodoc


class UploadFotoSuccess implements SubmitProfileState {
  const UploadFotoSuccess(this.message);
  

 final  String message;

/// Create a copy of SubmitProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadFotoSuccessCopyWith<UploadFotoSuccess> get copyWith => _$UploadFotoSuccessCopyWithImpl<UploadFotoSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadFotoSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'SubmitProfileState.uploadFotoSuccess(message: $message)';
}


}

/// @nodoc
abstract mixin class $UploadFotoSuccessCopyWith<$Res> implements $SubmitProfileStateCopyWith<$Res> {
  factory $UploadFotoSuccessCopyWith(UploadFotoSuccess value, $Res Function(UploadFotoSuccess) _then) = _$UploadFotoSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UploadFotoSuccessCopyWithImpl<$Res>
    implements $UploadFotoSuccessCopyWith<$Res> {
  _$UploadFotoSuccessCopyWithImpl(this._self, this._then);

  final UploadFotoSuccess _self;
  final $Res Function(UploadFotoSuccess) _then;

/// Create a copy of SubmitProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UploadFotoSuccess(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ErrorUploadFoto implements SubmitProfileState {
  const ErrorUploadFoto(this.message);
  

 final  String message;

/// Create a copy of SubmitProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorUploadFotoCopyWith<ErrorUploadFoto> get copyWith => _$ErrorUploadFotoCopyWithImpl<ErrorUploadFoto>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorUploadFoto&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'SubmitProfileState.errorUploadFoto(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorUploadFotoCopyWith<$Res> implements $SubmitProfileStateCopyWith<$Res> {
  factory $ErrorUploadFotoCopyWith(ErrorUploadFoto value, $Res Function(ErrorUploadFoto) _then) = _$ErrorUploadFotoCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorUploadFotoCopyWithImpl<$Res>
    implements $ErrorUploadFotoCopyWith<$Res> {
  _$ErrorUploadFotoCopyWithImpl(this._self, this._then);

  final ErrorUploadFoto _self;
  final $Res Function(ErrorUploadFoto) _then;

/// Create a copy of SubmitProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorUploadFoto(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
