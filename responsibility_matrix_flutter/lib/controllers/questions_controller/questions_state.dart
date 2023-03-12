import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/answer/answer_model.dart';
import '../../models/question/question_model.dart';
import '../../repositories/questions_repository.dart';

part 'questions_state.freezed.dart';

@freezed
class QuestionsState with _$QuestionsState {
  factory QuestionsState({
    required List<QuestionModel> questions,
    required List<int> answeredQuestions,
    required Map<int, AnswerStatus> answerStatuses,
    required Scope? scope,
    required Component? component,
  }) = _QuestionsState;
}
