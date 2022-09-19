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

class UpdateAnswerMutation extends MutatorCreatorI {
  const UpdateAnswerMutation() : super(mutation: r'''
  mutation updateAnswer($answerId: ID!, $answer: String!) {
    updateAnswers(where: { id: $answerId }, update: { answer: $answer }) {
      info {
        bookmark
      }
    }
  }

''', mutationName: 'UpdateAnswerMutation');

  @override
  MutationOptions<Object?> createMutationOptions({GraphQlArgsI? args}) {
    return MutationOptions(
      document: gql(mutation),
      variables: args?.createQueryArgs() ?? const {},
    );
  }
}

class UpdateAnswerMutationArgs extends GraphQlArgsI {
  final String answerId;
  final String answer;

  const UpdateAnswerMutationArgs({
    required this.answerId,
    required this.answer,
  }) : super(queryName: 'UpdateAnswerMutation');

  @override
  Map<String, dynamic> createQueryArgs() {
    return {
      'answerId': answerId,
      'answer': answer,
    };
  }
}
