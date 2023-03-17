import 'package:responsibility_matrix_flutter/repositories/models/repository_error_model.dart';

class RepositoryResponseModel<T> {
  final T? data;
  final RepositoryErrorModel? error;

  RepositoryResponseModel.error(this.error) : data = null;
  RepositoryResponseModel.data(this.data) : error = null;
  RepositoryResponseModel.empty()
      : data = null,
        error = null;

  bool get hasError => error != null;
  bool get hasData => data != null;
}
