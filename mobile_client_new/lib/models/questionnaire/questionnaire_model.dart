import 'package:freezed_annotation/freezed_annotation.dart';
import '../answer/answer_model.dart';

part 'questionnaire_model.freezed.dart';
part 'questionnaire_model.g.dart';

/*

# Questionnaire Schema

type Questionnaire {
    id: ID!
    title: String!
    description: String!
    ClosedQuestions: [Answer!]! @relationship(type: "has_answered", direction: OUT)
    ClosedQuestionsIndex: [Int]
}



*/

@freezed
class QuestionnaireModel with _$QuestionnaireModel {
  factory QuestionnaireModel({
    required String id,
    required List<int> ClosedQuestionsIndex,
    required List<AnswerModel> ClosedQuestions,
    required String title,
    required String description,
  }) = _QuestionnaireModel;

  factory QuestionnaireModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionnaireModelFromJson(json);
}

@freezed
class QuestionnaireModelMini with _$QuestionnaireModelMini {
  factory QuestionnaireModelMini({
    required String id,
    required String title,
  }) = _QuestionnaireModelMini;

  factory QuestionnaireModelMini.fromJson(Map<String, dynamic> json) =>
      _$QuestionnaireModelMiniFromJson(json);
}
