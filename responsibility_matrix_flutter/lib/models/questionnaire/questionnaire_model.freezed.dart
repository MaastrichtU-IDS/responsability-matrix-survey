// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'questionnaire_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionnaireModel _$QuestionnaireModelFromJson(Map<String, dynamic> json) {
  return _QuestionnaireModel.fromJson(json);
}

/// @nodoc
mixin _$QuestionnaireModel {
  String get id => throw _privateConstructorUsedError;
  List<AnswerModel> get ClosedQuestions => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionnaireModelCopyWith<QuestionnaireModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionnaireModelCopyWith<$Res> {
  factory $QuestionnaireModelCopyWith(
          QuestionnaireModel value, $Res Function(QuestionnaireModel) then) =
      _$QuestionnaireModelCopyWithImpl<$Res, QuestionnaireModel>;
  @useResult
  $Res call(
      {String id,
      List<AnswerModel> ClosedQuestions,
      String title,
      String description});
}

/// @nodoc
class _$QuestionnaireModelCopyWithImpl<$Res, $Val extends QuestionnaireModel>
    implements $QuestionnaireModelCopyWith<$Res> {
  _$QuestionnaireModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ClosedQuestions = null,
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ClosedQuestions: null == ClosedQuestions
          ? _value.ClosedQuestions
          : ClosedQuestions // ignore: cast_nullable_to_non_nullable
              as List<AnswerModel>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionnaireModelCopyWith<$Res>
    implements $QuestionnaireModelCopyWith<$Res> {
  factory _$$_QuestionnaireModelCopyWith(_$_QuestionnaireModel value,
          $Res Function(_$_QuestionnaireModel) then) =
      __$$_QuestionnaireModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      List<AnswerModel> ClosedQuestions,
      String title,
      String description});
}

/// @nodoc
class __$$_QuestionnaireModelCopyWithImpl<$Res>
    extends _$QuestionnaireModelCopyWithImpl<$Res, _$_QuestionnaireModel>
    implements _$$_QuestionnaireModelCopyWith<$Res> {
  __$$_QuestionnaireModelCopyWithImpl(
      _$_QuestionnaireModel _value, $Res Function(_$_QuestionnaireModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ClosedQuestions = null,
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_$_QuestionnaireModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ClosedQuestions: null == ClosedQuestions
          ? _value._ClosedQuestions
          : ClosedQuestions // ignore: cast_nullable_to_non_nullable
              as List<AnswerModel>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionnaireModel implements _QuestionnaireModel {
  _$_QuestionnaireModel(
      {required this.id,
      required final List<AnswerModel> ClosedQuestions,
      required this.title,
      required this.description})
      : _ClosedQuestions = ClosedQuestions;

  factory _$_QuestionnaireModel.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionnaireModelFromJson(json);

  @override
  final String id;
  final List<AnswerModel> _ClosedQuestions;
  @override
  List<AnswerModel> get ClosedQuestions {
    if (_ClosedQuestions is EqualUnmodifiableListView) return _ClosedQuestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ClosedQuestions);
  }

  @override
  final String title;
  @override
  final String description;

  @override
  String toString() {
    return 'QuestionnaireModel(id: $id, ClosedQuestions: $ClosedQuestions, title: $title, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionnaireModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._ClosedQuestions, _ClosedQuestions) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_ClosedQuestions),
      title,
      description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionnaireModelCopyWith<_$_QuestionnaireModel> get copyWith =>
      __$$_QuestionnaireModelCopyWithImpl<_$_QuestionnaireModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionnaireModelToJson(
      this,
    );
  }
}

abstract class _QuestionnaireModel implements QuestionnaireModel {
  factory _QuestionnaireModel(
      {required final String id,
      required final List<AnswerModel> ClosedQuestions,
      required final String title,
      required final String description}) = _$_QuestionnaireModel;

  factory _QuestionnaireModel.fromJson(Map<String, dynamic> json) =
      _$_QuestionnaireModel.fromJson;

  @override
  String get id;
  @override
  List<AnswerModel> get ClosedQuestions;
  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionnaireModelCopyWith<_$_QuestionnaireModel> get copyWith =>
      throw _privateConstructorUsedError;
}
