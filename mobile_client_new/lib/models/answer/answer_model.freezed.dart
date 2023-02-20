// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  String get status => throw _privateConstructorUsedError;
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
      _$AnswerModelCopyWithImpl<$Res, AnswerModel>;
  @useResult
  $Res call(
      {String id,
      String component,
      String scope,
      String answer,
      String status,
      int position});
}

/// @nodoc
class _$AnswerModelCopyWithImpl<$Res, $Val extends AnswerModel>
    implements $AnswerModelCopyWith<$Res> {
  _$AnswerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? component = null,
    Object? scope = null,
    Object? answer = null,
    Object? status = null,
    Object? position = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      component: null == component
          ? _value.component
          : component // ignore: cast_nullable_to_non_nullable
              as String,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnswerModelCopyWith<$Res>
    implements $AnswerModelCopyWith<$Res> {
  factory _$$_AnswerModelCopyWith(
          _$_AnswerModel value, $Res Function(_$_AnswerModel) then) =
      __$$_AnswerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String component,
      String scope,
      String answer,
      String status,
      int position});
}

/// @nodoc
class __$$_AnswerModelCopyWithImpl<$Res>
    extends _$AnswerModelCopyWithImpl<$Res, _$_AnswerModel>
    implements _$$_AnswerModelCopyWith<$Res> {
  __$$_AnswerModelCopyWithImpl(
      _$_AnswerModel _value, $Res Function(_$_AnswerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? component = null,
    Object? scope = null,
    Object? answer = null,
    Object? status = null,
    Object? position = null,
  }) {
    return _then(_$_AnswerModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      component: null == component
          ? _value.component
          : component // ignore: cast_nullable_to_non_nullable
              as String,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
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
      this.status = 'applicable',
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
  @JsonKey()
  final String status;
  @override
  final int position;

  @override
  String toString() {
    return 'AnswerModel(id: $id, component: $component, scope: $scope, answer: $answer, status: $status, position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnswerModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.component, component) ||
                other.component == component) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, component, scope, answer, status, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      final String status,
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
  String get status;
  @override
  int get position;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerModelCopyWith<_$_AnswerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
