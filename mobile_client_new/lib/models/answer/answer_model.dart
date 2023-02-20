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
    @Default('applicable') String status,
    required int position,
  }) = _AnswerModel;

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);
}

enum AnswerStatus { applicable, notApplicable, dontKnow }

extension AnswerStatusExtension on AnswerStatus {
  String get value {
    switch (this) {
      case AnswerStatus.applicable:
        return 'applicable';
      case AnswerStatus.notApplicable:
        return 'notApplicable';
      case AnswerStatus.dontKnow:
        return 'dontKnow';
    }
  }
}

AnswerStatus answerStatusFromString(String status) {
  switch (status) {
    case 'applicable':
      return AnswerStatus.applicable;
    case 'notApplicable':
      return AnswerStatus.notApplicable;
    case 'dontKnow':
      return AnswerStatus.dontKnow;
    default:
      return AnswerStatus.applicable;
  }
}
