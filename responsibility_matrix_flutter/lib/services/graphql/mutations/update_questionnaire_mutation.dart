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

class UpdateQuestionnaire extends MutatorCreatorI {
  const UpdateQuestionnaire() : super(mutation: r'''
  mutation updateQuestionnaire($id: ID!, $title: String, $description: String) {
    updateQuestionnaires(
      where: { id: $id }
      update: { title: $title, description: $description }
    ) {
      questionnaires {
        title
        description
      }
    }
  }
''', mutationName: 'UpdateQuestionnaire');

  @override
  MutationOptions<Object?> createMutationOptions({GraphQlArgsI? args}) {
    return MutationOptions(
      document: gql(mutation),
      variables: args?.createQueryArgs() ?? const {},
    );
  }
}

class UpdateQuestionnaireArgs extends GraphQlArgsI {
  final String? title;
  final String? description;
  final String id;
  const UpdateQuestionnaireArgs({
    required this.id,
    required this.title,
    required this.description,
  }) : super(queryName: 'UpdateQuestionnaire');

  @override
  Map<String, dynamic> createQueryArgs() {
    return {
      'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
    };
  }
}
