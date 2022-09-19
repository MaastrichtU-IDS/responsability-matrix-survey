import 'graphql_args_i.dart';
import 'package:graphql/client.dart';

/// Abstract class for creating GraphQL queries.
/// Implement [createQueryOptions] method to create GraphQL query options.
/// Also, create a class that implements [GraphQlArgsI] to pass arguments to the query.
abstract class MutatorCreatorI {
  final String mutation;
  final String mutationName;

  const MutatorCreatorI({required this.mutationName, required this.mutation});

  MutationOptions createMutationOptions({GraphQlArgsI? args});

  void checkArgsType(GraphQlArgsI args) {
    if (args.queryName != mutationName) {
      throw Exception("Args must be of type $mutationName");
    }
  }
}

