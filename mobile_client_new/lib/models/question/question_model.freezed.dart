// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) {
  return _QuestionModel.fromJson(json);
}

/// @nodoc
mixin _$QuestionModel {
  String get id => throw _privateConstructorUsedError;
  String get component => throw _privateConstructorUsedError;
  String get scope => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  String get exampleAnswer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionModelCopyWith<QuestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionModelCopyWith<$Res> {
  factory $QuestionModelCopyWith(
          QuestionModel value, $Res Function(QuestionModel) then) =
      _$QuestionModelCopyWithImpl<$Res, QuestionModel>;
  @useResult
  $Res call(
      {String id,
      String component,
      String scope,
      String question,
      int position,
      String exampleAnswer});
}

/// @nodoc
class _$QuestionModelCopyWithImpl<$Res, $Val extends QuestionModel>
    implements $QuestionModelCopyWith<$Res> {
  _$QuestionModelCopyWithImpl(this._value, this._then);

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
    Object? question = null,
    Object? position = null,
    Object? exampleAnswer = null,
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
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      exampleAnswer: null == exampleAnswer
          ? _value.exampleAnswer
          : exampleAnswer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionModelCopyWith<$Res>
    implements $QuestionModelCopyWith<$Res> {
  factory _$$_QuestionModelCopyWith(
          _$_QuestionModel value, $Res Function(_$_QuestionModel) then) =
      __$$_QuestionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String component,
      String scope,
      String question,
      int position,
      String exampleAnswer});
}

/// @nodoc
class __$$_QuestionModelCopyWithImpl<$Res>
    extends _$QuestionModelCopyWithImpl<$Res, _$_QuestionModel>
    implements _$$_QuestionModelCopyWith<$Res> {
  __$$_QuestionModelCopyWithImpl(
      _$_QuestionModel _value, $Res Function(_$_QuestionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? component = null,
    Object? scope = null,
    Object? question = null,
    Object? position = null,
    Object? exampleAnswer = null,
  }) {
    return _then(_$_QuestionModel(
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
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      exampleAnswer: null == exampleAnswer
          ? _value.exampleAnswer
          : exampleAnswer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionModel implements _QuestionModel {
  _$_QuestionModel(
      {required this.id,
      required this.component,
      required this.scope,
      required this.question,
      required this.position,
      this.exampleAnswer = ''});

  factory _$_QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionModelFromJson(json);

  @override
  final String id;
  @override
  final String component;
  @override
  final String scope;
  @override
  final String question;
  @override
  final int position;
  @override
  @JsonKey()
  final String exampleAnswer;

  @override
  String toString() {
    return 'QuestionModel(id: $id, component: $component, scope: $scope, question: $question, position: $position, exampleAnswer: $exampleAnswer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.component, component) ||
                other.component == component) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.exampleAnswer, exampleAnswer) ||
                other.exampleAnswer == exampleAnswer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, component, scope, question, position, exampleAnswer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionModelCopyWith<_$_QuestionModel> get copyWith =>
      __$$_QuestionModelCopyWithImpl<_$_QuestionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionModelToJson(
      this,
    );
  }
}

abstract class _QuestionModel implements QuestionModel {
  factory _QuestionModel(
      {required final String id,
      required final String component,
      required final String scope,
      required final String question,
      required final int position,
      final String exampleAnswer}) = _$_QuestionModel;

  factory _QuestionModel.fromJson(Map<String, dynamic> json) =
      _$_QuestionModel.fromJson;

  @override
  String get id;
  @override
  String get component;
  @override
  String get scope;
  @override
  String get question;
  @override
  int get position;
  @override
  String get exampleAnswer;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionModelCopyWith<_$_QuestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
