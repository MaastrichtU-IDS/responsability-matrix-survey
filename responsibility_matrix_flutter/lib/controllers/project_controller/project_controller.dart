import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsibility_matrix_flutter/models/questionnaire/questionnaire_model.dart';
import 'package:responsibility_matrix_flutter/services/snackbar_service/snackbar_service.dart';

import '../../providers/providers.dart';
import '../../repositories/concrete/questionnaire_repository.dart';
import '../../repositories/concrete/questions_repository.dart';
import '../../utils/instance_controller/instance_controller.dart';
import 'project_state.dart';

class ProjectController extends StateNotifier<ProjectState> {
  ProjectController(this.ref)
      : super(ProjectState(
            questionnaire: null,
            questionnaires: InstanceController()
                .getByType<QuestionnaireRepository>()
                .questionnaires,
            completionPercentages: [
              for (final questionnaire in InstanceController()
                  .getByType<QuestionnaireRepository>()
                  .questionnaires)
                questionnaire.ClosedQuestions.length /
                    InstanceController()
                        .getByType<QuestionsRepository>()
                        .allQuestions
                        .length
            ]));

  final Ref ref;

  final QuestionnaireRepository questionnaireRepository =
      InstanceController().getByType<QuestionnaireRepository>();

  final QuestionsRepository questionsRepository =
      InstanceController().getByType<QuestionsRepository>();

  final SnackBarService _snackBarService =
      InstanceController().getByType<SnackBarService>();

  Future<void> refresh() async {
    ref.read(loadingProvider.notifier).startLoading();
    await questionnaireRepository.syncQuestionnaires();
    state = state.copyWith(
        questionnaires: questionnaireRepository.questionnaires,
        completionPercentages: _calculateCompletionPercentages());
    ref.read(loadingProvider.notifier).stopLoading();
  }

  void syncFromRepository() {
    state = state.copyWith(
        questionnaires: questionnaireRepository.questionnaires,
        completionPercentages: _calculateCompletionPercentages());
  }

  void selectQuestionnaire(String id) async {
    ref.read(loadingProvider.notifier).startLoading();
    final data = await questionnaireRepository.syncQuestionnaire(id);

    if (data.hasError) {
      ref.read(loadingProvider.notifier).stopLoading();
      _snackBarService.showErrorMessage(data.error?.toString() ?? 'error',
          clear: true);
      return;
    }

    state = state.copyWith(
        questionnaire: data.data,
        questionnaires: questionnaireRepository.questionnaires,
        completionPercentages: _calculateCompletionPercentages());
    ref.read(questionsProvider.notifier).projectSelected();
    ref.read(loadingProvider.notifier).stopLoading();
  }

  void deselectQuestionnaire() {
    state = ProjectState(
        questionnaire: null,
        questionnaires: questionnaireRepository.questionnaires,
        completionPercentages: _calculateCompletionPercentages());
    ref.read(questionsProvider.notifier).reset();
  }

  void addQuestionnaire(String title, String description) async {
    ref.read(loadingProvider.notifier).startLoading();
    final data =
        await questionnaireRepository.createQuestionnaire(title, description);

    if (data.hasError) {
      ref.read(loadingProvider.notifier).stopLoading();
      _snackBarService.showErrorMessage(data.error?.toString() ?? 'error',
          clear: true);
      return;
    }

    state = state.copyWith(
        questionnaire: data.data,
        questionnaires: questionnaireRepository.questionnaires,
        completionPercentages: _calculateCompletionPercentages());
    ref.read(questionsProvider.notifier).projectSelected();
    ref.read(loadingProvider.notifier).stopLoading();
  }

  void updateQuestionnaire(String id, String title, String description) async {
    ref.read(loadingProvider.notifier).startLoading();
    final data = await questionnaireRepository.updateQuestionnaire(
        id, title, description);

    if (data.hasError) {
      ref.read(loadingProvider.notifier).stopLoading();
      _snackBarService.showErrorMessage(data.error?.toString() ?? 'error',
          clear: true);
      return;
    }

    state = state.copyWith(
        questionnaires: questionnaireRepository.questionnaires,
        completionPercentages: _calculateCompletionPercentages());
    ref.read(loadingProvider.notifier).stopLoading();
  }

  void deleteQuestionnaire(String id) async {
    ref.read(loadingProvider.notifier).startLoading();
    await questionnaireRepository.deleteQuestionnaire(id);
    ref.read(questionsProvider.notifier).reset();
    ref.read(loadingProvider.notifier).stopLoading();
    if (state.questionnaire?.id == id) {
      state = state.copyWith(
          questionnaire: null,
          questionnaires: questionnaireRepository.questionnaires,
          completionPercentages: _calculateCompletionPercentages());
      return;
    }
    state = state.copyWith(
        questionnaires: questionnaireRepository.questionnaires,
        completionPercentages: _calculateCompletionPercentages());
  }

  List<double> _calculateCompletionPercentages() {
    return [
      for (final questionnaire in questionnaireRepository.questionnaires)
        questionnaire.ClosedQuestions.length /
            questionsRepository.allQuestions.length
    ];
  }
}
