import 'package:logger/logger.dart';
import 'package:responsibility_matrix_flutter/repositories/models/repository_error_model.dart';
import 'package:responsibility_matrix_flutter/services/error_bucket/error_bucket.dart';
import 'package:responsibility_matrix_flutter/utils/instance_controller/instance_controller.dart';

abstract class IRepository {
  static bool registered = false;

  IRepository() {
    if (!registered) {
      registerErrorTypes();
      registered = true;
    }
  }

  final Logger _logger = InstanceController().getByType<Logger>();

  void registerErrorTypes() {
    ErrorBucket().registerErrorType<IRepository, RepositoryErrorModel>();
  }

  RepositoryErrorModel onError(Type from, String message) {
    final error = RepositoryErrorModel(from, message);
    _logger.e(error);
    ErrorBucket().addError<RepositoryErrorModel>(error);
    return error;
  }
}
