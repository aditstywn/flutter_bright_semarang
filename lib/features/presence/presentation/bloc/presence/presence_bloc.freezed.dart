// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presence_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PresenceEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PresenceEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PresenceEvent()';
}


}

/// @nodoc
class $PresenceEventCopyWith<$Res>  {
$PresenceEventCopyWith(PresenceEvent _, $Res Function(PresenceEvent) __);
}


/// Adds pattern-matching-related methods to [PresenceEvent].
extension PresenceEventPatterns on PresenceEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _CheckIn value)?  checkIn,TResult Function( _CheckOut value)?  checkOut,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _CheckIn() when checkIn != null:
return checkIn(_that);case _CheckOut() when checkOut != null:
return checkOut(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _CheckIn value)  checkIn,required TResult Function( _CheckOut value)  checkOut,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _CheckIn():
return checkIn(_that);case _CheckOut():
return checkOut(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _CheckIn value)?  checkIn,TResult? Function( _CheckOut value)?  checkOut,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _CheckIn() when checkIn != null:
return checkIn(_that);case _CheckOut() when checkOut != null:
return checkOut(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( PresenceRequestModel request)?  checkIn,TResult Function( PresenceRequestModel request)?  checkOut,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _CheckIn() when checkIn != null:
return checkIn(_that.request);case _CheckOut() when checkOut != null:
return checkOut(_that.request);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( PresenceRequestModel request)  checkIn,required TResult Function( PresenceRequestModel request)  checkOut,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _CheckIn():
return checkIn(_that.request);case _CheckOut():
return checkOut(_that.request);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( PresenceRequestModel request)?  checkIn,TResult? Function( PresenceRequestModel request)?  checkOut,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _CheckIn() when checkIn != null:
return checkIn(_that.request);case _CheckOut() when checkOut != null:
return checkOut(_that.request);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements PresenceEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PresenceEvent.started()';
}


}




/// @nodoc


class _CheckIn implements PresenceEvent {
  const _CheckIn(this.request);
  

 final  PresenceRequestModel request;

/// Create a copy of PresenceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckInCopyWith<_CheckIn> get copyWith => __$CheckInCopyWithImpl<_CheckIn>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckIn&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode {
    return Object.hash(runtimeType,request);
}

@override
String toString() {
    return 'PresenceEvent.checkIn(request: $request)';
}


}

/// @nodoc
abstract mixin class _$CheckInCopyWith<$Res> implements $PresenceEventCopyWith<$Res> {
  factory _$CheckInCopyWith(_CheckIn value, $Res Function(_CheckIn) _then) = __$CheckInCopyWithImpl;
@useResult
$Res call({
 PresenceRequestModel request
});




}
/// @nodoc
class __$CheckInCopyWithImpl<$Res>
    implements _$CheckInCopyWith<$Res> {
  __$CheckInCopyWithImpl(this._self, this._then);

  final _CheckIn _self;
  final $Res Function(_CheckIn) _then;

/// Create a copy of PresenceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(_CheckIn(
null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as PresenceRequestModel,
  ));
}


}

/// @nodoc


class _CheckOut implements PresenceEvent {
  const _CheckOut(this.request);
  

 final  PresenceRequestModel request;

/// Create a copy of PresenceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckOutCopyWith<_CheckOut> get copyWith => __$CheckOutCopyWithImpl<_CheckOut>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckOut&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode {
    return Object.hash(runtimeType,request);
}

@override
String toString() {
    return 'PresenceEvent.checkOut(request: $request)';
}


}

/// @nodoc
abstract mixin class _$CheckOutCopyWith<$Res> implements $PresenceEventCopyWith<$Res> {
  factory _$CheckOutCopyWith(_CheckOut value, $Res Function(_CheckOut) _then) = __$CheckOutCopyWithImpl;
@useResult
$Res call({
 PresenceRequestModel request
});




}
/// @nodoc
class __$CheckOutCopyWithImpl<$Res>
    implements _$CheckOutCopyWith<$Res> {
  __$CheckOutCopyWithImpl(this._self, this._then);

  final _CheckOut _self;
  final $Res Function(_CheckOut) _then;

/// Create a copy of PresenceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(_CheckOut(
null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as PresenceRequestModel,
  ));
}


}

/// @nodoc
mixin _$PresenceState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PresenceState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PresenceState()';
}


}

/// @nodoc
class $PresenceStateCopyWith<$Res>  {
$PresenceStateCopyWith(PresenceState _, $Res Function(PresenceState) __);
}


