// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'questions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuestionsState {
  List<QuestionModel> get questions => throw _privateConstructorUsedError;
  List<int> get answeredQuestions => throw _privateConstructorUsedError;
  Map<int, AnswerStatus> get answerStatuses =>
      throw _privateConstructorUsedError;
  Scope? get scope => throw _privateConstructorUsedError;
  Component? get component => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionsStateCopyWith<QuestionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionsStateCopyWith<$Res> {
  factory $QuestionsStateCopyWith(
          QuestionsState value, $Res Function(QuestionsState) then) =
      _$QuestionsStateCopyWithImpl<$Res, QuestionsState>;
  @useResult
  $Res call(
      {List<QuestionModel> questions,
      List<int> answeredQuestions,
      Map<int, AnswerStatus> answerStatuses,
      Scope? scope,
      Component? component});
}

/// @nodoc
class _$QuestionsStateCopyWithImpl<$Res, $Val extends QuestionsState>
    implements $QuestionsStateCopyWith<$Res> {
  _$QuestionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questions = null,
    Object? answeredQuestions = null,
    Object? answerStatuses = null,
    Object? scope = freezed,
    Object? component = freezed,
  }) {
    return _then(_value.copyWith(
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>,
      answeredQuestions: null == answeredQuestions
          ? _value.answeredQuestions
          : answeredQuestions // ignore: cast_nullable_to_non_nullable
              as List<int>,
      answerStatuses: null == answerStatuses
          ? _value.answerStatuses
          : answerStatuses // ignore: cast_nullable_to_non_nullable
              as Map<int, AnswerStatus>,
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as Scope?,
      component: freezed == component
          ? _value.component
          : component // ignore: cast_nullable_to_non_nullable
              as Component?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionsStateCopyWith<$Res>
    implements $QuestionsStateCopyWith<$Res> {
  factory _$$_QuestionsStateCopyWith(
          _$_QuestionsState value, $Res Function(_$_QuestionsState) then) =
      __$$_QuestionsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<QuestionModel> questions,
      List<int> answeredQuestions,
      Map<int, AnswerStatus> answerStatuses,
      Scope? scope,
      Component? component});
}

/// @nodoc
class __$$_QuestionsStateCopyWithImpl<$Res>
    extends _$QuestionsStateCopyWithImpl<$Res, _$_QuestionsState>
    implements _$$_QuestionsStateCopyWith<$Res> {
  __$$_QuestionsStateCopyWithImpl(
      _$_QuestionsState _value, $Res Function(_$_QuestionsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questions = null,
    Object? answeredQuestions = null,
    Object? answerStatuses = null,
    Object? scope = freezed,
    Object? component = freezed,
  }) {
    return _then(_$_QuestionsState(
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>,
      answeredQuestions: null == answeredQuestions
          ? _value._answeredQuestions
          : answeredQuestions // ignore: cast_nullable_to_non_nullable
              as List<int>,
      answerStatuses: null == answerStatuses
          ? _value._answerStatuses
          : answerStatuses // ignore: cast_nullable_to_non_nullable
              as Map<int, AnswerStatus>,
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as Scope?,
      component: freezed == component
          ? _value.component
          : component // ignore: cast_nullable_to_non_nullable
              as Component?,
    ));
  }
}

/// @nodoc

class _$_QuestionsState implements _QuestionsState {
  _$_QuestionsState(
      {required final List<QuestionModel> questions,
      required final List<int> answeredQuestions,
      required final Map<int, AnswerStatus> answerStatuses,
      required this.scope,
      required this.component})
      : _questions = questions,
        _answeredQuestions = answeredQuestions,
        _answerStatuses = answerStatuses;

  final List<QuestionModel> _questions;
  @override
  List<QuestionModel> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  final List<int> _answeredQuestions;
  @override
  List<int> get answeredQuestions {
    if (_answeredQuestions is EqualUnmodifiableListView)
      return _answeredQuestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answeredQuestions);
  }

  final Map<int, AnswerStatus> _answerStatuses;
  @override
  Map<int, AnswerStatus> get answerStatuses {
    if (_answerStatuses is EqualUnmodifiableMapView) return _answerStatuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_answerStatuses);
  }

  @override
  final Scope? scope;
  @override
  final Component? component;

  @override
  String toString() {
    return 'QuestionsState(questions: $questions, answeredQuestions: $answeredQuestions, answerStatuses: $answerStatuses, scope: $scope, component: $component)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionsState &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            const DeepCollectionEquality()
                .equals(other._answeredQuestions, _answeredQuestions) &&
            const DeepCollectionEquality()
                .equals(other._answerStatuses, _answerStatuses) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.component, component) ||
                other.component == component));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_questions),
      const DeepCollectionEquality().hash(_answeredQuestions),
      const DeepCollectionEquality().hash(_answerStatuses),
      scope,
      component);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionsStateCopyWith<_$_QuestionsState> get copyWith =>
      __$$_QuestionsStateCopyWithImpl<_$_QuestionsState>(this, _$identity);
}

abstract class _QuestionsState implements QuestionsState {
  factory _QuestionsState(
      {required final List<QuestionModel> questions,
      required final List<int> answeredQuestions,
      required final Map<int, AnswerStatus> answerStatuses,
      required final Scope? scope,
      required final Component? component}) = _$_QuestionsState;

  @override
  List<QuestionModel> get questions;
  @override
  List<int> get answeredQuestions;
  @override
  Map<int, AnswerStatus> get answerStatuses;
  @override
  Scope? get scope;
  @override
  Component? get component;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionsStateCopyWith<_$_QuestionsState> get copyWith =>
      throw _privateConstructorUsedError;
}
