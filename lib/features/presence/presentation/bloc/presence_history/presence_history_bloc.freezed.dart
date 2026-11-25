// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presence_history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PresenceHistoryEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PresenceHistoryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PresenceHistoryEvent()';
}


}

/// @nodoc
class $PresenceHistoryEventCopyWith<$Res>  {
$PresenceHistoryEventCopyWith(PresenceHistoryEvent _, $Res Function(PresenceHistoryEvent) __);
}


/// Adds pattern-matching-related methods to [PresenceHistoryEvent].
extension PresenceHistoryEventPatterns on PresenceHistoryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _GetHistory value)?  getHistory,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetHistory() when getHistory != null:
return getHistory(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _GetHistory value)  getHistory,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _GetHistory():
return getHistory(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _GetHistory value)?  getHistory,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetHistory() when getHistory != null:
return getHistory(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( PresenceHistoryRequestModel request)?  getHistory,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetHistory() when getHistory != null:
return getHistory(_that.request);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( PresenceHistoryRequestModel request)  getHistory,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _GetHistory():
return getHistory(_that.request);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( PresenceHistoryRequestModel request)?  getHistory,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetHistory() when getHistory != null:
return getHistory(_that.request);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements PresenceHistoryEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PresenceHistoryEvent.started()';
}


}




/// @nodoc


class _GetHistory implements PresenceHistoryEvent {
  const _GetHistory(this.request);
  

 final  PresenceHistoryRequestModel request;

/// Create a copy of PresenceHistoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetHistoryCopyWith<_GetHistory> get copyWith => __$GetHistoryCopyWithImpl<_GetHistory>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetHistory&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode {
    return Object.hash(runtimeType,request);
}

@override
String toString() {
    return 'PresenceHistoryEvent.getHistory(request: $request)';
}


}

/// @nodoc
abstract mixin class _$GetHistoryCopyWith<$Res> implements $PresenceHistoryEventCopyWith<$Res> {
  factory _$GetHistoryCopyWith(_GetHistory value, $Res Function(_GetHistory) _then) = __$GetHistoryCopyWithImpl;
@useResult
$Res call({
 PresenceHistoryRequestModel request
});




}
/// @nodoc
class __$GetHistoryCopyWithImpl<$Res>
    implements _$GetHistoryCopyWith<$Res> {
  __$GetHistoryCopyWithImpl(this._self, this._then);

  final _GetHistory _self;
  final $Res Function(_GetHistory) _then;

/// Create a copy of PresenceHistoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(_GetHistory(
null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as PresenceHistoryRequestModel,
  ));
}


}

/// @nodoc
mixin _$PresenceHistoryState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PresenceHistoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PresenceHistoryState()';
}


}

/// @nodoc
class $PresenceHistoryStateCopyWith<$Res>  {
$PresenceHistoryStateCopyWith(PresenceHistoryState _, $Res Function(PresenceHistoryState) __);
}


