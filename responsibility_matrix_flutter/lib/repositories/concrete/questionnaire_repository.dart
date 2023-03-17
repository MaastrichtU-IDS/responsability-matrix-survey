import 'package:responsibility_matrix_flutter/repositories/interfaces/repository_i.dart';
import 'package:responsibility_matrix_flutter/repositories/models/repository_response_model.dart';

import '../../models/answer/answer_model.dart';
import '../../models/question/question_model.dart';
import '../../models/questionnaire/questionnaire_model.dart';
import '../../services/graphql/graphql_service.dart';
import '../../services/graphql/mutations/create_answer_mutation.dart';
import '../../services/graphql/mutations/create_questionnaire_mutation.dart';
import '../../services/graphql/mutations/delete_answer_mutation.dart';
import '../../services/graphql/mutations/delete_questionnaire_mutation.dart';
import '../../services/graphql/mutations/update_answer_mutation.dart';
import '../../services/graphql/mutations/update_questionnaire_mutation.dart';
import '../../services/graphql/queries/get_all_questionnaire_query.dart';
import '../../services/graphql/queries/get_questionnaire_query.dart';
import '../../utils/instance_controller/instance_controller.dart';
import 'user_repository.dart';

class QuestionnaireRepository extends IRepository {
  final GraphQLService _graphQLService = InstanceController()[GraphQLService];
  final UserRepository _userRepository = InstanceController()[UserRepository];

  List<QuestionnaireModel> _questionnaires = [];

  List<QuestionnaireModel> get questionnaires => [..._questionnaires];

  Future<void> init() async {
    await syncQuestionnaires();
  }

  Future<RepositoryResponseModel<QuestionnaireModel>> createQuestionnaire(
      String title, String description) async {
    final result = await _graphQLService.mutate(
        const CreateQuestionnaireMutation(),
        CreateQuestionnaireMutationArgs(
            uuid: _userRepository.user!.uuid,
            title: title,
            description: description));

    if (result.hasError) {
      return RepositoryResponseModel<QuestionnaireModel>.error(
          onError(QuestionnaireRepository, result.error!.message));
    }

    final data = result.data!['createQuestionnaires']['questionnaires'];
    final newQuestionnaire = QuestionnaireModel.fromJson(data[0]);

    _questionnaires = [
      ..._questionnaires,
      newQuestionnaire,
    ];
    return RepositoryResponseModel<QuestionnaireModel>.data(newQuestionnaire);
  }

  Future<RepositoryResponseModel> syncQuestionnaires() async {
    final result = await _graphQLService.query(const GetAllQuestionnaireQuery(),
        GetAllQuestionnaireQueryArgs(uuid: _userRepository.user!.uuid));

    if (result.hasError) {
      return RepositoryResponseModel.error(
          onError(QuestionnaireRepository, result.error!.message));
    }

    _questionnaires = (result.data!['questionnaires'] as List)
        .map((e) => QuestionnaireModel.fromJson(e))
        .toList();

    return RepositoryResponseModel.empty();
  }

  Future<RepositoryResponseModel<QuestionnaireModel>> syncQuestionnaire(
    String questionnaireId,
  ) async {
    final result = await _graphQLService.query(const GetQuestionnaireQuery(),
        GetQuestionnaireQueryArgs(id: questionnaireId));

    if (result.hasError) {
      return RepositoryResponseModel<QuestionnaireModel>.error(
          onError(QuestionnaireRepository, result.error!.message));
    }

    final questionnaire =
        QuestionnaireModel.fromJson(result.data!['questionnaires'][0]);

    final index =
        _questionnaires.indexWhere((element) => element.id == questionnaireId);
    if (index != -1) {
      _questionnaires[index] = questionnaire;
    }

    return RepositoryResponseModel<QuestionnaireModel>.data(questionnaire);
  }

  Future<RepositoryResponseModel> deleteQuestionnaire(String id) async {
    final result = await _graphQLService.mutate(
        const DeleteQuestionnaire(), DeleteQuestionnaireArgs(id: id));

    if (result.hasError) {
      return RepositoryResponseModel.error(
          onError(QuestionnaireRepository, result.error!.message));
    }

    return await syncQuestionnaires();
  }

  Future<RepositoryResponseModel<QuestionnaireModel>> updateQuestionnaire(
      String id, String title, String description) async {
    final result = await _graphQLService.mutate(
        const UpdateQuestionnaire(),
        UpdateQuestionnaireArgs(
            id: id, title: title, description: description));

    if (result.hasError) {
      return RepositoryResponseModel<QuestionnaireModel>.error(
          onError(QuestionnaireRepository, result.error!.message));
    }

    return await syncQuestionnaire(id);
  }

  Future<RepositoryResponseModel<QuestionnaireModel>> answerQuestion(
    QuestionnaireModel questionnaire,
    QuestionModel question,
    String answer,
    AnswerStatus status,
  ) async {
    final isAnswered = questionnaire.ClosedQuestions.any(
        (element) => element.position == question.position);

    Future<RepositoryResponseModel> call;

    if (isAnswered) {
      final answerId = questionnaire.ClosedQuestions.firstWhere(
          (element) => element.position == question.position).id;
      call = _updateAnswer(answerId, answer, status);
    } else {
      call = _createAnswer(questionnaire, question, answer, status);
    }

    final result = await call;

    if (result.hasError) {
      return RepositoryResponseModel<QuestionnaireModel>.error(result.error!);
    }

    return await syncQuestionnaire(questionnaire.id);
  }

  Future<RepositoryResponseModel> _createAnswer(
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

    if (result.hasError) {
      return RepositoryResponseModel.error(
          onError(QuestionnaireRepository, result.error!.message));
    }

    return RepositoryResponseModel.empty();
  }

  Future<RepositoryResponseModel> _updateAnswer(
    String answerId,
    String answer,
    AnswerStatus status,
  ) async {
    final result = await _graphQLService.mutate(
        const UpdateAnswerMutation(),
        UpdateAnswerMutationArgs(
            answerId: answerId, answer: answer, status: status.name));

    if (result.hasError) {
      return RepositoryResponseModel.error(
          onError(QuestionnaireRepository, result.error!.message));
    }

    return RepositoryResponseModel.empty();
  }

  Future<RepositoryResponseModel> clearAnswer(String answerId) async {
    final result = await _graphQLService.mutate(
        const DeleteAnswer(), DeleteAnswerArgs(id: answerId));

    if (result.hasError) {
      return RepositoryResponseModel.error(
          onError(QuestionnaireRepository, result.error!.message));
    }

    await syncQuestionnaires();

    return RepositoryResponseModel.empty();
  }
}
