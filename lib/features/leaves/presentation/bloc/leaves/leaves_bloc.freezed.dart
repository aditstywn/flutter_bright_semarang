// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaves_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LeavesEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LeavesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LeavesEvent()';
}


}

/// @nodoc
class $LeavesEventCopyWith<$Res>  {
$LeavesEventCopyWith(LeavesEvent _, $Res Function(LeavesEvent) __);
}


/// Adds pattern-matching-related methods to [LeavesEvent].
extension LeavesEventPatterns on LeavesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _GetLeaves value)?  getLeaves,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetLeaves() when getLeaves != null:
return getLeaves(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _GetLeaves value)  getLeaves,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _GetLeaves():
return getLeaves(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _GetLeaves value)?  getLeaves,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetLeaves() when getLeaves != null:
return getLeaves(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  getLeaves,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetLeaves() when getLeaves != null:
return getLeaves();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  getLeaves,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _GetLeaves():
return getLeaves();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  getLeaves,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetLeaves() when getLeaves != null:
return getLeaves();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements LeavesEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LeavesEvent.started()';
}


}




/// @nodoc


class _GetLeaves implements LeavesEvent {
  const _GetLeaves();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetLeaves);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LeavesEvent.getLeaves()';
}


}




/// @nodoc
mixin _$LeavesState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LeavesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LeavesState()';
}


}

/// @nodoc
class $LeavesStateCopyWith<$Res>  {
$LeavesStateCopyWith(LeavesState _, $Res Function(LeavesState) __);
}


/// Adds pattern-matching-related methods to [LeavesState].
extension LeavesStatePatterns on LeavesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( LoadingLeaves value)?  loadingLeaves,TResult Function( LeavesSuccess value)?  leavesSuccess,TResult Function( ErrorLeaves value)?  errorLeaves,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case LoadingLeaves() when loadingLeaves != null:
return loadingLeaves(_that);case LeavesSuccess() when leavesSuccess != null:
return leavesSuccess(_that);case ErrorLeaves() when errorLeaves != null:
return errorLeaves(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( LoadingLeaves value)  loadingLeaves,required TResult Function( LeavesSuccess value)  leavesSuccess,required TResult Function( ErrorLeaves value)  errorLeaves,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case LoadingLeaves():
return loadingLeaves(_that);case LeavesSuccess():
return leavesSuccess(_that);case ErrorLeaves():
return errorLeaves(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( LoadingLeaves value)?  loadingLeaves,TResult? Function( LeavesSuccess value)?  leavesSuccess,TResult? Function( ErrorLeaves value)?  errorLeaves,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case LoadingLeaves() when loadingLeaves != null:
return loadingLeaves(_that);case LeavesSuccess() when leavesSuccess != null:
return leavesSuccess(_that);case ErrorLeaves() when errorLeaves != null:
return errorLeaves(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loadingLeaves,TResult Function( LeavesResponseModel leaves)?  leavesSuccess,TResult Function( String message)?  errorLeaves,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case LoadingLeaves() when loadingLeaves != null:
return loadingLeaves();case LeavesSuccess() when leavesSuccess != null:
return leavesSuccess(_that.leaves);case ErrorLeaves() when errorLeaves != null:
return errorLeaves(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loadingLeaves,required TResult Function( LeavesResponseModel leaves)  leavesSuccess,required TResult Function( String message)  errorLeaves,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case LoadingLeaves():
return loadingLeaves();case LeavesSuccess():
return leavesSuccess(_that.leaves);case ErrorLeaves():
return errorLeaves(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loadingLeaves,TResult? Function( LeavesResponseModel leaves)?  leavesSuccess,TResult? Function( String message)?  errorLeaves,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case LoadingLeaves() when loadingLeaves != null:
return loadingLeaves();case LeavesSuccess() when leavesSuccess != null:
return leavesSuccess(_that.leaves);case ErrorLeaves() when errorLeaves != null:
return errorLeaves(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements LeavesState {
  const Initial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LeavesState.initial()';
}


}




/// @nodoc


class LoadingLeaves implements LeavesState {
  const LoadingLeaves();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingLeaves);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LeavesState.loadingLeaves()';
}


}




/// @nodoc


class LeavesSuccess implements LeavesState {
  const LeavesSuccess(this.leaves);
  

 final  LeavesResponseModel leaves;

/// Create a copy of LeavesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeavesSuccessCopyWith<LeavesSuccess> get copyWith => _$LeavesSuccessCopyWithImpl<LeavesSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LeavesSuccess&&(identical(other.leaves, leaves) || other.leaves == leaves));
}


@override
int get hashCode {
    return Object.hash(runtimeType,leaves);
}

@override
String toString() {
    return 'LeavesState.leavesSuccess(leaves: $leaves)';
}


}

/// @nodoc
abstract mixin class $LeavesSuccessCopyWith<$Res> implements $LeavesStateCopyWith<$Res> {
  factory $LeavesSuccessCopyWith(LeavesSuccess value, $Res Function(LeavesSuccess) _then) = _$LeavesSuccessCopyWithImpl;
@useResult
$Res call({
 LeavesResponseModel leaves
});




}
/// @nodoc
class _$LeavesSuccessCopyWithImpl<$Res>
    implements $LeavesSuccessCopyWith<$Res> {
  _$LeavesSuccessCopyWithImpl(this._self, this._then);

  final LeavesSuccess _self;
  final $Res Function(LeavesSuccess) _then;

/// Create a copy of LeavesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? leaves = null,}) {
  return _then(LeavesSuccess(
null == leaves ? _self.leaves : leaves // ignore: cast_nullable_to_non_nullable
as LeavesResponseModel,
  ));
}


}

/// @nodoc


class ErrorLeaves implements LeavesState {
  const ErrorLeaves(this.message);
  

 final  String message;

/// Create a copy of LeavesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorLeavesCopyWith<ErrorLeaves> get copyWith => _$ErrorLeavesCopyWithImpl<ErrorLeaves>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorLeaves&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'LeavesState.errorLeaves(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorLeavesCopyWith<$Res> implements $LeavesStateCopyWith<$Res> {
  factory $ErrorLeavesCopyWith(ErrorLeaves value, $Res Function(ErrorLeaves) _then) = _$ErrorLeavesCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorLeavesCopyWithImpl<$Res>
    implements $ErrorLeavesCopyWith<$Res> {
  _$ErrorLeavesCopyWithImpl(this._self, this._then);

  final ErrorLeaves _self;
  final $Res Function(ErrorLeaves) _then;

/// Create a copy of LeavesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorLeaves(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
