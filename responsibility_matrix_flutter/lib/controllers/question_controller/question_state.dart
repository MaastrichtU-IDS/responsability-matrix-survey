import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/answer/answer_model.dart';
import '../../models/question/question_model.dart';
import '../../models/questionnaire/questionnaire_model.dart';

part 'question_state.freezed.dart';

@freezed
class QuestionState with _$QuestionState {
  factory QuestionState({
    required QuestionnaireModel questionnaire,
    required QuestionModel question,
    required AnswerModel? answer,
    required String questionCode,
    required AnswerStatus currentStatus,
    required String currentText,
  }) = _QuestionState;
}
