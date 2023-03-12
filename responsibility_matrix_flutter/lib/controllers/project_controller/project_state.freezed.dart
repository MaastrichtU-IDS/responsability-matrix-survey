// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProjectState {
  QuestionnaireModel? get questionnaire => throw _privateConstructorUsedError;
  List<QuestionnaireModel> get questionnaires =>
      throw _privateConstructorUsedError;
  List<double> get completionPercentages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectStateCopyWith<ProjectState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectStateCopyWith<$Res> {
  factory $ProjectStateCopyWith(
          ProjectState value, $Res Function(ProjectState) then) =
      _$ProjectStateCopyWithImpl<$Res, ProjectState>;
  @useResult
  $Res call(
      {QuestionnaireModel? questionnaire,
      List<QuestionnaireModel> questionnaires,
      List<double> completionPercentages});

  $QuestionnaireModelCopyWith<$Res>? get questionnaire;
}

/// @nodoc
class _$ProjectStateCopyWithImpl<$Res, $Val extends ProjectState>
    implements $ProjectStateCopyWith<$Res> {
  _$ProjectStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionnaire = freezed,
    Object? questionnaires = null,
    Object? completionPercentages = null,
  }) {
    return _then(_value.copyWith(
      questionnaire: freezed == questionnaire
          ? _value.questionnaire
          : questionnaire // ignore: cast_nullable_to_non_nullable
              as QuestionnaireModel?,
      questionnaires: null == questionnaires
          ? _value.questionnaires
          : questionnaires // ignore: cast_nullable_to_non_nullable
              as List<QuestionnaireModel>,
      completionPercentages: null == completionPercentages
          ? _value.completionPercentages
          : completionPercentages // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionnaireModelCopyWith<$Res>? get questionnaire {
    if (_value.questionnaire == null) {
      return null;
    }

    return $QuestionnaireModelCopyWith<$Res>(_value.questionnaire!, (value) {
      return _then(_value.copyWith(questionnaire: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProjectStateCopyWith<$Res>
    implements $ProjectStateCopyWith<$Res> {
  factory _$$_ProjectStateCopyWith(
          _$_ProjectState value, $Res Function(_$_ProjectState) then) =
      __$$_ProjectStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {QuestionnaireModel? questionnaire,
      List<QuestionnaireModel> questionnaires,
      List<double> completionPercentages});

  @override
  $QuestionnaireModelCopyWith<$Res>? get questionnaire;
}

/// @nodoc
class __$$_ProjectStateCopyWithImpl<$Res>
    extends _$ProjectStateCopyWithImpl<$Res, _$_ProjectState>
    implements _$$_ProjectStateCopyWith<$Res> {
  __$$_ProjectStateCopyWithImpl(
      _$_ProjectState _value, $Res Function(_$_ProjectState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionnaire = freezed,
    Object? questionnaires = null,
    Object? completionPercentages = null,
  }) {
    return _then(_$_ProjectState(
      questionnaire: freezed == questionnaire
          ? _value.questionnaire
          : questionnaire // ignore: cast_nullable_to_non_nullable
              as QuestionnaireModel?,
      questionnaires: null == questionnaires
          ? _value._questionnaires
          : questionnaires // ignore: cast_nullable_to_non_nullable
              as List<QuestionnaireModel>,
      completionPercentages: null == completionPercentages
          ? _value._completionPercentages
          : completionPercentages // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc

class _$_ProjectState implements _ProjectState {
  _$_ProjectState(
      {required this.questionnaire,
      required final List<QuestionnaireModel> questionnaires,
      required final List<double> completionPercentages})
      : _questionnaires = questionnaires,
        _completionPercentages = completionPercentages;

  @override
  final QuestionnaireModel? questionnaire;
  final List<QuestionnaireModel> _questionnaires;
  @override
  List<QuestionnaireModel> get questionnaires {
    if (_questionnaires is EqualUnmodifiableListView) return _questionnaires;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questionnaires);
  }

  final List<double> _completionPercentages;
  @override
  List<double> get completionPercentages {
    if (_completionPercentages is EqualUnmodifiableListView)
      return _completionPercentages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completionPercentages);
  }

  @override
  String toString() {
    return 'ProjectState(questionnaire: $questionnaire, questionnaires: $questionnaires, completionPercentages: $completionPercentages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectState &&
            (identical(other.questionnaire, questionnaire) ||
                other.questionnaire == questionnaire) &&
            const DeepCollectionEquality()
                .equals(other._questionnaires, _questionnaires) &&
            const DeepCollectionEquality()
                .equals(other._completionPercentages, _completionPercentages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      questionnaire,
      const DeepCollectionEquality().hash(_questionnaires),
      const DeepCollectionEquality().hash(_completionPercentages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectStateCopyWith<_$_ProjectState> get copyWith =>
      __$$_ProjectStateCopyWithImpl<_$_ProjectState>(this, _$identity);
}

abstract class _ProjectState implements ProjectState {
  factory _ProjectState(
      {required final QuestionnaireModel? questionnaire,
      required final List<QuestionnaireModel> questionnaires,
      required final List<double> completionPercentages}) = _$_ProjectState;

  @override
  QuestionnaireModel? get questionnaire;
  @override
  List<QuestionnaireModel> get questionnaires;
  @override
  List<double> get completionPercentages;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectStateCopyWith<_$_ProjectState> get copyWith =>
      throw _privateConstructorUsedError;
}