/// Adds pattern-matching-related methods to [PresenceState].
extension PresenceStatePatterns on PresenceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( LoadingPresence value)?  loadingPresence,TResult Function( PresenceSuccess value)?  presenceSuccess,TResult Function( ErrorPresence value)?  errorPresence,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case LoadingPresence() when loadingPresence != null:
return loadingPresence(_that);case PresenceSuccess() when presenceSuccess != null:
return presenceSuccess(_that);case ErrorPresence() when errorPresence != null:
return errorPresence(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( LoadingPresence value)  loadingPresence,required TResult Function( PresenceSuccess value)  presenceSuccess,required TResult Function( ErrorPresence value)  errorPresence,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case LoadingPresence():
return loadingPresence(_that);case PresenceSuccess():
return presenceSuccess(_that);case ErrorPresence():
return errorPresence(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( LoadingPresence value)?  loadingPresence,TResult? Function( PresenceSuccess value)?  presenceSuccess,TResult? Function( ErrorPresence value)?  errorPresence,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case LoadingPresence() when loadingPresence != null:
return loadingPresence(_that);case PresenceSuccess() when presenceSuccess != null:
return presenceSuccess(_that);case ErrorPresence() when errorPresence != null:
return errorPresence(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loadingPresence,TResult Function( PresenceResponseModel presence)?  presenceSuccess,TResult Function( String message)?  errorPresence,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case LoadingPresence() when loadingPresence != null:
return loadingPresence();case PresenceSuccess() when presenceSuccess != null:
return presenceSuccess(_that.presence);case ErrorPresence() when errorPresence != null:
return errorPresence(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loadingPresence,required TResult Function( PresenceResponseModel presence)  presenceSuccess,required TResult Function( String message)  errorPresence,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case LoadingPresence():
return loadingPresence();case PresenceSuccess():
return presenceSuccess(_that.presence);case ErrorPresence():
return errorPresence(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loadingPresence,TResult? Function( PresenceResponseModel presence)?  presenceSuccess,TResult? Function( String message)?  errorPresence,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case LoadingPresence() when loadingPresence != null:
return loadingPresence();case PresenceSuccess() when presenceSuccess != null:
return presenceSuccess(_that.presence);case ErrorPresence() when errorPresence != null:
return errorPresence(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements PresenceState {
  const Initial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PresenceState.initial()';
}


}




/// @nodoc


class LoadingPresence implements PresenceState {
  const LoadingPresence();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingPresence);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PresenceState.loadingPresence()';
}


}




/// @nodoc


class PresenceSuccess implements PresenceState {
  const PresenceSuccess(this.presence);
  

 final  PresenceResponseModel presence;

/// Create a copy of PresenceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresenceSuccessCopyWith<PresenceSuccess> get copyWith => _$PresenceSuccessCopyWithImpl<PresenceSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PresenceSuccess&&(identical(other.presence, presence) || other.presence == presence));
}


@override
int get hashCode {
    return Object.hash(runtimeType,presence);
}

@override
String toString() {
    return 'PresenceState.presenceSuccess(presence: $presence)';
}


}

/// @nodoc
abstract mixin class $PresenceSuccessCopyWith<$Res> implements $PresenceStateCopyWith<$Res> {
  factory $PresenceSuccessCopyWith(PresenceSuccess value, $Res Function(PresenceSuccess) _then) = _$PresenceSuccessCopyWithImpl;
@useResult
$Res call({
 PresenceResponseModel presence
});




}
/// @nodoc
class _$PresenceSuccessCopyWithImpl<$Res>
    implements $PresenceSuccessCopyWith<$Res> {
  _$PresenceSuccessCopyWithImpl(this._self, this._then);

  final PresenceSuccess _self;
  final $Res Function(PresenceSuccess) _then;

/// Create a copy of PresenceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? presence = null,}) {
  return _then(PresenceSuccess(
null == presence ? _self.presence : presence // ignore: cast_nullable_to_non_nullable
as PresenceResponseModel,
  ));
}


}

/// @nodoc


class ErrorPresence implements PresenceState {
  const ErrorPresence(this.message);
  

 final  String message;

/// Create a copy of PresenceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorPresenceCopyWith<ErrorPresence> get copyWith => _$ErrorPresenceCopyWithImpl<ErrorPresence>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorPresence&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'PresenceState.errorPresence(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorPresenceCopyWith<$Res> implements $PresenceStateCopyWith<$Res> {
  factory $ErrorPresenceCopyWith(ErrorPresence value, $Res Function(ErrorPresence) _then) = _$ErrorPresenceCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorPresenceCopyWithImpl<$Res>
    implements $ErrorPresenceCopyWith<$Res> {
  _$ErrorPresenceCopyWithImpl(this._self, this._then);

  final ErrorPresence _self;
  final $Res Function(ErrorPresence) _then;

/// Create a copy of PresenceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorPresence(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
