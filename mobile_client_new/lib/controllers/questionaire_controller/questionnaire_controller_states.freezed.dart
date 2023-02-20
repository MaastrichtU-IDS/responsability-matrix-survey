// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'questionnaire_controller_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuestionnaireControllerStates {
  List<QuestionnaireModel> get questionnaires =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<QuestionnaireModel> questionnaires) initial,
    required TResult Function(List<QuestionnaireModel> questionnaires) loading,
    required TResult Function(List<QuestionnaireModel> questionnaires,
            QuestionnaireModel selectedQuestionnaire)
        selected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<QuestionnaireModel> questionnaires)? initial,
    TResult? Function(List<QuestionnaireModel> questionnaires)? loading,
    TResult? Function(List<QuestionnaireModel> questionnaires,
            QuestionnaireModel selectedQuestionnaire)?
        selected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<QuestionnaireModel> questionnaires)? initial,
    TResult Function(List<QuestionnaireModel> questionnaires)? loading,
    TResult Function(List<QuestionnaireModel> questionnaires,
            QuestionnaireModel selectedQuestionnaire)?
        selected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QuestionnaireControllerStatesInitial value)
        initial,
    required TResult Function(_QuestionnaireControllerStatesLoading value)
        loading,
    required TResult Function(_QuestionnaireControllerStatesLoaded value)
        selected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_QuestionnaireControllerStatesInitial value)? initial,
    TResult? Function(_QuestionnaireControllerStatesLoading value)? loading,
    TResult? Function(_QuestionnaireControllerStatesLoaded value)? selected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QuestionnaireControllerStatesInitial value)? initial,
    TResult Function(_QuestionnaireControllerStatesLoading value)? loading,
    TResult Function(_QuestionnaireControllerStatesLoaded value)? selected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionnaireControllerStatesCopyWith<QuestionnaireControllerStates>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionnaireControllerStatesCopyWith<$Res> {
  factory $QuestionnaireControllerStatesCopyWith(
          QuestionnaireControllerStates value,
          $Res Function(QuestionnaireControllerStates) then) =
      _$QuestionnaireControllerStatesCopyWithImpl<$Res,
          QuestionnaireControllerStates>;
  @useResult
  $Res call({List<QuestionnaireModel> questionnaires});
}

