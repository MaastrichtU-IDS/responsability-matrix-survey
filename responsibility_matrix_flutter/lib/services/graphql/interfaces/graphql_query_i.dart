import 'package:graphql/client.dart';

import 'graphql_args_i.dart';


/// Abstract class for creating GraphQL queries.
/// Implement [createQueryOptions] method to create GraphQL query options.
/// Also, create a class that implements [GraphQlArgsI] to pass arguments to the query.
abstract class QueryCreatorI<T extends GraphQlArgsI> {
  final String query;
  final String queryName;

  const QueryCreatorI({required this.queryName, required this.query});

  QueryOptions createQueryOptions({GraphQlArgsI? args});

  void checkArgsType(GraphQlArgsI args) {
    if (args.queryName != queryName) {
      throw Exception('Args must be of type $queryName');
    }
  }
}
