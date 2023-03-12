import 'package:logger/logger.dart';

import '../models/question/question_model.dart';
import '../services/graphql/graphql_service.dart';
import '../services/graphql/queries/get_question_query.dart';
import '../utils/instance_controller/instance_controller.dart';

class QuestionsRepository {
  final GraphQLService _graphQLService = InstanceController()[GraphQLService];

  final Logger _logger = InstanceController()[Logger];

  final List<QuestionModel> _allQuestions = [];

  List<QuestionModel> get allQuestions => [..._allQuestions];

  final Map<Scope, Map<Component, List<QuestionModel>>> _matrixQuestions = {};

  final Map<Component, Map<Scope, List<QuestionModel>>> _matrixQuestions2 = {};

  final List<String> questionCodes = [];

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
      _logger.e('QuestionsRepository: init: ${results.exception.toString()}');
      return;
    }

    _allQuestions.addAll(
      results.data?['questions']
          .map<QuestionModel>((e) => QuestionModel.fromJson(e))
          .toList(),
    );

    final Map<Component, Map<Scope, int>> counter = {
      for (final component in Component.values)
        component: {
          for (final scope in Scope.values) scope: 1,
        },
    };

    for (final question in _allQuestions) {
      final Scope scope = getScope(question.scope);
      final Component component = getComponent(question.component);

      questionCodes.add(component.name[0] +
          scope.name[0] +
          counter[component]![scope]!.toString());

      counter[component]![scope] = counter[component]![scope]! + 1;

      _matrixQuestions[scope] ??= {};
      _matrixQuestions[scope]![component] ??= [];
      _matrixQuestions2[component] ??= {};
      _matrixQuestions2[component]![scope] ??= [];

      _matrixQuestions[scope]![component]!.add(question);
      _matrixQuestions2[component]![scope]!.add(question);
    }

    _allQuestions.sort((a, b) => a.position.compareTo(b.position));

    _logger.i('QuestionsRepository: init: ${_allQuestions.length} questions');
  }

  String getQuestionCode(int position) {
    return questionCodes[position - 1];
  }

  QuestionModel getQuestionByPosition(int position) {
    return _allQuestions.firstWhere((element) => element.position == position);
  }
}

enum Scope { actors, objects, process, impact }

Scope getScope(String scope) {
  switch (scope) {
    case 'Actors':
      return Scope.actors;
    case 'Objects':
      return Scope.objects;
    case 'Process':
      return Scope.process;
    case 'Impact':
      return Scope.impact;
    default:
      return Scope.actors;
  }
}

enum Component {
  transparency,
  accountability,
  privacy,
  societalValues,
}

Component getComponent(String component) {
  switch (component) {
    case 'Transparency':
      return Component.transparency;
    case 'Accountability':
      return Component.accountability;
    case 'Privacy':
      return Component.privacy;
    case 'Societal values':
      return Component.societalValues;
    default:
      return Component.transparency;
  }
}
