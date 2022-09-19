import 'package:logger/logger.dart';
import 'package:mobile_client_new/models/question/question_model.dart';
import 'package:mobile_client_new/services/graphql/graphql_service.dart';
import 'package:mobile_client_new/services/graphql/quaries/get_question_query.dart';
import 'package:mobile_client_new/utils/instance_controller/instance_controller.dart';

class QuestionsRepository {
  final GraphQLService _graphQLService = InstanceController()[GraphQLService];

  final Logger _logger = InstanceController()[Logger];

  final List<QuestionModel> _allQuestions = [];

  List<QuestionModel> get allQuestions => _allQuestions;

  final Map<Scope, Map<Component, List<QuestionModel>>> _matrixQuestions = {};

  final Map<Component, Map<Scope, List<QuestionModel>>> _matrixQuestions2 = {};

  Map<Scope, Map<Component, List<QuestionModel>>> get matrixQuestions =>
      _matrixQuestions;
  Map<Component, Map<Scope, List<QuestionModel>>> get matrixQuestions2 =>
      _matrixQuestions2;

  Future<void> init() async {
    _allQuestions.clear();
    _matrixQuestions.clear();
    _matrixQuestions2.clear();

    final results = await _graphQLService.query(const GetQuestionQuery(), null);

    if (results.hasException) {
      _logger.e("QuestionsRepository: init: ${results.exception.toString()}");
      return;
    }

    _allQuestions.addAll(
      results.data?["questions"]
          .map<QuestionModel>((e) => QuestionModel.fromJson(e))
          .toList(),
    );

    for (final question in _allQuestions) {
      final Scope scope = _getScope(question.scope);
      final Component component = _getComponent(question.component);

      _matrixQuestions[scope] ??= {};
      _matrixQuestions[scope]![component] ??= [];
      _matrixQuestions2[component] ??= {};
      _matrixQuestions2[component]![scope] ??= [];

      _matrixQuestions[scope]![component]!.add(question);
      _matrixQuestions2[component]![scope]!.add(question);
    }

    _allQuestions.sort((a, b) => a.position.compareTo(b.position));

    _logger.i("QuestionsRepository: init: ${_allQuestions.length} questions");
  }
}

enum Scope { actors, objects, processes, impacts }

extension ScpoeExtension on Scope {
  String get name {
    switch (this) {
      case Scope.actors:
        return "Actors";
      case Scope.objects:
        return "Objects";
      case Scope.processes:
        return "Processes";
      case Scope.impacts:
        return "Impacts";
    }
  }
}

Scope _getScope(String scope) {
  switch (scope) {
    case "Actors":
      return Scope.actors;
    case "Objects":
      return Scope.objects;
    case "Processes":
      return Scope.processes;
    case "Impacts":
      return Scope.impacts;
    default:
      return Scope.actors;
  }
}

enum Component {
  transparancy,
  accountability,
  privacy,
  societalValues,
}

extension ComponentExtension on Component {
  String get name {
    switch (this) {
      case Component.transparancy:
        return "Transparancy";
      case Component.accountability:
        return "Accountability";
      case Component.privacy:
        return "Privacy";
      case Component.societalValues:
        return "Societal values";
    }
  }
}

Component _getComponent(String component) {
  switch (component) {
    case "Transparancy":
      return Component.transparancy;
    case "Accountability":
      return Component.accountability;
    case "Privacy":
      return Component.privacy;
    case "Societal values":
      return Component.societalValues;
    default:
      return Component.transparancy;
  }
}
