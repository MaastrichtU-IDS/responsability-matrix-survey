import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_client_new/models/question/question_model.dart';
import 'package:mobile_client_new/repositories/questionairee_repository.dart';
import 'package:mobile_client_new/repositories/questions_repository.dart';
import 'package:mobile_client_new/utils/instance_controller/instance_controller.dart';

class QuestionsListController extends StateNotifier<List<QuestionModel>> {
  QuestionsListController(this.ref) : super([..._qusetionsRepository.allQuestions]);

  final Ref ref;

  Scope? _scope;
  Component? _component;

  Scope? get scope => _scope;

  Component? get component => _component;

  static final QuestionsRepository _qusetionsRepository =
      InstanceController()[QuestionsRepository];

  final QuestionnarieRepository _questionnarieRepository =
      InstanceController()[QuestionnarieRepository];

  void setScopeAndComponent(Scope? scope, Component? component) {
    _scope = scope;
    _component = component;
    if (_scope == null && _component == null) {
      state = [..._qusetionsRepository.allQuestions];
    } else if (_scope != null && _component == null) {
      state = [
        ..._qusetionsRepository.matrixQuestions[_scope]!.values.expand((e) => e)
      ];
    } else if (_scope == null && _component != null) {
      state = [
        ..._qusetionsRepository.matrixQuestions2[_component]!.values
            .expand((e) => e)
      ];
    } else {
      state = [..._qusetionsRepository.matrixQuestions[_scope]![_component]!];
    }
  }

  bool isAnswered(QuestionModel question) {
    return _questionnarieRepository.selectedQuestionnaire?.ClosedQuestionsIndex
            .contains(question.position) ??
        false;
  }

  void updateState() {
    state = [...state];
  }
}