/// @nodoc
class _$QuestionnaireControllerStatesCopyWithImpl<$Res,
        $Val extends QuestionnaireControllerStates>
    implements $QuestionnaireControllerStatesCopyWith<$Res> {
  _$QuestionnaireControllerStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionnaires = null,
  }) {
    return _then(_value.copyWith(
      questionnaires: null == questionnaires
          ? _value.questionnaires
          : questionnaires // ignore: cast_nullable_to_non_nullable
              as List<QuestionnaireModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionnaireControllerStatesInitialCopyWith<$Res>
    implements $QuestionnaireControllerStatesCopyWith<$Res> {
  factory _$$_QuestionnaireControllerStatesInitialCopyWith(
          _$_QuestionnaireControllerStatesInitial value,
          $Res Function(_$_QuestionnaireControllerStatesInitial) then) =
      __$$_QuestionnaireControllerStatesInitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<QuestionnaireModel> questionnaires});
}

/// @nodoc
class __$$_QuestionnaireControllerStatesInitialCopyWithImpl<$Res>
    extends _$QuestionnaireControllerStatesCopyWithImpl<$Res,
        _$_QuestionnaireControllerStatesInitial>
    implements _$$_QuestionnaireControllerStatesInitialCopyWith<$Res> {
  __$$_QuestionnaireControllerStatesInitialCopyWithImpl(
      _$_QuestionnaireControllerStatesInitial _value,
      $Res Function(_$_QuestionnaireControllerStatesInitial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionnaires = null,
  }) {
    return _then(_$_QuestionnaireControllerStatesInitial(
      questionnaires: null == questionnaires
          ? _value._questionnaires
          : questionnaires // ignore: cast_nullable_to_non_nullable
              as List<QuestionnaireModel>,
    ));
  }
}

/// @nodoc

class _$_QuestionnaireControllerStatesInitial
    implements _QuestionnaireControllerStatesInitial {
  const _$_QuestionnaireControllerStatesInitial(
      {required final List<QuestionnaireModel> questionnaires})
      : _questionnaires = questionnaires;

  final List<QuestionnaireModel> _questionnaires;
  @override
  List<QuestionnaireModel> get questionnaires {
    if (_questionnaires is EqualUnmodifiableListView) return _questionnaires;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questionnaires);
  }

  @override
  String toString() {
    return 'QuestionnaireControllerStates.initial(questionnaires: $questionnaires)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionnaireControllerStatesInitial &&
            const DeepCollectionEquality()
                .equals(other._questionnaires, _questionnaires));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_questionnaires));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionnaireControllerStatesInitialCopyWith<
          _$_QuestionnaireControllerStatesInitial>
      get copyWith => __$$_QuestionnaireControllerStatesInitialCopyWithImpl<
          _$_QuestionnaireControllerStatesInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<QuestionnaireModel> questionnaires) initial,
    required TResult Function(List<QuestionnaireModel> questionnaires) loading,
    required TResult Function(List<QuestionnaireModel> questionnaires,
            QuestionnaireModel selectedQuestionnaire)
        selected,
  }) {
    return initial(questionnaires);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<QuestionnaireModel> questionnaires)? initial,
    TResult? Function(List<QuestionnaireModel> questionnaires)? loading,
    TResult? Function(List<QuestionnaireModel> questionnaires,
            QuestionnaireModel selectedQuestionnaire)?
        selected,
  }) {
    return initial?.call(questionnaires);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<QuestionnaireModel> questionnaires)? initial,
    TResult Function(List<QuestionnaireModel> questionnaires)? loading,
    TResult Function(List<QuestionnaireModel> questionnaires,
            QuestionnaireModel selectedQuestionnaire)?
        selected,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(questionnaires);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QuestionnaireControllerStatesInitial value)
        initial,
    required TResult Function(_QuestionnaireControllerStatesLoading value)
        loading,
    required TResult Function(_QuestionnaireControllerStatesLoaded value)
        selected,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_QuestionnaireControllerStatesInitial value)? initial,
    TResult? Function(_QuestionnaireControllerStatesLoading value)? loading,
    TResult? Function(_QuestionnaireControllerStatesLoaded value)? selected,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QuestionnaireControllerStatesInitial value)? initial,
    TResult Function(_QuestionnaireControllerStatesLoading value)? loading,
    TResult Function(_QuestionnaireControllerStatesLoaded value)? selected,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _QuestionnaireControllerStatesInitial
    implements QuestionnaireControllerStates {
  const factory _QuestionnaireControllerStatesInitial(
          {required final List<QuestionnaireModel> questionnaires}) =
      _$_QuestionnaireControllerStatesInitial;

  @override
  List<QuestionnaireModel> get questionnaires;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionnaireControllerStatesInitialCopyWith<
          _$_QuestionnaireControllerStatesInitial>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_QuestionnaireControllerStatesLoadingCopyWith<$Res>
    implements $QuestionnaireControllerStatesCopyWith<$Res> {
  factory _$$_QuestionnaireControllerStatesLoadingCopyWith(
          _$_QuestionnaireControllerStatesLoading value,
          $Res Function(_$_QuestionnaireControllerStatesLoading) then) =
      __$$_QuestionnaireControllerStatesLoadingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<QuestionnaireModel> questionnaires});
}

/// @nodoc
class __$$_QuestionnaireControllerStatesLoadingCopyWithImpl<$Res>
    extends _$QuestionnaireControllerStatesCopyWithImpl<$Res,
        _$_QuestionnaireControllerStatesLoading>
    implements _$$_QuestionnaireControllerStatesLoadingCopyWith<$Res> {
  __$$_QuestionnaireControllerStatesLoadingCopyWithImpl(
      _$_QuestionnaireControllerStatesLoading _value,
      $Res Function(_$_QuestionnaireControllerStatesLoading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionnaires = null,
  }) {
    return _then(_$_QuestionnaireControllerStatesLoading(
      questionnaires: null == questionnaires
          ? _value._questionnaires
          : questionnaires // ignore: cast_nullable_to_non_nullable
              as List<QuestionnaireModel>,
    ));
  }
}

/// @nodoc

