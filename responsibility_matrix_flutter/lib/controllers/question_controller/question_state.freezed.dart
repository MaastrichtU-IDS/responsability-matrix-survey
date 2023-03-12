// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuestionState {
  QuestionnaireModel get questionnaire => throw _privateConstructorUsedError;
  QuestionModel get question => throw _privateConstructorUsedError;
  AnswerModel? get answer => throw _privateConstructorUsedError;
  String get questionCode => throw _privateConstructorUsedError;
  AnswerStatus get currentStatus => throw _privateConstructorUsedError;
  String get currentText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionStateCopyWith<QuestionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionStateCopyWith<$Res> {
  factory $QuestionStateCopyWith(
          QuestionState value, $Res Function(QuestionState) then) =
      _$QuestionStateCopyWithImpl<$Res, QuestionState>;
  @useResult
  $Res call(
      {QuestionnaireModel questionnaire,
      QuestionModel question,
      AnswerModel? answer,
      String questionCode,
      AnswerStatus currentStatus,
      String currentText});

  $QuestionnaireModelCopyWith<$Res> get questionnaire;
  $QuestionModelCopyWith<$Res> get question;
  $AnswerModelCopyWith<$Res>? get answer;
}

/// @nodoc
class _$QuestionStateCopyWithImpl<$Res, $Val extends QuestionState>
    implements $QuestionStateCopyWith<$Res> {
  _$QuestionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionnaire = null,
    Object? question = null,
    Object? answer = freezed,
    Object? questionCode = null,
    Object? currentStatus = null,
    Object? currentText = null,
  }) {
    return _then(_value.copyWith(
      questionnaire: null == questionnaire
          ? _value.questionnaire
          : questionnaire // ignore: cast_nullable_to_non_nullable
              as QuestionnaireModel,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as QuestionModel,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as AnswerModel?,
      questionCode: null == questionCode
          ? _value.questionCode
          : questionCode // ignore: cast_nullable_to_non_nullable
              as String,
      currentStatus: null == currentStatus
          ? _value.currentStatus
          : currentStatus // ignore: cast_nullable_to_non_nullable
              as AnswerStatus,
      currentText: null == currentText
          ? _value.currentText
          : currentText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionnaireModelCopyWith<$Res> get questionnaire {
    return $QuestionnaireModelCopyWith<$Res>(_value.questionnaire, (value) {
      return _then(_value.copyWith(questionnaire: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionModelCopyWith<$Res> get question {
    return $QuestionModelCopyWith<$Res>(_value.question, (value) {
      return _then(_value.copyWith(question: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AnswerModelCopyWith<$Res>? get answer {
    if (_value.answer == null) {
      return null;
    }

    return $AnswerModelCopyWith<$Res>(_value.answer!, (value) {
      return _then(_value.copyWith(answer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_QuestionStateCopyWith<$Res>
    implements $QuestionStateCopyWith<$Res> {
  factory _$$_QuestionStateCopyWith(
          _$_QuestionState value, $Res Function(_$_QuestionState) then) =
      __$$_QuestionStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {QuestionnaireModel questionnaire,
      QuestionModel question,
      AnswerModel? answer,
      String questionCode,
      AnswerStatus currentStatus,
      String currentText});

  @override
  $QuestionnaireModelCopyWith<$Res> get questionnaire;
  @override
  $QuestionModelCopyWith<$Res> get question;
  @override
  $AnswerModelCopyWith<$Res>? get answer;
}

/// @nodoc
class __$$_QuestionStateCopyWithImpl<$Res>
    extends _$QuestionStateCopyWithImpl<$Res, _$_QuestionState>
    implements _$$_QuestionStateCopyWith<$Res> {
  __$$_QuestionStateCopyWithImpl(
      _$_QuestionState _value, $Res Function(_$_QuestionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionnaire = null,
    Object? question = null,
    Object? answer = freezed,
    Object? questionCode = null,
    Object? currentStatus = null,
    Object? currentText = null,
  }) {
    return _then(_$_QuestionState(
      questionnaire: null == questionnaire
          ? _value.questionnaire
          : questionnaire // ignore: cast_nullable_to_non_nullable
              as QuestionnaireModel,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as QuestionModel,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as AnswerModel?,
      questionCode: null == questionCode
          ? _value.questionCode
          : questionCode // ignore: cast_nullable_to_non_nullable
              as String,
      currentStatus: null == currentStatus
          ? _value.currentStatus
          : currentStatus // ignore: cast_nullable_to_non_nullable
              as AnswerStatus,
      currentText: null == currentText
          ? _value.currentText
          : currentText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_QuestionState implements _QuestionState {
  _$_QuestionState(
      {required this.questionnaire,
      required this.question,
      required this.answer,
      required this.questionCode,
      required this.currentStatus,
      required this.currentText});

  @override
  final QuestionnaireModel questionnaire;
  @override
  final QuestionModel question;
  @override
  final AnswerModel? answer;
  @override
  final String questionCode;
  @override
  final AnswerStatus currentStatus;
  @override
  final String currentText;

  @override
  String toString() {
    return 'QuestionState(questionnaire: $questionnaire, question: $question, answer: $answer, questionCode: $questionCode, currentStatus: $currentStatus, currentText: $currentText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionState &&
            (identical(other.questionnaire, questionnaire) ||
                other.questionnaire == questionnaire) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.questionCode, questionCode) ||
                other.questionCode == questionCode) &&
            (identical(other.currentStatus, currentStatus) ||
                other.currentStatus == currentStatus) &&
            (identical(other.currentText, currentText) ||
                other.currentText == currentText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, questionnaire, question, answer,
      questionCode, currentStatus, currentText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionStateCopyWith<_$_QuestionState> get copyWith =>
      __$$_QuestionStateCopyWithImpl<_$_QuestionState>(this, _$identity);
}

abstract class _QuestionState implements QuestionState {
  factory _QuestionState(
      {required final QuestionnaireModel questionnaire,
      required final QuestionModel question,
      required final AnswerModel? answer,
      required final String questionCode,
      required final AnswerStatus currentStatus,
      required final String currentText}) = _$_QuestionState;

  @override
  QuestionnaireModel get questionnaire;
  @override
  QuestionModel get question;
  @override
  AnswerModel? get answer;
  @override
  String get questionCode;
  @override
  AnswerStatus get currentStatus;
  @override
  String get currentText;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionStateCopyWith<_$_QuestionState> get copyWith =>
      throw _privateConstructorUsedError;
}
