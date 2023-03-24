import '../models/questionnaire/questionnaire_model.dart';
import 'user_repository.dart';
import '../services/graphql/graphql_service.dart';
import '../services/graphql/mutations/create_questionnaire_mutation.dart';
import '../services/graphql/mutations/delete_questionnaire_mutation.dart';
import '../services/graphql/mutations/update_questionnaire_mutation.dart';
import '../services/graphql/quaries/get_all_quetionnarie_query.dart';
import '../services/graphql/quaries/get_questionnarie_query.dart';
import '../utils/instance_controller/instance_controller.dart';

class QuestionnaireRepository {
  final GraphQLService _graphQLService = InstanceController()[GraphQLService];
  final UserRepository _userRepository = InstanceController()[UserRepository];

  List<QuestionnaireModel> _questionnaires = [];

  QuestionnaireModel? _selectedQuestionnaire;

  QuestionnaireModel? get selectedQuestionnaire => _selectedQuestionnaire;

  List<QuestionnaireModel> get questionnaires => _questionnaires;

  Future<void> init() async {
    await syncQuestionnaires();
  }

  Future<QuestionnaireModel> createQuestionnaire(
      String title, String description) async {
    final result = await _graphQLService.mutate(
        const CreateQuestionnarieMutation(),
        CreateQuestionnarieMutationArgs(
            uuid: _userRepository.user!.uuid,
            title: title,
            description: description));

    if (result.hasException) {
      throw result.exception!;
    }

    final data = result.data!['createQuestionnaires']['questionnaires'];
    _selectedQuestionnaire = QuestionnaireModel.fromJson(data[0]);

    _questionnaires = [
      ..._questionnaires,
      _selectedQuestionnaire!,
    ];
    return _selectedQuestionnaire!;
  }

  Future<void> syncQuestionnaires() async {
    final result = await _graphQLService.query(const GetAllQuestionnarieQuery(),
        GetAllQuestionnarieQueryArgs(uuid: _userRepository.user!.uuid));

    if (result.hasException) {
      throw result.exception!;
    }

    _questionnaires = (result.data!['questionnaires'] as List)
        .map((e) => QuestionnaireModel.fromJson(e))
        .toList();
  }

  Future<QuestionnaireModel> syncQuestionnaire() async {
    final result = await _graphQLService.query(const GetQuestionnarieQuery(),
        GetQuestionnarieQueryArgs(id: _selectedQuestionnaire!.id));

    if (result.hasException) {
      throw result.exception!;
    }

    _selectedQuestionnaire =
        QuestionnaireModel.fromJson(result.data!['questionnaires'][0]);

    final index = _questionnaires
        .indexWhere((element) => element.id == _selectedQuestionnaire!.id);
    if (index != -1) {
      _questionnaires[index] = _selectedQuestionnaire!;
    }

    return _selectedQuestionnaire!;
  }

  Future<QuestionnaireModel> selectQuestionnaire(questionnaireId) async {
    final result = await _graphQLService.query(const GetQuestionnarieQuery(),
        GetQuestionnarieQueryArgs(id: questionnaireId));

    if (result.hasException) {
      throw result.exception!;
    }

    _selectedQuestionnaire =
        QuestionnaireModel.fromJson(result.data!['questionnaires'][0]);

    final index = _questionnaires
        .indexWhere((element) => element.id == _selectedQuestionnaire!.id);

    if (index != -1) {
      _questionnaires[index] = _selectedQuestionnaire!;
    }

    _questionnaires = [..._questionnaires];

    return _selectedQuestionnaire!;
  }

  void deselectQuestionnaire() {
    _selectedQuestionnaire = null;
  }

  Future<void> deleteQuestionnaire(
      QuestionnaireModel questionnaireModel) async {
    final result = await _graphQLService.mutate(const DeleteQuestionnaire(),
        DeleteQuestionnaireArgs(id: questionnaireModel.id));
    if (result.hasException) {
      throw result.exception!;
    }

    await syncQuestionnaires();
  }

  Future<void> updateQuestionnaire(
      String id, String title, String description) async {
    final result = await _graphQLService.mutate(
        const UpdateQuestionnaire(),
        UpdateQuestionnaireArgs(
            id: id, title: title, description: description));

    if (result.hasException) {
      throw result.exception!;
    }

    await syncQuestionnaires();
  }
}
