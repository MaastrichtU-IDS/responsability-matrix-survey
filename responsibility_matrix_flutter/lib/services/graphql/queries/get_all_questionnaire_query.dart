/*
# Question Schema

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
import 'package:responsibility_matrix_flutter/services/graphql/interfaces/graphql_query_i.dart';

class GetAllQuestionnaireQuery extends QueryCreatorI {
  const GetAllQuestionnaireQuery() : super(query: r'''
  query getAllQuestionnaires($uuid: String!) {
    questionnaires(where: { User: { uuid: $uuid } }) {
      id
      title
      description
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

''', queryName: 'GetAllQuestionnaireQuery');

  @override
  QueryOptions createQueryOptions({GraphQlArgsI? args}) {
    return QueryOptions(
      document: gql(query),
      fetchPolicy: FetchPolicy.networkOnly,
      variables: args?.createQueryArgs() ?? const {},
    );
  }
}

class GetAllQuestionnaireQueryArgs extends GraphQlArgsI {
  const GetAllQuestionnaireQueryArgs({required this.uuid})
      : super(queryName: 'GetAllQuestionnaireQuery');

  final String uuid;

  @override
  Map<String, dynamic> createQueryArgs() {
    return <String, dynamic>{
      'uuid': uuid,
    };
  }
}
