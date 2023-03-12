import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../../repositories/questionnaire_repository.dart';
import '../../repositories/questions_repository.dart';
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

  Future<void> refresh() async {
    ref.read(loadingProvider.notifier).startLoading();
    await questionnaireRepository.syncQuestionnaires();
    state = state.copyWith(
        questionnaires: questionnaireRepository.questionnaires,
        completionPercentages: _calculateCompletionPercentages());
    ref.read(loadingProvider.notifier).stopLoading();
  }

  void selectQuestionnaire(String id) async {
    ref.read(loadingProvider.notifier).startLoading();
    final data = await questionnaireRepository.syncQuestionnaire(id);
    state = state.copyWith(
        questionnaire: data,
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
    state = state.copyWith(
        questionnaire: data,
        questionnaires: questionnaireRepository.questionnaires,
        completionPercentages: _calculateCompletionPercentages());
    ref.read(questionsProvider.notifier).projectSelected();
    ref.read(loadingProvider.notifier).stopLoading();
  }

  void updateQuestionnaire(String id, String title, String description) async {
    ref.read(loadingProvider.notifier).startLoading();
    final data = await questionnaireRepository.updateQuestionnaire(
        id, title, description);
    state = state.copyWith(
        questionnaire: data,
        questionnaires: questionnaireRepository.questionnaires,
        completionPercentages: _calculateCompletionPercentages());
    ref.read(questionsProvider.notifier).projectSelected();
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
