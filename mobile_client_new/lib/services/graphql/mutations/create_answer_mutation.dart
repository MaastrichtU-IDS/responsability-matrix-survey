/*

# User Schema

type Questionnaire {
    User: User! @relationship(type: "has_questionnaire", direction: IN)
    id: ID @id
    title: String!
    description: String!
    ClosedQuestions: [Answer!]! @relationship(type: "has_answered", direction: OUT)
    ClosedQuestionsIndex: [Int]
}
*/

import 'package:graphql/client.dart';
import 'package:mobile_client_new/services/graphql/interfaces/graphql_args_i.dart';
import 'package:mobile_client_new/services/graphql/interfaces/graphql_mutation_i.dart';

class CreateAnswerMutation extends MutatorCreatorI {
  const CreateAnswerMutation() : super(mutation: r'''
  mutation createAnswer(
    $questionnaireId: ID!
    $questionScope: String!
    $questionAnswer: String!
    $questionComponent: String!
    $questionPosition: Int!
    $questionId: ID!
  ) {
    updateQuestionnaires(
      where: { id: $questionnaireId }
      create: {
        ClosedQuestions: {
          node: {
            component: $questionComponent
            scope: $questionScope
            answer: $questionAnswer
            position: $questionPosition
            Question: { connect: { where: { node: { id: $questionId } } } }
          }
        }
      }
      update:{
        ClosedQuestionsIndex_PUSH:[$questionPosition]
      }
    ) {
      info {
        nodesCreated
      }
    }
  }
''', mutationName: 'CreateAnswerMutation');

  @override
  MutationOptions<Object?> createMutationOptions({GraphQlArgsI? args}) {
    return MutationOptions(
      document: gql(mutation),
      variables: args?.createQueryArgs() ?? const {},
    );
  }
}

class CreateAnswerMutationArgs extends GraphQlArgsI {
  final String questionnaireId;
  final String questionScope;
  final String questionAnswer;
  final String questionComponent;
  final int questionPosition;
  final String questionId;

  const CreateAnswerMutationArgs({
    required this.questionnaireId,
    required this.questionScope,
    required this.questionAnswer,
    required this.questionComponent,
    required this.questionPosition,
    required this.questionId,
  }) : super(queryName: 'CreateAnswerMutation');

  @override
  Map<String, dynamic> createQueryArgs() {
    return {
      'questionnaireId': questionnaireId,
      'questionScope': questionScope,
      'questionAnswer': questionAnswer,
      'questionComponent': questionComponent,
      'questionPosition': questionPosition,
      'questionId': questionId,
    };
  }
}
