// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'autg_gate_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthGateStates {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function() toSplash,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function()? toSplash,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? toSplash,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthGateInitial value) initial,
    required TResult Function(_AuthGateLoading value) loading,
    required TResult Function(_AuthGateError value) error,
    required TResult Function(_AuthGateToSplash value) toSplash,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthGateInitial value)? initial,
    TResult? Function(_AuthGateLoading value)? loading,
    TResult? Function(_AuthGateError value)? error,
    TResult? Function(_AuthGateToSplash value)? toSplash,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthGateInitial value)? initial,
    TResult Function(_AuthGateLoading value)? loading,
    TResult Function(_AuthGateError value)? error,
    TResult Function(_AuthGateToSplash value)? toSplash,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthGateStatesCopyWith<$Res> {
  factory $AuthGateStatesCopyWith(
          AuthGateStates value, $Res Function(AuthGateStates) then) =
      _$AuthGateStatesCopyWithImpl<$Res, AuthGateStates>;
}

/// @nodoc
class _$AuthGateStatesCopyWithImpl<$Res, $Val extends AuthGateStates>
    implements $AuthGateStatesCopyWith<$Res> {
  _$AuthGateStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AuthGateInitialCopyWith<$Res> {
  factory _$$_AuthGateInitialCopyWith(
          _$_AuthGateInitial value, $Res Function(_$_AuthGateInitial) then) =
      __$$_AuthGateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthGateInitialCopyWithImpl<$Res>
    extends _$AuthGateStatesCopyWithImpl<$Res, _$_AuthGateInitial>
    implements _$$_AuthGateInitialCopyWith<$Res> {
  __$$_AuthGateInitialCopyWithImpl(
      _$_AuthGateInitial _value, $Res Function(_$_AuthGateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AuthGateInitial implements _AuthGateInitial {
  const _$_AuthGateInitial();

  @override
  String toString() {
    return 'AuthGateStates.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AuthGateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function() toSplash,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function()? toSplash,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? toSplash,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthGateInitial value) initial,
    required TResult Function(_AuthGateLoading value) loading,
    required TResult Function(_AuthGateError value) error,
    required TResult Function(_AuthGateToSplash value) toSplash,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthGateInitial value)? initial,
    TResult? Function(_AuthGateLoading value)? loading,
    TResult? Function(_AuthGateError value)? error,
    TResult? Function(_AuthGateToSplash value)? toSplash,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthGateInitial value)? initial,
    TResult Function(_AuthGateLoading value)? loading,
    TResult Function(_AuthGateError value)? error,
    TResult Function(_AuthGateToSplash value)? toSplash,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _AuthGateInitial implements AuthGateStates {
  const factory _AuthGateInitial() = _$_AuthGateInitial;
}

/// @nodoc
abstract class _$$_AuthGateLoadingCopyWith<$Res> {
  factory _$$_AuthGateLoadingCopyWith(
          _$_AuthGateLoading value, $Res Function(_$_AuthGateLoading) then) =
      __$$_AuthGateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthGateLoadingCopyWithImpl<$Res>
    extends _$AuthGateStatesCopyWithImpl<$Res, _$_AuthGateLoading>
    implements _$$_AuthGateLoadingCopyWith<$Res> {
  __$$_AuthGateLoadingCopyWithImpl(
      _$_AuthGateLoading _value, $Res Function(_$_AuthGateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AuthGateLoading implements _AuthGateLoading {
  const _$_AuthGateLoading();

  @override
  String toString() {
    return 'AuthGateStates.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AuthGateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function() toSplash,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function()? toSplash,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? toSplash,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthGateInitial value) initial,
    required TResult Function(_AuthGateLoading value) loading,
    required TResult Function(_AuthGateError value) error,
    required TResult Function(_AuthGateToSplash value) toSplash,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthGateInitial value)? initial,
    TResult? Function(_AuthGateLoading value)? loading,
    TResult? Function(_AuthGateError value)? error,
    TResult? Function(_AuthGateToSplash value)? toSplash,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthGateInitial value)? initial,
    TResult Function(_AuthGateLoading value)? loading,
    TResult Function(_AuthGateError value)? error,
    TResult Function(_AuthGateToSplash value)? toSplash,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _AuthGateLoading implements AuthGateStates {
  const factory _AuthGateLoading() = _$_AuthGateLoading;
}

/// @nodoc
abstract class _$$_AuthGateErrorCopyWith<$Res> {
  factory _$$_AuthGateErrorCopyWith(
          _$_AuthGateError value, $Res Function(_$_AuthGateError) then) =
      __$$_AuthGateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$_AuthGateErrorCopyWithImpl<$Res>
    extends _$AuthGateStatesCopyWithImpl<$Res, _$_AuthGateError>
    implements _$$_AuthGateErrorCopyWith<$Res> {
  __$$_AuthGateErrorCopyWithImpl(
      _$_AuthGateError _value, $Res Function(_$_AuthGateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_AuthGateError(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AuthGateError implements _AuthGateError {
  const _$_AuthGateError(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'AuthGateStates.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthGateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthGateErrorCopyWith<_$_AuthGateError> get copyWith =>
      __$$_AuthGateErrorCopyWithImpl<_$_AuthGateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function() toSplash,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function()? toSplash,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? toSplash,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthGateInitial value) initial,
    required TResult Function(_AuthGateLoading value) loading,
    required TResult Function(_AuthGateError value) error,
    required TResult Function(_AuthGateToSplash value) toSplash,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthGateInitial value)? initial,
    TResult? Function(_AuthGateLoading value)? loading,
    TResult? Function(_AuthGateError value)? error,
    TResult? Function(_AuthGateToSplash value)? toSplash,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthGateInitial value)? initial,
    TResult Function(_AuthGateLoading value)? loading,
    TResult Function(_AuthGateError value)? error,
    TResult Function(_AuthGateToSplash value)? toSplash,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _AuthGateError implements AuthGateStates {
  const factory _AuthGateError(final String error) = _$_AuthGateError;

  String get error;
  @JsonKey(ignore: true)
  _$$_AuthGateErrorCopyWith<_$_AuthGateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthGateToSplashCopyWith<$Res> {
  factory _$$_AuthGateToSplashCopyWith(
          _$_AuthGateToSplash value, $Res Function(_$_AuthGateToSplash) then) =
      __$$_AuthGateToSplashCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthGateToSplashCopyWithImpl<$Res>
    extends _$AuthGateStatesCopyWithImpl<$Res, _$_AuthGateToSplash>
    implements _$$_AuthGateToSplashCopyWith<$Res> {
  __$$_AuthGateToSplashCopyWithImpl(
      _$_AuthGateToSplash _value, $Res Function(_$_AuthGateToSplash) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AuthGateToSplash implements _AuthGateToSplash {
  const _$_AuthGateToSplash();

  @override
  String toString() {
    return 'AuthGateStates.toSplash()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AuthGateToSplash);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function() toSplash,
  }) {
    return toSplash();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function()? toSplash,
  }) {
    return toSplash?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? toSplash,
    required TResult orElse(),
  }) {
    if (toSplash != null) {
      return toSplash();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthGateInitial value) initial,
    required TResult Function(_AuthGateLoading value) loading,
    required TResult Function(_AuthGateError value) error,
    required TResult Function(_AuthGateToSplash value) toSplash,
  }) {
    return toSplash(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthGateInitial value)? initial,
    TResult? Function(_AuthGateLoading value)? loading,
    TResult? Function(_AuthGateError value)? error,
    TResult? Function(_AuthGateToSplash value)? toSplash,
  }) {
    return toSplash?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthGateInitial value)? initial,
    TResult Function(_AuthGateLoading value)? loading,
    TResult Function(_AuthGateError value)? error,
    TResult Function(_AuthGateToSplash value)? toSplash,
    required TResult orElse(),
  }) {
    if (toSplash != null) {
      return toSplash(this);
    }
    return orElse();
  }
}

abstract class _AuthGateToSplash implements AuthGateStates {
  const factory _AuthGateToSplash() = _$_AuthGateToSplash;
}
