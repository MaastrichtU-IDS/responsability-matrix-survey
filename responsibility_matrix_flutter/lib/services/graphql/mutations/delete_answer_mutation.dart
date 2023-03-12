/*

type Questionnaire {
    User: User! @relationship(type: "has_questionnaire", direction: IN)
    id: ID @id
    title: String!
    description: String!
    ClosedQuestions: [Answer!]! @relationship(type: "has_answered", direction: OUT)
}
*/

import 'package:graphql/client.dart';
import 'package:responsibility_matrix_flutter/services/graphql/interfaces/graphql_args_i.dart';
import 'package:responsibility_matrix_flutter/services/graphql/interfaces/graphql_mutation_i.dart';

class DeleteAnswer extends MutatorCreatorI {
  const DeleteAnswer() : super(mutation: r'''
  mutation DeleteAnswer($answerId: ID!) {
    deleteAnswers(where: { id: $answerId }, delete: {}) {
      nodesDeleted
    }
  }

''', mutationName: 'DeleteAnswer');

  @override
  MutationOptions<Object?> createMutationOptions({GraphQlArgsI? args}) {
    return MutationOptions(
      document: gql(mutation),
      variables: args?.createQueryArgs() ?? const {},
    );
  }
}

class DeleteAnswerArgs extends GraphQlArgsI {
  final String id;

  const DeleteAnswerArgs({
    required this.id,
  }) : super(queryName: 'DeleteAnswer');

  @override
  Map<String, dynamic> createQueryArgs() {
    return {
      'answerId': id,
    };
  }
}
