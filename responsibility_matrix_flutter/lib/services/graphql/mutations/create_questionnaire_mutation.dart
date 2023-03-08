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
import 'package:responsibility_matrix_flutter/services/graphql/interfaces/graphql_args_i.dart';
import 'package:responsibility_matrix_flutter/services/graphql/interfaces/graphql_mutation_i.dart';

class CreateQuestionnarieMutation extends MutatorCreatorI {
  const CreateQuestionnarieMutation() : super(mutation: r'''
  mutation createQuestionaire(
    $uuid: String!
    $title: String!
    $description: String!
  ) {
    createQuestionnaires(
      input: {
        title: $title
        ClosedQuestionsIndex: []
        User: { connect: { where: { node: { uuid: $uuid } } } }
        description: $description
      }
    ) {
      questionnaires {
        id
        title
        description
        ClosedQuestionsIndex
        ClosedQuestions{
          id
          component
          scope
          answer
          position
        }
      }
    }
  }
''', mutationName: 'CreateQuestionnarieMutation');

  @override
  MutationOptions<Object?> createMutationOptions({GraphQlArgsI? args}) {
    return MutationOptions(
      document: gql(mutation),
      variables: args?.createQueryArgs() ?? const {},
    );
  }
}

class CreateQuestionnarieMutationArgs extends GraphQlArgsI {
  const CreateQuestionnarieMutationArgs(
      {required this.uuid, required this.title, required this.description})
      : super(queryName: 'CreateQuestionnarieMutation');

  final String uuid;
  final String title;
  final String description;

  @override
  Map<String, dynamic> createQueryArgs() {
    return {
      'uuid': uuid,
      'title': title,
      'description': description,
    };
  }
}
