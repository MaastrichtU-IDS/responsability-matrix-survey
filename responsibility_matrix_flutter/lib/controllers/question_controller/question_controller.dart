import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/answer/answer_model.dart';
import '../../models/question/question_model.dart';
import '../../models/questionnaire/questionnaire_model.dart';
import '../../providers/providers.dart';
import '../../repositories/questionnaire_repository.dart';
import '../../utils/instance_controller/instance_controller.dart';
import 'question_state.dart';

class QuestionController extends StateNotifier<QuestionState> {
  QuestionController(
    this.ref, {
    required QuestionnaireModel questionnaire,
    required QuestionModel question,
    required AnswerModel? answer,
    required String questionCode,
    required AnswerStatus currentStatus,
    required String currentText,
  }) : super(QuestionState(
          questionnaire: questionnaire,
          question: question,
          answer: answer,
          questionCode: questionCode,
          currentStatus: currentStatus,
          currentText: currentText,
        ));

  Ref ref;

  final QuestionnaireRepository questionnaireRepository =
      InstanceController().getByType<QuestionnaireRepository>();

  void setTextField(String text) {
    state = state.copyWith(
      currentText: text,
    );
  }

  void setStatus(AnswerStatus status) {
    state = state.copyWith(
      currentStatus: status,
    );
  }

  void answerQuestion() async {
    ref.read(loadingProvider.notifier).startLoading();
    await questionnaireRepository.answerQuestion(
      state.questionnaire,
      state.question,
      state.currentText,
      state.currentStatus,
    );

    final questionnaire = questionnaireRepository.questionnaires.firstWhere(
      (element) => element.id == state.questionnaire.id,
    );

    ref
        .read(questionsProvider.notifier)
        .questionAnswered(state.question.position, state.currentStatus);
    state = state.copyWith(
      questionnaire: questionnaire,
      answer: questionnaire.ClosedQuestions.firstWhere(
        (element) => element.position == state.question.position,
      ),
    );

    ref.read(loadingProvider.notifier).stopLoading();
  }

  void clearAnswer() async {
    if (state.answer == null) return;
    ref.read(loadingProvider.notifier).startLoading();
    await questionnaireRepository.clearAnswer(state.answer!.id);
    ref
        .read(questionsProvider.notifier)
        .questionCleared(state.question.position);

    state = state.copyWith(
      answer: null,
      currentStatus: AnswerStatus.applicable,
      currentText: '',
    );
    ref.read(loadingProvider.notifier).stopLoading();
  }
}
