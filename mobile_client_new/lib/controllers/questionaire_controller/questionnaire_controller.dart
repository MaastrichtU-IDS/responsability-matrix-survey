import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'questionnaire_controller_states.dart';
import '../../models/questionnaire/questionnaire_model.dart';
import '../../repositories/questionnaire_repository.dart';
import '../../utils/instance_controller/instance_controller.dart';
import '../../views/root/root.dart';

class QuestionnaireController
    extends StateNotifier<QuestionnaireControllerStates> {
  QuestionnaireController(this.ref)
      : super(QuestionnaireControllerStates.initial(
            questionnaires: [..._questionnaireRepository.questionnaires]));

  final Ref ref;

  static final QuestionnaireRepository _questionnaireRepository =
      InstanceController()[QuestionnaireRepository];

  void createQuestionnaire(String title, String description) async {
    ref.read(rootLoading.notifier).setLoading(true);
    state = QuestionnaireControllerStates.loading(
        questionnaires: [..._questionnaireRepository.questionnaires]);
    final result =
        await _questionnaireRepository.createQuestionnaire(title, description);
    state = QuestionnaireControllerStates.selected(
        selectedQuestionnaire: result,
        questionnaires: [..._questionnaireRepository.questionnaires]);
    ref.read(rootLoading.notifier).setLoading(false);
  }

  void selectQuestionnaire(QuestionnaireModel questionnaire) async {
    ref.read(rootLoading.notifier).setLoading(true);
    state = QuestionnaireControllerStates.loading(
        questionnaires: [..._questionnaireRepository.questionnaires]);
    final result =
        await _questionnaireRepository.selectQuestionnaire(questionnaire.id);
    state = QuestionnaireControllerStates.selected(
        selectedQuestionnaire: result,
        questionnaires: [..._questionnaireRepository.questionnaires]);
    ref.read(rootLoading.notifier).setLoading(false);
  }

  Future<void> updateState() async {
    state = QuestionnaireControllerStates.selected(
        selectedQuestionnaire:
            await _questionnaireRepository.syncQuestionnaire(),
        questionnaires: [..._questionnaireRepository.questionnaires]);
  }

  QuestionnaireModel? get selectedQuestionnaire =>
      _questionnaireRepository.selectedQuestionnaire;

  void deselectQuestionnaire() {
    _questionnaireRepository.deselectQuestionnaire();
    state = QuestionnaireControllerStates.initial(
        questionnaires: [..._questionnaireRepository.questionnaires]);
  }

  Future<void> deleteQuestionnaire(
      QuestionnaireModel questionnaireModel) async {
    await _questionnaireRepository.deleteQuestionnaire(questionnaireModel);

    deselectQuestionnaire();
    state = QuestionnaireControllerStates.initial(
        questionnaires: [..._questionnaireRepository.questionnaires]);
  }

  Future<void> updateQuestionnaire(
      String id, String title, String description) async {
    await _questionnaireRepository.updateQuestionnaire(id, title, description);
    state = QuestionnaireControllerStates.initial(
        questionnaires: [..._questionnaireRepository.questionnaires]);
  }
}
