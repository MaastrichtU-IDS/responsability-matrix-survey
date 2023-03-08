/*

# User Schema

type User {
    email: String!
    username: String!
    registered_at: Date!
    role: String!
    Questionnaire: [Questionnaire!]! @relationship(type: "has_questionnaire", direction: OUT)
}

*/

import 'package:graphql/client.dart';
import 'package:responsibility_matrix_flutter/services/graphql/interfaces/graphql_args_i.dart';
import 'package:responsibility_matrix_flutter/services/graphql/interfaces/graphql_mutation_i.dart';

class CreateUserMutation extends MutatorCreatorI {
  const CreateUserMutation() : super(mutation: r'''
  mutation CreateUserMutation(
    $uuid: String!
    $email: String!
    $username: String!
  ) {
    createUsers(
      input: {
        uuid: $uuid
        email: $email
        username: $username
      }
    ) {
      info{
        nodesCreated
      }
    }
  }
''', mutationName: 'CreateUserMutation');

  @override
  MutationOptions<Object?> createMutationOptions({GraphQlArgsI? args}) {
    return MutationOptions(
      document: gql(mutation),
      variables: args?.createQueryArgs() ?? const {},
    );
  }
}

class CreateUserMutationArgs extends GraphQlArgsI {
  const CreateUserMutationArgs({
    required this.uuid,
    required this.email,
    required this.username,
  }) : super(queryName: 'CreateUserMutation');

  final String uuid;
  final String email;
  final String username;

  @override
  Map<String, dynamic> createQueryArgs() {
    return {
      'uuid': uuid,
      'email': email,
      'username': username,
    };
  }
}
