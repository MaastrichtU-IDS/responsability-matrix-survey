import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

/*

# Question Schema

type Question {
    id: ID!
    component: String!
    scope: String!
    question: String!
    position: Int!
}

*/

@freezed
class QuestionModel with _$QuestionModel {
  factory QuestionModel({
    required String id,
    required String component,
    required String scope,
    required String question,
    required int position,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}
