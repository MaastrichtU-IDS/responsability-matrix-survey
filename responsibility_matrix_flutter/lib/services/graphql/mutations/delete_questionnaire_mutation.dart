/*

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
import 'package:responsibility_matrix_flutter/services/graphql/interfaces/graphql_args_i.dart';
import 'package:responsibility_matrix_flutter/services/graphql/interfaces/graphql_mutation_i.dart';

class DeleteQuestionnaire extends MutatorCreatorI {
  const DeleteQuestionnaire() : super(mutation: r'''
  mutation deleteQuestionnaire($id: ID!) {
    deleteQuestionnaires(
      where: { id: $id }
      delete: { ClosedQuestions: { where: {} } }
    ) {
      nodesDeleted
    }
  }


''', mutationName: 'DeleteQuestionnaire');

  @override
  MutationOptions<Object?> createMutationOptions({GraphQlArgsI? args}) {
    return MutationOptions(
      document: gql(mutation),
      variables: args?.createQueryArgs() ?? const {},
    );
  }
}

class DeleteQuestionnaireArgs extends GraphQlArgsI {
  final String id;

  const DeleteQuestionnaireArgs({
    required this.id,
  }) : super(queryName: 'DeleteQuestionnaire');

  @override
  Map<String, dynamic> createQueryArgs() {
    return {
      'id': id,
    };
  }
}
