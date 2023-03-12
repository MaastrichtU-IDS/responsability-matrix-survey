import '../models/answer/answer_model.dart';
import '../models/question/question_model.dart';
import '../models/questionnaire/questionnaire_model.dart';
import '../services/graphql/graphql_service.dart';
import '../services/graphql/mutations/create_answer_mutation.dart';
import '../services/graphql/mutations/create_questionnaire_mutation.dart';
import '../services/graphql/mutations/delete_answer_mutation.dart';
import '../services/graphql/mutations/delete_questionnaire_mutation.dart';
import '../services/graphql/mutations/update_answer_mutation.dart';
import '../services/graphql/mutations/update_questionnaire_mutation.dart';
import '../services/graphql/queries/get_all_questionnaire_query.dart';
import '../services/graphql/queries/get_questionnaire_query.dart';
import '../utils/instance_controller/instance_controller.dart';
import 'user_repository.dart';

class QuestionnaireRepository {
  final GraphQLService _graphQLService = InstanceController()[GraphQLService];
  final UserRepository _userRepository = InstanceController()[UserRepository];

  List<QuestionnaireModel> _questionnaires = [];

  List<QuestionnaireModel> get questionnaires => [..._questionnaires];

  Future<void> init() async {
    await syncQuestionnaires();
  }

  Future<QuestionnaireModel> createQuestionnaire(
      String title, String description) async {
    final result = await _graphQLService.mutate(
        const CreateQuestionnaireMutation(),
        CreateQuestionnaireMutationArgs(
            uuid: _userRepository.user!.uuid,
            title: title,
            description: description));

    if (result.hasException) {
      throw result.exception!;
    }

    final data = result.data!['createQuestionnaires']['questionnaires'];
    final newQuestionnaire = QuestionnaireModel.fromJson(data[0]);

    _questionnaires = [
      ..._questionnaires,
      newQuestionnaire,
    ];
    return newQuestionnaire;
  }

  Future<void> syncQuestionnaires() async {
    final result = await _graphQLService.query(const GetAllQuestionnaireQuery(),
        GetAllQuestionnaireQueryArgs(uuid: _userRepository.user!.uuid));

    if (result.hasException) {
      throw result.exception!;
    }

    _questionnaires = (result.data!['questionnaires'] as List)
        .map((e) => QuestionnaireModel.fromJson(e))
        .toList();
  }

  Future<QuestionnaireModel> syncQuestionnaire(
    String questionnaireId,
  ) async {
    final result = await _graphQLService.query(const GetQuestionnaireQuery(),
        GetQuestionnaireQueryArgs(id: questionnaireId));

    if (result.hasException) {
      throw result.exception!;
    }

    final questionnaire =
        QuestionnaireModel.fromJson(result.data!['questionnaires'][0]);

    final index =
        _questionnaires.indexWhere((element) => element.id == questionnaireId);
    if (index != -1) {
      _questionnaires[index] = questionnaire;
    }

    return questionnaire;
  }

  Future<void> deleteQuestionnaire(String id) async {
    final result = await _graphQLService.mutate(
        const DeleteQuestionnaire(), DeleteQuestionnaireArgs(id: id));
    if (result.hasException) {
      throw result.exception!;
    }

    await syncQuestionnaires();
  }

  Future<QuestionnaireModel> updateQuestionnaire(
      String id, String title, String description) async {
    final result = await _graphQLService.mutate(
        const UpdateQuestionnaire(),
        UpdateQuestionnaireArgs(
            id: id, title: title, description: description));

    if (result.hasException) {
      throw result.exception!;
    }

    return await syncQuestionnaire(id);
  }

  Future<void> answerQuestion(
    QuestionnaireModel questionnaire,
    QuestionModel question,
    String answer,
    AnswerStatus status,
  ) async {
    if (questionnaire.ClosedQuestions.any(
        (element) => element.position == question.position)) {
      final answerId = questionnaire.ClosedQuestions.firstWhere(
          (element) => element.position == question.position).id;
      await _updateAnswer(answerId, answer, status);
    } else {
      await _createAnswer(questionnaire, question, answer, status);
    }
    await syncQuestionnaire(questionnaire.id);
  }

  Future<void> _createAnswer(
    QuestionnaireModel questionnaire,
    QuestionModel question,
    String answer,
    AnswerStatus status,
  ) async {
    final result = await _graphQLService.mutate(
        const CreateAnswerMutation(),
        CreateAnswerMutationArgs(
          questionAnswer: answer,
          questionComponent: question.component,
          questionId: question.id,
          questionPosition: question.position,
          questionScope: question.scope,
          questionStatus: status.name,
          questionnaireId: questionnaire.id,
        ));

    if (result.hasException) {
      throw result.exception!;
    }
  }

  Future<void> _updateAnswer(
    String answerId,
    String answer,
    AnswerStatus status,
  ) async {
    final result = await _graphQLService.mutate(
        const UpdateAnswerMutation(),
        UpdateAnswerMutationArgs(
            answerId: answerId, answer: answer, status: status.name));

    if (result.hasException) {
      throw result.exception!;
    }
  }

  Future<void> clearAnswer(String answerId) async {
    final result = await _graphQLService.mutate(
        const DeleteAnswer(), DeleteAnswerArgs(id: answerId));

    if (result.hasException) {
      throw result.exception!;
    }

    await syncQuestionnaires();
  }
}
