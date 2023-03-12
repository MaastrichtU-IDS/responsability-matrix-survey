import 'dart:async';

import 'interfaces/graphql_args_i.dart';
import '../../utils/instance_controller/instance_controller.dart';
import 'package:graphql/client.dart';
import 'package:logger/logger.dart';

import 'interfaces/graphql_query_i.dart';
import 'interfaces/graphql_mutation_i.dart';

/// GraphQL Service for fetching data from GraphQL server.
/// Create QueryClasses that implement [QueryCreatorI] and its arguments that implements [GraphQlArgsI].
/// To fetch data from GraphQL server, use [query] method with a class that implements [QueryCreatorI].
/// To mutate data on GraphQL server, use [mutate] method with a class that implements [MutationCreatorI].
class GraphQLService {
  GraphQLService({
    required this.tokenProvider,
    required String baseUrl,
  }) : _baseUrl = baseUrl;

  final String _baseUrl;
  final FutureOr<String?> Function() tokenProvider;

  late GraphQLClient _client;
  bool _isInitialized = false;

  final Logger logger = InstanceController().getByType<Logger>();

  Future<void> init() async {
    // _cache = await HiveStore.open(boxName: 'cache_graphql');

    final http = HttpLink(_baseUrl);
    final auth = AuthLink(
      getToken: tokenProvider,
    );
    final link = auth.concat(http);
    _client = GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: link,
    );
    logger.i('GraphQL client initialized');
    // Last code!!!
    _isInitialized = true;
  }

  Future<QueryResult> query(
      QueryCreatorI queryCreator, GraphQlArgsI? args) async {
    checkInitialized();

    logger.i('GraphQL query: ${queryCreator.query}');

    final query = queryCreator.createQueryOptions(args: args);

    final response = await _client.query(query);

    if (response.hasException) {
      logger.e('GraphQL error: ${response.exception}');
      throw response.exception ?? Exception('Unknown error');
    }

    logger.i('GraphQL response: ${response.data}');

    return response;
  }

  Future<QueryResult> mutate(
      MutatorCreatorI mutationCreator, GraphQlArgsI? args) async {
    checkInitialized();

    logger.i('GraphQL mutation: ${mutationCreator.mutation}');

    final query = mutationCreator.createMutationOptions(args: args);

    final response = await _client.mutate(query);

    if (response.hasException) {
      logger.e('GraphQL error: ${response.exception}');
      throw response.exception ?? Exception('Unknown error');
    }

    logger.i('GraphQL response: ${response.data}');
    return response;
  }

  void checkInitialized() async {
    if (!_isInitialized) {
      await init();
    }
  }
}
