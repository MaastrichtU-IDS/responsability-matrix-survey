/*
# Question Schema

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
import 'package:responsibility_matrix_flutter/services/graphql/interfaces/graphql_query_i.dart';

class GetAllQuestionnarieQuery extends QueryCreatorI {
  const GetAllQuestionnarieQuery() : super(query: r'''
  query getAllQuestionaires($uuid: String!) {
    questionnaires(where: { User: { uuid: $uuid } }) {
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

''', queryName: 'GetAllQuestionnarieQuery');

  @override
  QueryOptions createQueryOptions({GraphQlArgsI? args}) {
    return QueryOptions(
      document: gql(query),
      fetchPolicy: FetchPolicy.networkOnly,
      variables: args?.createQueryArgs() ?? const {},
    );
  }
}

class GetAllQuestionnarieQueryArgs extends GraphQlArgsI {
  const GetAllQuestionnarieQueryArgs({required this.uuid})
      : super(queryName: 'GetAllQuestionnarieQuery');

  final String uuid;

  @override
  Map<String, dynamic> createQueryArgs() {
    return <String, dynamic>{
      'uuid': uuid,
    };
  }
}
