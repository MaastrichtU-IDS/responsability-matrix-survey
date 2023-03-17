// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthData {
  String? get token => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get uuid => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthDataCopyWith<AuthData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthDataCopyWith<$Res> {
  factory $AuthDataCopyWith(AuthData value, $Res Function(AuthData) then) =
      _$AuthDataCopyWithImpl<$Res, AuthData>;
  @useResult
  $Res call({String? token, String? code, String? uuid, String? userName});
}

/// @nodoc
class _$AuthDataCopyWithImpl<$Res, $Val extends AuthData>
    implements $AuthDataCopyWith<$Res> {
  _$AuthDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? code = freezed,
    Object? uuid = freezed,
    Object? userName = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthDataCopyWith<$Res> implements $AuthDataCopyWith<$Res> {
  factory _$$_AuthDataCopyWith(
          _$_AuthData value, $Res Function(_$_AuthData) then) =
      __$$_AuthDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? token, String? code, String? uuid, String? userName});
}

/// @nodoc
class __$$_AuthDataCopyWithImpl<$Res>
    extends _$AuthDataCopyWithImpl<$Res, _$_AuthData>
    implements _$$_AuthDataCopyWith<$Res> {
  __$$_AuthDataCopyWithImpl(
      _$_AuthData _value, $Res Function(_$_AuthData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? code = freezed,
    Object? uuid = freezed,
    Object? userName = freezed,
  }) {
    return _then(_$_AuthData(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AuthData implements _AuthData {
  _$_AuthData(
      {required this.token,
      required this.code,
      required this.uuid,
      required this.userName});

  @override
  final String? token;
  @override
  final String? code;
  @override
  final String? uuid;
  @override
  final String? userName;

  @override
  String toString() {
    return 'AuthData(token: $token, code: $code, uuid: $uuid, userName: $userName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthData &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token, code, uuid, userName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthDataCopyWith<_$_AuthData> get copyWith =>
      __$$_AuthDataCopyWithImpl<_$_AuthData>(this, _$identity);
}

abstract class _AuthData implements AuthData {
  factory _AuthData(
      {required final String? token,
      required final String? code,
      required final String? uuid,
      required final String? userName}) = _$_AuthData;

  @override
  String? get token;
  @override
  String? get code;
  @override
  String? get uuid;
  @override
  String? get userName;
  @override
  @JsonKey(ignore: true)
  _$$_AuthDataCopyWith<_$_AuthData> get copyWith =>
      throw _privateConstructorUsedError;
}
