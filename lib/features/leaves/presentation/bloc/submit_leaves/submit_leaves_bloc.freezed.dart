// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_leaves_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubmitLeavesEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitLeavesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SubmitLeavesEvent()';
}


}

/// @nodoc
class $SubmitLeavesEventCopyWith<$Res>  {
$SubmitLeavesEventCopyWith(SubmitLeavesEvent _, $Res Function(SubmitLeavesEvent) __);
}


/// Adds pattern-matching-related methods to [SubmitLeavesEvent].
extension SubmitLeavesEventPatterns on SubmitLeavesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _Submit value)?  submit,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Submit() when submit != null:
return submit(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _Submit value)  submit,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _Submit():
return submit(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _Submit value)?  submit,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Submit() when submit != null:
return submit(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( CreateLeavesRequestModel request)?  submit,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Submit() when submit != null:
return submit(_that.request);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( CreateLeavesRequestModel request)  submit,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _Submit():
return submit(_that.request);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( CreateLeavesRequestModel request)?  submit,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Submit() when submit != null:
return submit(_that.request);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements SubmitLeavesEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SubmitLeavesEvent.started()';
}


}




/// @nodoc


class _Submit implements SubmitLeavesEvent {
  const _Submit(this.request);
  

 final  CreateLeavesRequestModel request;

/// Create a copy of SubmitLeavesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitCopyWith<_Submit> get copyWith => __$SubmitCopyWithImpl<_Submit>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Submit&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode {
    return Object.hash(runtimeType,request);
}

@override
String toString() {
    return 'SubmitLeavesEvent.submit(request: $request)';
}


}

/// @nodoc
abstract mixin class _$SubmitCopyWith<$Res> implements $SubmitLeavesEventCopyWith<$Res> {
  factory _$SubmitCopyWith(_Submit value, $Res Function(_Submit) _then) = __$SubmitCopyWithImpl;
@useResult
$Res call({
 CreateLeavesRequestModel request
});




}
/// @nodoc
class __$SubmitCopyWithImpl<$Res>
    implements _$SubmitCopyWith<$Res> {
  __$SubmitCopyWithImpl(this._self, this._then);

  final _Submit _self;
  final $Res Function(_Submit) _then;

/// Create a copy of SubmitLeavesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(_Submit(
null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as CreateLeavesRequestModel,
  ));
}


}

/// @nodoc
mixin _$SubmitLeavesState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitLeavesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SubmitLeavesState()';
}


}

/// @nodoc
class $SubmitLeavesStateCopyWith<$Res>  {
$SubmitLeavesStateCopyWith(SubmitLeavesState _, $Res Function(SubmitLeavesState) __);
}


