import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/questionnaire/questionnaire_model.dart';

part 'questionnaire_controller_states.freezed.dart';

@freezed
class QuestionnaireControllerStates with _$QuestionnaireControllerStates {
  const factory QuestionnaireControllerStates.initial(
          {required List<QuestionnaireModel> questionnaires}) =
      _QuestionnaireControllerStatesInitial;
  const factory QuestionnaireControllerStates.loading(
          {required List<QuestionnaireModel> questionnaires}) =
      _QuestionnaireControllerStatesLoading;
  const factory QuestionnaireControllerStates.selected(
          {required List<QuestionnaireModel> questionnaires,
          required QuestionnaireModel selectedQuestionnaire}) =
      _QuestionnaireControllerStatesLoaded;
}
