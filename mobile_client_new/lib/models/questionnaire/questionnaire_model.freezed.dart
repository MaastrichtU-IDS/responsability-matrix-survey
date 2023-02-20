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
  List<int> get ClosedQuestionsIndex => throw _privateConstructorUsedError;
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
      List<int> ClosedQuestionsIndex,
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
    Object? ClosedQuestionsIndex = null,
    Object? ClosedQuestions = null,
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ClosedQuestionsIndex: null == ClosedQuestionsIndex
          ? _value.ClosedQuestionsIndex
          : ClosedQuestionsIndex // ignore: cast_nullable_to_non_nullable
              as List<int>,
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
      List<int> ClosedQuestionsIndex,
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
    Object? ClosedQuestionsIndex = null,
    Object? ClosedQuestions = null,
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_$_QuestionnaireModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ClosedQuestionsIndex: null == ClosedQuestionsIndex
          ? _value._ClosedQuestionsIndex
          : ClosedQuestionsIndex // ignore: cast_nullable_to_non_nullable
              as List<int>,
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
      required final List<int> ClosedQuestionsIndex,
      required final List<AnswerModel> ClosedQuestions,
      required this.title,
      required this.description})
      : _ClosedQuestionsIndex = ClosedQuestionsIndex,
        _ClosedQuestions = ClosedQuestions;

  factory _$_QuestionnaireModel.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionnaireModelFromJson(json);

  @override
  final String id;
  final List<int> _ClosedQuestionsIndex;
  @override
  List<int> get ClosedQuestionsIndex {
    if (_ClosedQuestionsIndex is EqualUnmodifiableListView)
      return _ClosedQuestionsIndex;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ClosedQuestionsIndex);
  }

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
    return 'QuestionnaireModel(id: $id, ClosedQuestionsIndex: $ClosedQuestionsIndex, ClosedQuestions: $ClosedQuestions, title: $title, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionnaireModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._ClosedQuestionsIndex, _ClosedQuestionsIndex) &&
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
      const DeepCollectionEquality().hash(_ClosedQuestionsIndex),
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
      required final List<int> ClosedQuestionsIndex,
      required final List<AnswerModel> ClosedQuestions,
      required final String title,
      required final String description}) = _$_QuestionnaireModel;

  factory _QuestionnaireModel.fromJson(Map<String, dynamic> json) =
      _$_QuestionnaireModel.fromJson;

  @override
  String get id;
  @override
  List<int> get ClosedQuestionsIndex;
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

QuestionnaireModelMini _$QuestionnaireModelMiniFromJson(
    Map<String, dynamic> json) {
  return _QuestionnaireModelMini.fromJson(json);
}

/// @nodoc
mixin _$QuestionnaireModelMini {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionnaireModelMiniCopyWith<QuestionnaireModelMini> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionnaireModelMiniCopyWith<$Res> {
  factory $QuestionnaireModelMiniCopyWith(QuestionnaireModelMini value,
          $Res Function(QuestionnaireModelMini) then) =
      _$QuestionnaireModelMiniCopyWithImpl<$Res, QuestionnaireModelMini>;
  @useResult
  $Res call({String id, String title});
}

/// @nodoc
class _$QuestionnaireModelMiniCopyWithImpl<$Res,
        $Val extends QuestionnaireModelMini>
    implements $QuestionnaireModelMiniCopyWith<$Res> {
  _$QuestionnaireModelMiniCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionnaireModelMiniCopyWith<$Res>
    implements $QuestionnaireModelMiniCopyWith<$Res> {
  factory _$$_QuestionnaireModelMiniCopyWith(_$_QuestionnaireModelMini value,
          $Res Function(_$_QuestionnaireModelMini) then) =
      __$$_QuestionnaireModelMiniCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title});
}

/// @nodoc
class __$$_QuestionnaireModelMiniCopyWithImpl<$Res>
    extends _$QuestionnaireModelMiniCopyWithImpl<$Res,
        _$_QuestionnaireModelMini>
    implements _$$_QuestionnaireModelMiniCopyWith<$Res> {
  __$$_QuestionnaireModelMiniCopyWithImpl(_$_QuestionnaireModelMini _value,
      $Res Function(_$_QuestionnaireModelMini) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$_QuestionnaireModelMini(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionnaireModelMini implements _QuestionnaireModelMini {
  _$_QuestionnaireModelMini({required this.id, required this.title});

  factory _$_QuestionnaireModelMini.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionnaireModelMiniFromJson(json);

  @override
  final String id;
  @override
  final String title;

  @override
  String toString() {
    return 'QuestionnaireModelMini(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionnaireModelMini &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionnaireModelMiniCopyWith<_$_QuestionnaireModelMini> get copyWith =>
      __$$_QuestionnaireModelMiniCopyWithImpl<_$_QuestionnaireModelMini>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionnaireModelMiniToJson(
      this,
    );
  }
}

abstract class _QuestionnaireModelMini implements QuestionnaireModelMini {
  factory _QuestionnaireModelMini(
      {required final String id,
      required final String title}) = _$_QuestionnaireModelMini;

  factory _QuestionnaireModelMini.fromJson(Map<String, dynamic> json) =
      _$_QuestionnaireModelMini.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionnaireModelMiniCopyWith<_$_QuestionnaireModelMini> get copyWith =>
      throw _privateConstructorUsedError;
}
