import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'questions_state.dart';
import '../../models/answer/answer_model.dart';
import '../../providers/providers.dart';
import '../../repositories/concrete/questions_repository.dart';
import '../../utils/instance_controller/instance_controller.dart';

class QuestionsController extends StateNotifier<QuestionsState> {
  QuestionsController(
    this.ref,
  ) : super(QuestionsState(
          questions: InstanceController()
              .getByType<QuestionsRepository>()
              .allQuestions,
          answeredQuestions: [],
          answerStatuses: {},
          scope: null,
          component: null,
        ));

  Ref ref;

  final QuestionsRepository questionsRepository =
      InstanceController().getByType<QuestionsRepository>();

  void projectSelected() {
    final projectState = ref.read(projectProvider);
    final answeredQuestions = projectState.questionnaire!.ClosedQuestions
        .map((e) => e.position)
        .toList();
    final answerStatuses = {
      for (final answer in projectState.questionnaire!.ClosedQuestions)
        answer.position: answer.status
    };

    state = state.copyWith(
      answeredQuestions: answeredQuestions,
      answerStatuses: answerStatuses,
    );
  }

  void reset() {
    state = state.copyWith(
      questions: questionsRepository.allQuestions,
      scope: null,
      component: null,
      answeredQuestions: [],
      answerStatuses: {},
    );
  }

  void questionAnswered(int questionPosition, AnswerStatus answerStatus) {
    if (state.answeredQuestions.contains(questionPosition)) {
      final answerStatuses = {...state.answerStatuses};
      answerStatuses[questionPosition] = answerStatus;
      state = state.copyWith(
        answerStatuses: answerStatuses,
      );
      return;
    }

    state = state.copyWith(
      answeredQuestions: [...state.answeredQuestions, questionPosition],
      answerStatuses: {
        ...state.answerStatuses,
        questionPosition: answerStatus,
      },
    );
  }

  void questionCleared(int questionPosition) {
    if (!state.answeredQuestions.contains(questionPosition)) {
      return;
    }

    final answerStatuses = {...state.answerStatuses};
    answerStatuses.remove(questionPosition);
    state = state.copyWith(
      answeredQuestions: state.answeredQuestions
          .where((element) => element != questionPosition)
          .toList(),
      answerStatuses: answerStatuses,
    );
  }

  void setScopeAndComponent(Scope? scope, Component? component) {
    if (scope == null && component == null) {
      state = state.copyWith(
        questions: questionsRepository.allQuestions,
        scope: null,
        component: null,
      );
    } else if (scope != null && component == null) {
      state = state.copyWith(
        questions: questionsRepository.matrixQuestions[scope]!.values
            .expand((e) => e)
            .toList(),
        scope: scope,
        component: null,
      );
    } else if (scope == null && component != null) {
      state = state.copyWith(
        questions: questionsRepository.matrixQuestions2[component]!.values
            .expand((e) => e)
            .toList(),
        scope: null,
        component: component,
      );
    } else {
      state = state.copyWith(
        questions: questionsRepository.matrixQuestions[scope]![component]!,
        scope: scope,
        component: component,
      );
    }
  }
}
