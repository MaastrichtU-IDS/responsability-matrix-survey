import 'package:responsibility_matrix_flutter/services/graphql/models/graphql_service_error_model.dart';

class GraphQLServiceResponseModel {
  final Map<String, dynamic>? data;
  final GraphQLServiceErrorModel? error;

  GraphQLServiceResponseModel.error(this.error) : data = null;
  GraphQLServiceResponseModel.data(this.data) : error = null;

  bool get hasError => error != null;
  bool get hasData => data != null;
}