/// Adds pattern-matching-related methods to [SubmitLeavesState].
extension SubmitLeavesStatePatterns on SubmitLeavesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( LoadingSubmitLeaves value)?  loadingSubmitLeaves,TResult Function( SubmitLeavesSuccess value)?  submitLeavesSuccess,TResult Function( ErrorSubmitLeaves value)?  errorSubmitLeaves,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case LoadingSubmitLeaves() when loadingSubmitLeaves != null:
return loadingSubmitLeaves(_that);case SubmitLeavesSuccess() when submitLeavesSuccess != null:
return submitLeavesSuccess(_that);case ErrorSubmitLeaves() when errorSubmitLeaves != null:
return errorSubmitLeaves(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( LoadingSubmitLeaves value)  loadingSubmitLeaves,required TResult Function( SubmitLeavesSuccess value)  submitLeavesSuccess,required TResult Function( ErrorSubmitLeaves value)  errorSubmitLeaves,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case LoadingSubmitLeaves():
return loadingSubmitLeaves(_that);case SubmitLeavesSuccess():
return submitLeavesSuccess(_that);case ErrorSubmitLeaves():
return errorSubmitLeaves(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( LoadingSubmitLeaves value)?  loadingSubmitLeaves,TResult? Function( SubmitLeavesSuccess value)?  submitLeavesSuccess,TResult? Function( ErrorSubmitLeaves value)?  errorSubmitLeaves,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case LoadingSubmitLeaves() when loadingSubmitLeaves != null:
return loadingSubmitLeaves(_that);case SubmitLeavesSuccess() when submitLeavesSuccess != null:
return submitLeavesSuccess(_that);case ErrorSubmitLeaves() when errorSubmitLeaves != null:
return errorSubmitLeaves(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loadingSubmitLeaves,TResult Function( CreateLeavesResponseModel response)?  submitLeavesSuccess,TResult Function( String message)?  errorSubmitLeaves,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case LoadingSubmitLeaves() when loadingSubmitLeaves != null:
return loadingSubmitLeaves();case SubmitLeavesSuccess() when submitLeavesSuccess != null:
return submitLeavesSuccess(_that.response);case ErrorSubmitLeaves() when errorSubmitLeaves != null:
return errorSubmitLeaves(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loadingSubmitLeaves,required TResult Function( CreateLeavesResponseModel response)  submitLeavesSuccess,required TResult Function( String message)  errorSubmitLeaves,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case LoadingSubmitLeaves():
return loadingSubmitLeaves();case SubmitLeavesSuccess():
return submitLeavesSuccess(_that.response);case ErrorSubmitLeaves():
return errorSubmitLeaves(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loadingSubmitLeaves,TResult? Function( CreateLeavesResponseModel response)?  submitLeavesSuccess,TResult? Function( String message)?  errorSubmitLeaves,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case LoadingSubmitLeaves() when loadingSubmitLeaves != null:
return loadingSubmitLeaves();case SubmitLeavesSuccess() when submitLeavesSuccess != null:
return submitLeavesSuccess(_that.response);case ErrorSubmitLeaves() when errorSubmitLeaves != null:
return errorSubmitLeaves(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements SubmitLeavesState {
  const Initial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SubmitLeavesState.initial()';
}


}




/// @nodoc


class LoadingSubmitLeaves implements SubmitLeavesState {
  const LoadingSubmitLeaves();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingSubmitLeaves);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SubmitLeavesState.loadingSubmitLeaves()';
}


}




/// @nodoc


class SubmitLeavesSuccess implements SubmitLeavesState {
  const SubmitLeavesSuccess(this.response);
  

 final  CreateLeavesResponseModel response;

/// Create a copy of SubmitLeavesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitLeavesSuccessCopyWith<SubmitLeavesSuccess> get copyWith => _$SubmitLeavesSuccessCopyWithImpl<SubmitLeavesSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitLeavesSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode {
    return Object.hash(runtimeType,response);
}

@override
String toString() {
    return 'SubmitLeavesState.submitLeavesSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $SubmitLeavesSuccessCopyWith<$Res> implements $SubmitLeavesStateCopyWith<$Res> {
  factory $SubmitLeavesSuccessCopyWith(SubmitLeavesSuccess value, $Res Function(SubmitLeavesSuccess) _then) = _$SubmitLeavesSuccessCopyWithImpl;
@useResult
$Res call({
 CreateLeavesResponseModel response
});




}
/// @nodoc
class _$SubmitLeavesSuccessCopyWithImpl<$Res>
    implements $SubmitLeavesSuccessCopyWith<$Res> {
  _$SubmitLeavesSuccessCopyWithImpl(this._self, this._then);

  final SubmitLeavesSuccess _self;
  final $Res Function(SubmitLeavesSuccess) _then;

/// Create a copy of SubmitLeavesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(SubmitLeavesSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as CreateLeavesResponseModel,
  ));
}


}

/// @nodoc


class ErrorSubmitLeaves implements SubmitLeavesState {
  const ErrorSubmitLeaves(this.message);
  

 final  String message;

/// Create a copy of SubmitLeavesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorSubmitLeavesCopyWith<ErrorSubmitLeaves> get copyWith => _$ErrorSubmitLeavesCopyWithImpl<ErrorSubmitLeaves>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorSubmitLeaves&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'SubmitLeavesState.errorSubmitLeaves(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorSubmitLeavesCopyWith<$Res> implements $SubmitLeavesStateCopyWith<$Res> {
  factory $ErrorSubmitLeavesCopyWith(ErrorSubmitLeaves value, $Res Function(ErrorSubmitLeaves) _then) = _$ErrorSubmitLeavesCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorSubmitLeavesCopyWithImpl<$Res>
    implements $ErrorSubmitLeavesCopyWith<$Res> {
  _$ErrorSubmitLeavesCopyWithImpl(this._self, this._then);

  final ErrorSubmitLeaves _self;
  final $Res Function(ErrorSubmitLeaves) _then;

/// Create a copy of SubmitLeavesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorSubmitLeaves(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