class _$_QuestionnaireControllerStatesLoading
    implements _QuestionnaireControllerStatesLoading {
  const _$_QuestionnaireControllerStatesLoading(
      {required final List<QuestionnaireModel> questionnaires})
      : _questionnaires = questionnaires;

  final List<QuestionnaireModel> _questionnaires;
  @override
  List<QuestionnaireModel> get questionnaires {
    if (_questionnaires is EqualUnmodifiableListView) return _questionnaires;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questionnaires);
  }

  @override
  String toString() {
    return 'QuestionnaireControllerStates.loading(questionnaires: $questionnaires)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionnaireControllerStatesLoading &&
            const DeepCollectionEquality()
                .equals(other._questionnaires, _questionnaires));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_questionnaires));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionnaireControllerStatesLoadingCopyWith<
          _$_QuestionnaireControllerStatesLoading>
      get copyWith => __$$_QuestionnaireControllerStatesLoadingCopyWithImpl<
          _$_QuestionnaireControllerStatesLoading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<QuestionnaireModel> questionnaires) initial,
    required TResult Function(List<QuestionnaireModel> questionnaires) loading,
    required TResult Function(List<QuestionnaireModel> questionnaires,
            QuestionnaireModel selectedQuestionnaire)
        selected,
  }) {
    return loading(questionnaires);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<QuestionnaireModel> questionnaires)? initial,
    TResult? Function(List<QuestionnaireModel> questionnaires)? loading,
    TResult? Function(List<QuestionnaireModel> questionnaires,
            QuestionnaireModel selectedQuestionnaire)?
        selected,
  }) {
    return loading?.call(questionnaires);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<QuestionnaireModel> questionnaires)? initial,
    TResult Function(List<QuestionnaireModel> questionnaires)? loading,
    TResult Function(List<QuestionnaireModel> questionnaires,
            QuestionnaireModel selectedQuestionnaire)?
        selected,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(questionnaires);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QuestionnaireControllerStatesInitial value)
        initial,
    required TResult Function(_QuestionnaireControllerStatesLoading value)
        loading,
    required TResult Function(_QuestionnaireControllerStatesLoaded value)
        selected,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_QuestionnaireControllerStatesInitial value)? initial,
    TResult? Function(_QuestionnaireControllerStatesLoading value)? loading,
    TResult? Function(_QuestionnaireControllerStatesLoaded value)? selected,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QuestionnaireControllerStatesInitial value)? initial,
    TResult Function(_QuestionnaireControllerStatesLoading value)? loading,
    TResult Function(_QuestionnaireControllerStatesLoaded value)? selected,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _QuestionnaireControllerStatesLoading
    implements QuestionnaireControllerStates {
  const factory _QuestionnaireControllerStatesLoading(
          {required final List<QuestionnaireModel> questionnaires}) =
      _$_QuestionnaireControllerStatesLoading;

  @override
  List<QuestionnaireModel> get questionnaires;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionnaireControllerStatesLoadingCopyWith<
          _$_QuestionnaireControllerStatesLoading>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_QuestionnaireControllerStatesLoadedCopyWith<$Res>
    implements $QuestionnaireControllerStatesCopyWith<$Res> {
  factory _$$_QuestionnaireControllerStatesLoadedCopyWith(
          _$_QuestionnaireControllerStatesLoaded value,
          $Res Function(_$_QuestionnaireControllerStatesLoaded) then) =
      __$$_QuestionnaireControllerStatesLoadedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<QuestionnaireModel> questionnaires,
      QuestionnaireModel selectedQuestionnaire});

  $QuestionnaireModelCopyWith<$Res> get selectedQuestionnaire;
}

