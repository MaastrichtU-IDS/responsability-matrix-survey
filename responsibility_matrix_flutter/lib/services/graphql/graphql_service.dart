import 'dart:async';

import 'package:responsibility_matrix_flutter/services/error_bucket/error_bucket.dart';
import 'package:responsibility_matrix_flutter/services/graphql/models/graphql_service_error_model.dart';
import 'package:responsibility_matrix_flutter/services/graphql/models/graphql_service_response_model.dart';

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
    ErrorBucket().registerErrorType<GraphQLService, GraphQLServiceErrorModel>();
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

  Future<GraphQLServiceResponseModel> query(
      QueryCreatorI queryCreator, GraphQlArgsI? args) async {
    checkInitialized();

    logger.i('GraphQL query: ${queryCreator.query}');

    final query = queryCreator.createQueryOptions(args: args);

    final response = await _client.query(query);

    if (response.hasException) {
      return onException(response.exception!, queryCreator.query);
    }

    logger.i('GraphQL response: ${response.data}');

    return GraphQLServiceResponseModel.data(response.data);
  }

  Future<GraphQLServiceResponseModel> mutate(
      MutatorCreatorI mutationCreator, GraphQlArgsI? args) async {
    checkInitialized();

    logger.i('GraphQL mutation: ${mutationCreator.mutation}');

    final query = mutationCreator.createMutationOptions(args: args);

    final response = await _client.mutate(query);

    if (response.hasException) {
      return onException(response.exception!, mutationCreator.mutation);
    }

    logger.i('GraphQL response: ${response.data}');

    return GraphQLServiceResponseModel.data(response.data);
  }

  GraphQLServiceResponseModel onException(
      Exception exception, String fromQuery) {
    logger.e('GraphQL error: $exception');
    final GraphQLServiceErrorType type =
        exception.toString().contains('Unauthorized')
            ? GraphQLServiceErrorType.unauthorized
            : GraphQLServiceErrorType.general;
    final error = GraphQLServiceErrorModel(
        fromQuery: fromQuery, message: exception.toString(), type: type);
    ErrorBucket().addError<GraphQLServiceErrorModel>(error);
    return GraphQLServiceResponseModel.error(
      GraphQLServiceErrorModel(
          fromQuery: fromQuery, message: exception.toString(), type: type),
    );
  }

  void checkInitialized() async {
    if (!_isInitialized) {
      await init();
    }
  }
}
