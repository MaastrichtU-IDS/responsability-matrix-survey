import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_model.freezed.dart';
part 'answer_model.g.dart';

/*
# Answer Schema

type Answer {
    Questionnaire: [Questionnaire!]! @relationship(type: "has_answered", direction: IN)
    Question: Question @relationship(type: "has_question", direction: IN)
    id: ID! @id
    component: String!
    scope: String!
    answer: String!
    position: Int!
}
*/

@freezed
class AnswerModel with _$AnswerModel {
  factory AnswerModel({
    required String id,
    required String component,
    required String scope,
    required String answer,
    required int position,
  }) = _AnswerModel;

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);
}
