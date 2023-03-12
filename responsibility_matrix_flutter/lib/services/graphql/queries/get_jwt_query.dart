import 'package:graphql/client.dart';

import '../interfaces/graphql_args_i.dart';
import '../interfaces/graphql_query_i.dart';

class GetJWTQuery extends QueryCreatorI {
  const GetJWTQuery() : super(query: r'''
  query getJWT($code: String!){
    getJWT(code: $code)
  }

''', queryName: 'GetJWTQuery');

  @override
  QueryOptions createQueryOptions({GraphQlArgsI? args}) {
    return QueryOptions(
      document: gql(query),
      fetchPolicy: FetchPolicy.networkOnly,
      variables: args?.createQueryArgs() ?? const {},
    );
  }
}

class GetJWTQueryArgs extends GraphQlArgsI {
  const GetJWTQueryArgs({required this.code}) : super(queryName: 'GetJWTQuery');

  final String code;

  @override
  Map<String, dynamic> createQueryArgs() {
    return <String, dynamic>{
      'code': code,
    };
  }
}
