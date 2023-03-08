/*
# Question Schema

type Questionnaire {
    User: User! @relationship(type: "has_questionnaire", direction: IN)
    id: ID @id
    title: String!
    description: String!
    createdAt: DateTime! @timestamp(operations: [CREATE])
    ClosedQuestions: [Answer!]! @relationship(type: "has_answered", direction: OUT)
    ClosedQuestionsIndex: [Int]
}
*/

import 'package:graphql/client.dart';
import 'package:responsibility_matrix_flutter/services/graphql/interfaces/graphql_args_i.dart';
import 'package:responsibility_matrix_flutter/services/graphql/interfaces/graphql_query_i.dart';

class GetQuestionnarieQuery extends QueryCreatorI {
  const GetQuestionnarieQuery() : super(query: r'''
  query getQuestionairee($id: ID!) {
    questionnaires(where: { id: $id }) {
      id
      title
      description
      ClosedQuestionsIndex
      ClosedQuestions {
        id
        component
        scope
        answer
        status
        position
      }
    }
  }
''', queryName: 'GetQuestionnarieQuery');

  @override
  QueryOptions createQueryOptions({GraphQlArgsI? args}) {
    return QueryOptions(
        document: gql(query),
        variables: args?.createQueryArgs() ?? const {},
        fetchPolicy: FetchPolicy.networkOnly);
  }
}

class GetQuestionnarieQueryArgs extends GraphQlArgsI {
  const GetQuestionnarieQueryArgs({required this.id})
      : super(queryName: 'GetQuestionnarieQuery');

  final String id;

  @override
  Map<String, dynamic> createQueryArgs() {
    return <String, dynamic>{
      'id': id,
    };
  }
}