/// Adds pattern-matching-related methods to [PresenceHistoryState].
extension PresenceHistoryStatePatterns on PresenceHistoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( LoadingPresenceHistory value)?  loadingPresenceHistory,TResult Function( PresenceHistorySuccess value)?  presenceHistorySuccess,TResult Function( ErrorPresenceHistory value)?  errorPresenceHistory,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case LoadingPresenceHistory() when loadingPresenceHistory != null:
return loadingPresenceHistory(_that);case PresenceHistorySuccess() when presenceHistorySuccess != null:
return presenceHistorySuccess(_that);case ErrorPresenceHistory() when errorPresenceHistory != null:
return errorPresenceHistory(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( LoadingPresenceHistory value)  loadingPresenceHistory,required TResult Function( PresenceHistorySuccess value)  presenceHistorySuccess,required TResult Function( ErrorPresenceHistory value)  errorPresenceHistory,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case LoadingPresenceHistory():
return loadingPresenceHistory(_that);case PresenceHistorySuccess():
return presenceHistorySuccess(_that);case ErrorPresenceHistory():
return errorPresenceHistory(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( LoadingPresenceHistory value)?  loadingPresenceHistory,TResult? Function( PresenceHistorySuccess value)?  presenceHistorySuccess,TResult? Function( ErrorPresenceHistory value)?  errorPresenceHistory,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case LoadingPresenceHistory() when loadingPresenceHistory != null:
return loadingPresenceHistory(_that);case PresenceHistorySuccess() when presenceHistorySuccess != null:
return presenceHistorySuccess(_that);case ErrorPresenceHistory() when errorPresenceHistory != null:
return errorPresenceHistory(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loadingPresenceHistory,TResult Function( PresenceHistoryResponseModel history)?  presenceHistorySuccess,TResult Function( String message)?  errorPresenceHistory,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case LoadingPresenceHistory() when loadingPresenceHistory != null:
return loadingPresenceHistory();case PresenceHistorySuccess() when presenceHistorySuccess != null:
return presenceHistorySuccess(_that.history);case ErrorPresenceHistory() when errorPresenceHistory != null:
return errorPresenceHistory(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loadingPresenceHistory,required TResult Function( PresenceHistoryResponseModel history)  presenceHistorySuccess,required TResult Function( String message)  errorPresenceHistory,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case LoadingPresenceHistory():
return loadingPresenceHistory();case PresenceHistorySuccess():
return presenceHistorySuccess(_that.history);case ErrorPresenceHistory():
return errorPresenceHistory(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loadingPresenceHistory,TResult? Function( PresenceHistoryResponseModel history)?  presenceHistorySuccess,TResult? Function( String message)?  errorPresenceHistory,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case LoadingPresenceHistory() when loadingPresenceHistory != null:
return loadingPresenceHistory();case PresenceHistorySuccess() when presenceHistorySuccess != null:
return presenceHistorySuccess(_that.history);case ErrorPresenceHistory() when errorPresenceHistory != null:
return errorPresenceHistory(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements PresenceHistoryState {
  const Initial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PresenceHistoryState.initial()';
}


}




/// @nodoc


class LoadingPresenceHistory implements PresenceHistoryState {
  const LoadingPresenceHistory();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingPresenceHistory);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PresenceHistoryState.loadingPresenceHistory()';
}


}




/// @nodoc


class PresenceHistorySuccess implements PresenceHistoryState {
  const PresenceHistorySuccess(this.history);
  

 final  PresenceHistoryResponseModel history;

/// Create a copy of PresenceHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresenceHistorySuccessCopyWith<PresenceHistorySuccess> get copyWith => _$PresenceHistorySuccessCopyWithImpl<PresenceHistorySuccess>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PresenceHistorySuccess&&(identical(other.history, history) || other.history == history));
}


@override
int get hashCode {
    return Object.hash(runtimeType,history);
}

@override
String toString() {
    return 'PresenceHistoryState.presenceHistorySuccess(history: $history)';
}


}

/// @nodoc
abstract mixin class $PresenceHistorySuccessCopyWith<$Res> implements $PresenceHistoryStateCopyWith<$Res> {
  factory $PresenceHistorySuccessCopyWith(PresenceHistorySuccess value, $Res Function(PresenceHistorySuccess) _then) = _$PresenceHistorySuccessCopyWithImpl;
@useResult
$Res call({
 PresenceHistoryResponseModel history
});




}
/// @nodoc
class _$PresenceHistorySuccessCopyWithImpl<$Res>
    implements $PresenceHistorySuccessCopyWith<$Res> {
  _$PresenceHistorySuccessCopyWithImpl(this._self, this._then);

  final PresenceHistorySuccess _self;
  final $Res Function(PresenceHistorySuccess) _then;

/// Create a copy of PresenceHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? history = null,}) {
  return _then(PresenceHistorySuccess(
null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as PresenceHistoryResponseModel,
  ));
}


}

/// @nodoc


class ErrorPresenceHistory implements PresenceHistoryState {
  const ErrorPresenceHistory(this.message);
  

 final  String message;

/// Create a copy of PresenceHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorPresenceHistoryCopyWith<ErrorPresenceHistory> get copyWith => _$ErrorPresenceHistoryCopyWithImpl<ErrorPresenceHistory>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorPresenceHistory&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'PresenceHistoryState.errorPresenceHistory(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorPresenceHistoryCopyWith<$Res> implements $PresenceHistoryStateCopyWith<$Res> {
  factory $ErrorPresenceHistoryCopyWith(ErrorPresenceHistory value, $Res Function(ErrorPresenceHistory) _then) = _$ErrorPresenceHistoryCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorPresenceHistoryCopyWithImpl<$Res>
    implements $ErrorPresenceHistoryCopyWith<$Res> {
  _$ErrorPresenceHistoryCopyWithImpl(this._self, this._then);

  final ErrorPresenceHistory _self;
  final $Res Function(ErrorPresenceHistory) _then;

/// Create a copy of PresenceHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorPresenceHistory(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
