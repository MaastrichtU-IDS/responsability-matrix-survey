import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_client_new/models/answer/answer_model.dart';
import 'package:mobile_client_new/repositories/questions_repository.dart';
import '../../models/question/question_model.dart';
import '../../repositories/questionnaire_repository.dart';
import '../../services/graphql/graphql_service.dart';
import '../../services/graphql/mutations/create_answer_mutation.dart';
import '../../services/graphql/mutations/update_answer_mutation.dart';
import '../../utils/instance_controller/instance_controller.dart';
import '../../views/root/root.dart';

class QuestionController extends StateNotifier<QuestionModel?> {
  QuestionController(this.ref) : super(null);

  final Ref ref;

  final GraphQLService _graphQLService = InstanceController()[GraphQLService];
  final QuestionnaireRepository _questionnaireRepository =
      InstanceController()[QuestionnaireRepository];
  final QuestionsRepository _questionsRepository =
      InstanceController()[QuestionsRepository];

  void setQuestion(QuestionModel question) {
    state = question;
  }

  void updateState() {
    state = state?.copyWith();
  }

  void clearQuestion() {
    state = null;
  }

  Future<String?> answerQuestion(String answer, AnswerStatus status) async {
    ref.read(rootLoading.notifier).setLoading(true);
    if ((_questionnaireRepository
                .selectedQuestionnaire?.ClosedQuestionsIndex.isNotEmpty ??
            false) &&
        (_questionnaireRepository.selectedQuestionnaire?.ClosedQuestionsIndex
                .contains(state!.position) ??
            false)) {
      final answerId = _questionnaireRepository
          .selectedQuestionnaire!.ClosedQuestions
          .firstWhere((element) => element.position == state!.position)
          .id;

      return await updateAnswer(answerId, answer, status);
    }
    final result = await _graphQLService.mutate(
        const CreateAnswerMutation(),
        CreateAnswerMutationArgs(
          questionAnswer: answer,
          questionComponent: state!.component,
          questionId: state!.id,
          questionPosition: state!.position,
          questionScope: state!.scope,
          questionStatus: status.name,
          questionnaireId: _questionnaireRepository.selectedQuestionnaire!.id,
        ));

    if (result.hasException) {
      return result.exception.toString();
    }

    await _questionnaireRepository.syncQuestionnaire();

    state = state?.copyWith();

    ref.read(rootLoading.notifier).setLoading(false);

    return null;
  }

  Future<String?> updateAnswer(
      String answerId, String answer, AnswerStatus status) async {
    ref.read(rootLoading.notifier).setLoading(true);
    final result = await _graphQLService.mutate(
        const UpdateAnswerMutation(),
        UpdateAnswerMutationArgs(
            answerId: answerId, answer: answer, status: status.name));

    if (result.hasException) {
      return result.exception.toString();
    }

    await _questionnaireRepository.syncQuestionnaire();

    state = state?.copyWith();

    ref.read(rootLoading.notifier).setLoading(false);

    return null;
  }

  String getQuestionCode(int id) {
    return _questionsRepository.getQuestionCode(id);
  }
}
