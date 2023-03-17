enum GraphQLServiceErrorType {
  unauthorized,
  timeout,
  general,
}

class GraphQLServiceErrorModel {
  final String fromQuery;
  final GraphQLServiceErrorType type;
  final String message;

  GraphQLServiceErrorModel({
    required this.fromQuery,
    required this.type,
    required this.message,
  });

  @override
  String toString() {
    return 'GraphQLServiceErrorModel{fromQuery: $fromQuery, type: $type, message: $message}';
  }
}
