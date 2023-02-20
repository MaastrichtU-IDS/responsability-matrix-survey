import 'dart:async';

import 'interfaces/graphql_args_i.dart';
import '../../utils/instance_controller/instance_controller.dart';
import 'package:graphql/client.dart';
import 'package:logger/logger.dart';

import 'interfaces/graphql_query_i.dart';
import 'interfaces/graphql_mutation_i.dart';

/// GraphQL Service for fetching data from GraphQL server.
/// Create QueryClasses that implement [QueryCreatorI] and its arguments that implements [GraphQlArgsI].
/// To fetch data from GraphQL server, use [query] method wiht a class that implements [QueryCreatorI].
/// To mutate data on GraphQL server, use [mutate] method wiht a class that implements [MutationCreatorI].
class GraphQLService {
  GraphQLService({
    required this.tokenProvider,
    required String baseUrl,
  }) : _baseUrl = baseUrl;

  final String _baseUrl;
  final FutureOr<String?> Function() tokenProvider;

  late GraphQLClient _client;
  late HiveStore _cache;

  bool _isInitialized = false;

  Future<void> init() async {
    _cache = await HiveStore.open(boxName: 'cache_graphql');

    final http = HttpLink(_baseUrl);
    final auth = AuthLink(
      getToken: tokenProvider,
    );
    final link = auth.concat(http);
    _client = GraphQLClient(
      cache: GraphQLCache(store: _cache),
      link: link,
    );
    InstanceController()[Logger].i('GraphQL client initialized');
    // Last code!!!
    _isInitialized = true;
  }

  Future<QueryResult> query(
      QueryCreatorI queryCreator, GraphQlArgsI? args) async {
    checkInitialized();

    final query = queryCreator.createQueryOptions(args: args);

    final response = await _client.query(query);

    if (response.hasException) {
      throw response.exception ?? Exception('Unknown error');
    }

    return response;
  }

  Future<QueryResult> mutate(
      MutatorCreatorI mutationCreator, GraphQlArgsI? args) async {
    checkInitialized();

    final query = mutationCreator.createMutationOptions(args: args);

    final response = await _client.mutate(query);

    if (response.hasException) {
      throw response.exception ?? Exception('Unknown error');
    }

    return response;
  }

  void checkInitialized() {
    if (!_isInitialized) _notInitialized();
  }

  Never _notInitialized() {
    throw Exception('GraphQLService is not initialized');
  }
}
