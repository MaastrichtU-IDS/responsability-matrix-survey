import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_client_new/controllers/questionaire_controller/questionnaire_controller_states.dart';
import 'package:mobile_client_new/models/questionnaire/questionnaire_model.dart';
import 'package:mobile_client_new/repositories/questionairee_repository.dart';
import 'package:mobile_client_new/utils/instance_controller/instance_controller.dart';
import 'package:mobile_client_new/views/root/root.dart';

class QuestionnaireController
    extends StateNotifier<QuestionnaireControllerStates> {
  QuestionnaireController(this.ref)
      : super(QuestionnaireControllerStates.initial(
            questionnaires: [..._questionnarieRepository.questionnaires]));

  final Ref ref;

  static final QuestionnarieRepository _questionnarieRepository =
      InstanceController()[QuestionnarieRepository];

  void createQuestionnarie(String title, String description) async {
    ref.read(rootLoading.originProvider).setLoading(true);
    state = QuestionnaireControllerStates.loading(
        questionnaires: [..._questionnarieRepository.questionnaires]);
    final result =
        await _questionnarieRepository.createQuestionnarie(title, description);
    state = QuestionnaireControllerStates.selected(
        selectedQuestionnaire: result,
        questionnaires: [..._questionnarieRepository.questionnaires]);
    ref.read(rootLoading.originProvider).setLoading(false);
  }

  void selectQuestionnarie(QuestionnaireModel questionnaire) async {
    ref.read(rootLoading.originProvider).setLoading(true);
    state = QuestionnaireControllerStates.loading(
        questionnaires: [..._questionnarieRepository.questionnaires]);
    final result =
        await _questionnarieRepository.selectQuestionnarie(questionnaire.id);
    state = QuestionnaireControllerStates.selected(
        selectedQuestionnaire: result,
        questionnaires: [..._questionnarieRepository.questionnaires]);
    ref.read(rootLoading.originProvider).setLoading(false);
  }

  Future<void> updateState() async {
    state = QuestionnaireControllerStates.selected(
        selectedQuestionnaire:
            await _questionnarieRepository.syncQuestionnaire(),
        questionnaires: [..._questionnarieRepository.questionnaires]);
  }

  QuestionnaireModel? get selectedQuestionnaire =>
      _questionnarieRepository.selectedQuestionnaire;

  void deselectQuestionnarie() {
    _questionnarieRepository.deselectQuestionnarie();
    state = QuestionnaireControllerStates.initial(
        questionnaires: [..._questionnarieRepository.questionnaires]);
  }

  Future<void> deleteQuestionnaire(
      QuestionnaireModel questionnaireModel) async {
    await _questionnarieRepository.deleteQuestionnaire(questionnaireModel);

    deselectQuestionnarie();
    state = QuestionnaireControllerStates.initial(
        questionnaires: [..._questionnarieRepository.questionnaires]);
  }

  Future<void> updateQuestionnaire(
      String id, String title, String description) async {
    await _questionnarieRepository.updateQuestionnaire(id, title, description);
    state = QuestionnaireControllerStates.initial(
        questionnaires: [..._questionnarieRepository.questionnaires]);
  }
}
