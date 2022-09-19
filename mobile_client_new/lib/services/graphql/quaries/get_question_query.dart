/*
# Question Schema

type Question

{
    id: ID!
    component: String!
    scope: String!
    question: String!
    position: Int!
    exampleAnswer: String 
}
*/

import 'package:graphql/client.dart';
import 'package:mobile_client_new/services/graphql/interfaces/graphql_args_i.dart';
import 'package:mobile_client_new/services/graphql/interfaces/graphql_query_i.dart';

class GetQuestionQuery extends QueryCreatorI {
  const GetQuestionQuery() : super(query: r'''
  query GetQuestionsQuery{
    questions{
      id
      component
      scope
      question
      position
      exampleAnswer
    }
  }
''', queryName: 'GetQuestionsQuery');

  @override
  QueryOptions createQueryOptions({GraphQlArgsI? args}) {
    return QueryOptions(
      document: gql(query),
    );
  }
}
