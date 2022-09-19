// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'answer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnswerModel _$AnswerModelFromJson(Map<String, dynamic> json) {
  return _AnswerModel.fromJson(json);
}

/// @nodoc
mixin _$AnswerModel {
  String get id => throw _privateConstructorUsedError;
  String get component => throw _privateConstructorUsedError;
  String get scope => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerModelCopyWith<AnswerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerModelCopyWith<$Res> {
  factory $AnswerModelCopyWith(
          AnswerModel value, $Res Function(AnswerModel) then) =
      _$AnswerModelCopyWithImpl<$Res>;
  $Res call(
      {String id, String component, String scope, String answer, int position});
}

/// @nodoc
class _$AnswerModelCopyWithImpl<$Res> implements $AnswerModelCopyWith<$Res> {
  _$AnswerModelCopyWithImpl(this._value, this._then);

  final AnswerModel _value;
  // ignore: unused_field
  final $Res Function(AnswerModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? component = freezed,
    Object? scope = freezed,
    Object? answer = freezed,
    Object? position = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      component: component == freezed
          ? _value.component
          : component // ignore: cast_nullable_to_non_nullable
              as String,
      scope: scope == freezed
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_AnswerModelCopyWith<$Res>
    implements $AnswerModelCopyWith<$Res> {
  factory _$$_AnswerModelCopyWith(
          _$_AnswerModel value, $Res Function(_$_AnswerModel) then) =
      __$$_AnswerModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id, String component, String scope, String answer, int position});
}

/// @nodoc
class __$$_AnswerModelCopyWithImpl<$Res> extends _$AnswerModelCopyWithImpl<$Res>
    implements _$$_AnswerModelCopyWith<$Res> {
  __$$_AnswerModelCopyWithImpl(
      _$_AnswerModel _value, $Res Function(_$_AnswerModel) _then)
      : super(_value, (v) => _then(v as _$_AnswerModel));

  @override
  _$_AnswerModel get _value => super._value as _$_AnswerModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? component = freezed,
    Object? scope = freezed,
    Object? answer = freezed,
    Object? position = freezed,
  }) {
    return _then(_$_AnswerModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      component: component == freezed
          ? _value.component
          : component // ignore: cast_nullable_to_non_nullable
              as String,
      scope: scope == freezed
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnswerModel implements _AnswerModel {
  _$_AnswerModel(
      {required this.id,
      required this.component,
      required this.scope,
      required this.answer,
      required this.position});

  factory _$_AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$$_AnswerModelFromJson(json);

  @override
  final String id;
  @override
  final String component;
  @override
  final String scope;
  @override
  final String answer;
  @override
  final int position;

  @override
  String toString() {
    return 'AnswerModel(id: $id, component: $component, scope: $scope, answer: $answer, position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnswerModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.component, component) &&
            const DeepCollectionEquality().equals(other.scope, scope) &&
            const DeepCollectionEquality().equals(other.answer, answer) &&
            const DeepCollectionEquality().equals(other.position, position));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(component),
      const DeepCollectionEquality().hash(scope),
      const DeepCollectionEquality().hash(answer),
      const DeepCollectionEquality().hash(position));

  @JsonKey(ignore: true)
  @override
  _$$_AnswerModelCopyWith<_$_AnswerModel> get copyWith =>
      __$$_AnswerModelCopyWithImpl<_$_AnswerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnswerModelToJson(
      this,
    );
  }
}

abstract class _AnswerModel implements AnswerModel {
  factory _AnswerModel(
      {required final String id,
      required final String component,
      required final String scope,
      required final String answer,
      required final int position}) = _$_AnswerModel;

  factory _AnswerModel.fromJson(Map<String, dynamic> json) =
      _$_AnswerModel.fromJson;

  @override
  String get id;
  @override
  String get component;
  @override
  String get scope;
  @override
  String get answer;
  @override
  int get position;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerModelCopyWith<_$_AnswerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
