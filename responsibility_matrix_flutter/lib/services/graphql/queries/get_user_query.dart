/*

# Questionnaire Schema

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
import 'package:responsibility_matrix_flutter/services/graphql/interfaces/graphql_query_i.dart';

class GetUserQuery extends QueryCreatorI {
  const GetUserQuery() : super(query: r'''
  query GetUserQuery($uuid: String!) {
    users(where: { uuid: $uuid }) {
      uuid
      username
      role
    }
  }

''', queryName: 'GetUserQuery');

  @override
  QueryOptions createQueryOptions({GraphQlArgsI? args}) {
    return QueryOptions(
      document: gql(query),
      variables: args?.createQueryArgs() ?? const {},
      fetchPolicy: FetchPolicy.networkOnly,
    );
  }
}

class GetUserQueryArgs extends GraphQlArgsI {
  const GetUserQueryArgs({required this.uuid})
      : super(queryName: 'GetUserQuery');

  final String uuid;

  @override
  Map<String, dynamic> createQueryArgs() {
    return {
      'uuid': uuid,
    };
  }
}