/// @nodoc
class __$$_QuestionnaireControllerStatesLoadedCopyWithImpl<$Res>
    extends _$QuestionnaireControllerStatesCopyWithImpl<$Res,
        _$_QuestionnaireControllerStatesLoaded>
    implements _$$_QuestionnaireControllerStatesLoadedCopyWith<$Res> {
  __$$_QuestionnaireControllerStatesLoadedCopyWithImpl(
      _$_QuestionnaireControllerStatesLoaded _value,
      $Res Function(_$_QuestionnaireControllerStatesLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionnaires = null,
    Object? selectedQuestionnaire = null,
  }) {
    return _then(_$_QuestionnaireControllerStatesLoaded(
      questionnaires: null == questionnaires
          ? _value._questionnaires
          : questionnaires // ignore: cast_nullable_to_non_nullable
              as List<QuestionnaireModel>,
      selectedQuestionnaire: null == selectedQuestionnaire
          ? _value.selectedQuestionnaire
          : selectedQuestionnaire // ignore: cast_nullable_to_non_nullable
              as QuestionnaireModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionnaireModelCopyWith<$Res> get selectedQuestionnaire {
    return $QuestionnaireModelCopyWith<$Res>(_value.selectedQuestionnaire,
        (value) {
      return _then(_value.copyWith(selectedQuestionnaire: value));
    });
  }
}

/// @nodoc

class _$_QuestionnaireControllerStatesLoaded
    implements _QuestionnaireControllerStatesLoaded {
  const _$_QuestionnaireControllerStatesLoaded(
      {required final List<QuestionnaireModel> questionnaires,
      required this.selectedQuestionnaire})
      : _questionnaires = questionnaires;

  final List<QuestionnaireModel> _questionnaires;
  @override
  List<QuestionnaireModel> get questionnaires {
    if (_questionnaires is EqualUnmodifiableListView) return _questionnaires;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questionnaires);
  }

  @override
  final QuestionnaireModel selectedQuestionnaire;

  @override
  String toString() {
    return 'QuestionnaireControllerStates.selected(questionnaires: $questionnaires, selectedQuestionnaire: $selectedQuestionnaire)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionnaireControllerStatesLoaded &&
            const DeepCollectionEquality()
                .equals(other._questionnaires, _questionnaires) &&
            (identical(other.selectedQuestionnaire, selectedQuestionnaire) ||
                other.selectedQuestionnaire == selectedQuestionnaire));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_questionnaires),
      selectedQuestionnaire);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionnaireControllerStatesLoadedCopyWith<
          _$_QuestionnaireControllerStatesLoaded>
      get copyWith => __$$_QuestionnaireControllerStatesLoadedCopyWithImpl<
          _$_QuestionnaireControllerStatesLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<QuestionnaireModel> questionnaires) initial,
    required TResult Function(List<QuestionnaireModel> questionnaires) loading,
    required TResult Function(List<QuestionnaireModel> questionnaires,
            QuestionnaireModel selectedQuestionnaire)
        selected,
  }) {
    return selected(questionnaires, selectedQuestionnaire);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<QuestionnaireModel> questionnaires)? initial,
    TResult? Function(List<QuestionnaireModel> questionnaires)? loading,
    TResult? Function(List<QuestionnaireModel> questionnaires,
            QuestionnaireModel selectedQuestionnaire)?
        selected,
  }) {
    return selected?.call(questionnaires, selectedQuestionnaire);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<QuestionnaireModel> questionnaires)? initial,
    TResult Function(List<QuestionnaireModel> questionnaires)? loading,
    TResult Function(List<QuestionnaireModel> questionnaires,
            QuestionnaireModel selectedQuestionnaire)?
        selected,
    required TResult orElse(),
  }) {
    if (selected != null) {
      return selected(questionnaires, selectedQuestionnaire);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QuestionnaireControllerStatesInitial value)
        initial,
    required TResult Function(_QuestionnaireControllerStatesLoading value)
        loading,
    required TResult Function(_QuestionnaireControllerStatesLoaded value)
        selected,
  }) {
    return selected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_QuestionnaireControllerStatesInitial value)? initial,
    TResult? Function(_QuestionnaireControllerStatesLoading value)? loading,
    TResult? Function(_QuestionnaireControllerStatesLoaded value)? selected,
  }) {
    return selected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QuestionnaireControllerStatesInitial value)? initial,
    TResult Function(_QuestionnaireControllerStatesLoading value)? loading,
    TResult Function(_QuestionnaireControllerStatesLoaded value)? selected,
    required TResult orElse(),
  }) {
    if (selected != null) {
      return selected(this);
    }
    return orElse();
  }
}

abstract class _QuestionnaireControllerStatesLoaded
    implements QuestionnaireControllerStates {
  const factory _QuestionnaireControllerStatesLoaded(
          {required final List<QuestionnaireModel> questionnaires,
          required final QuestionnaireModel selectedQuestionnaire}) =
      _$_QuestionnaireControllerStatesLoaded;

  @override
  List<QuestionnaireModel> get questionnaires;
  QuestionnaireModel get selectedQuestionnaire;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionnaireControllerStatesLoadedCopyWith<
          _$_QuestionnaireControllerStatesLoaded>
      get copyWith => throw _privateConstructorUsedError;
}
