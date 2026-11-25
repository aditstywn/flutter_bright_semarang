// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeEvent()';
}


}

/// @nodoc
class $HomeEventCopyWith<$Res>  {
$HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}


/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _GetDashboard value)?  getDashboard,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetDashboard() when getDashboard != null:
return getDashboard(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _GetDashboard value)  getDashboard,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _GetDashboard():
return getDashboard(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _GetDashboard value)?  getDashboard,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetDashboard() when getDashboard != null:
return getDashboard(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  getDashboard,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetDashboard() when getDashboard != null:
return getDashboard();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  getDashboard,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _GetDashboard():
return getDashboard();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  getDashboard,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetDashboard() when getDashboard != null:
return getDashboard();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements HomeEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeEvent.started()';
}


}




/// @nodoc


class _GetDashboard implements HomeEvent {
  const _GetDashboard();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetDashboard);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeEvent.getDashboard()';
}


}




/// @nodoc
mixin _$HomeState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeState()';
}


}

/// @nodoc
class $HomeStateCopyWith<$Res>  {
$HomeStateCopyWith(HomeState _, $Res Function(HomeState) __);
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( LoadingDashboard value)?  loadingDashboard,TResult Function( DashboardSucces value)?  dashboardSucces,TResult Function( ErrorHome value)?  errorHome,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case LoadingDashboard() when loadingDashboard != null:
return loadingDashboard(_that);case DashboardSucces() when dashboardSucces != null:
return dashboardSucces(_that);case ErrorHome() when errorHome != null:
return errorHome(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( LoadingDashboard value)  loadingDashboard,required TResult Function( DashboardSucces value)  dashboardSucces,required TResult Function( ErrorHome value)  errorHome,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case LoadingDashboard():
return loadingDashboard(_that);case DashboardSucces():
return dashboardSucces(_that);case ErrorHome():
return errorHome(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( LoadingDashboard value)?  loadingDashboard,TResult? Function( DashboardSucces value)?  dashboardSucces,TResult? Function( ErrorHome value)?  errorHome,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case LoadingDashboard() when loadingDashboard != null:
return loadingDashboard(_that);case DashboardSucces() when dashboardSucces != null:
return dashboardSucces(_that);case ErrorHome() when errorHome != null:
return errorHome(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loadingDashboard,TResult Function( DashboardResponseModel dashboard)?  dashboardSucces,TResult Function( String message)?  errorHome,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case LoadingDashboard() when loadingDashboard != null:
return loadingDashboard();case DashboardSucces() when dashboardSucces != null:
return dashboardSucces(_that.dashboard);case ErrorHome() when errorHome != null:
return errorHome(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loadingDashboard,required TResult Function( DashboardResponseModel dashboard)  dashboardSucces,required TResult Function( String message)  errorHome,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case LoadingDashboard():
return loadingDashboard();case DashboardSucces():
return dashboardSucces(_that.dashboard);case ErrorHome():
return errorHome(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loadingDashboard,TResult? Function( DashboardResponseModel dashboard)?  dashboardSucces,TResult? Function( String message)?  errorHome,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case LoadingDashboard() when loadingDashboard != null:
return loadingDashboard();case DashboardSucces() when dashboardSucces != null:
return dashboardSucces(_that.dashboard);case ErrorHome() when errorHome != null:
return errorHome(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements HomeState {
  const Initial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeState.initial()';
}


}




/// @nodoc


class LoadingDashboard implements HomeState {
  const LoadingDashboard();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingDashboard);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeState.loadingDashboard()';
}


}




/// @nodoc


class DashboardSucces implements HomeState {
  const DashboardSucces(this.dashboard);
  

 final  DashboardResponseModel dashboard;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardSuccesCopyWith<DashboardSucces> get copyWith => _$DashboardSuccesCopyWithImpl<DashboardSucces>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardSucces&&(identical(other.dashboard, dashboard) || other.dashboard == dashboard));
}


@override
int get hashCode {
    return Object.hash(runtimeType,dashboard);
}

@override
String toString() {
    return 'HomeState.dashboardSucces(dashboard: $dashboard)';
}


}

/// @nodoc
abstract mixin class $DashboardSuccesCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $DashboardSuccesCopyWith(DashboardSucces value, $Res Function(DashboardSucces) _then) = _$DashboardSuccesCopyWithImpl;
@useResult
$Res call({
 DashboardResponseModel dashboard
});




}
/// @nodoc
class _$DashboardSuccesCopyWithImpl<$Res>
    implements $DashboardSuccesCopyWith<$Res> {
  _$DashboardSuccesCopyWithImpl(this._self, this._then);

  final DashboardSucces _self;
  final $Res Function(DashboardSucces) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? dashboard = null,}) {
  return _then(DashboardSucces(
null == dashboard ? _self.dashboard : dashboard // ignore: cast_nullable_to_non_nullable
as DashboardResponseModel,
  ));
}


}

/// @nodoc


class ErrorHome implements HomeState {
  const ErrorHome(this.message);
  

 final  String message;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorHomeCopyWith<ErrorHome> get copyWith => _$ErrorHomeCopyWithImpl<ErrorHome>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorHome&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'HomeState.errorHome(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorHomeCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $ErrorHomeCopyWith(ErrorHome value, $Res Function(ErrorHome) _then) = _$ErrorHomeCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorHomeCopyWithImpl<$Res>
    implements $ErrorHomeCopyWith<$Res> {
  _$ErrorHomeCopyWithImpl(this._self, this._then);

  final ErrorHome _self;
  final $Res Function(ErrorHome) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorHome(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
