import 'dart:async';

import 'package:logger/logger.dart';
import 'package:responsibility_matrix_flutter/services/error_bucket/error_bucket_item.dart';
import 'package:responsibility_matrix_flutter/utils/instance_controller/instance_controller.dart';

class ErrorBucket {
  ErrorBucket._();

  static final ErrorBucket _instance = ErrorBucket._();

  factory ErrorBucket() => _instance;

  ErrorBucket get instance => _instance;

  bool logErrors = true;

  /// Keeps track of which objects throws which error models
  final Map<Type, Type> _errorTypes = {};
  final Map<Type, Type> _reverseErrorTypes = {};

  final StreamController<ErrorBucketItem> _errorBucketStreamController =
      StreamController<ErrorBucketItem>.broadcast();

  /// Individual streams for each error type
  final Map<Type, StreamController<ErrorBucketItem>>
      _errorBucketStreamControllers = {};

  /// Register an error type for a specific object.
  /// Each object can only have one error type registered.
  /// If you try to register a new error type for an object that already has one,
  /// the new error type will be ignored.
  /// [F] = From
  /// [E] = Error
  void registerErrorType<F, E>() {
    if (!_errorTypes.containsKey(F)) {
      _errorTypes[F] = E;
      _reverseErrorTypes[E] = F;
      _errorBucketStreamControllers[F] =
          StreamController<ErrorBucketItem<E>>.broadcast();

      InstanceController().getByType<Logger>().i(
          'ErrorBucket: Registered error type ${E.toString()} for ${F.toString()}');
    }
  }

  /// Add an error to the error bucket.
  void addError<E>(E error) {
    if (_reverseErrorTypes.containsKey(E)) {
      if (logErrors) {
        InstanceController().getByType<Logger>().e(error.toString());
      }
      final F = _reverseErrorTypes[E]!;
      final errorBucketItem = ErrorBucketItem<E>(from: F, error: error);
      _errorBucketStreamControllers[F] ??=
          StreamController<ErrorBucketItem>.broadcast();
      _errorBucketStreamControllers[F]!.add(errorBucketItem);

      _errorBucketStreamController.add(errorBucketItem);
    }
  }

  Stream<ErrorBucketItem> get allErrors => _errorBucketStreamController.stream;
  Stream<ErrorBucketItem<T>> getErrorsFor<F, T>() {
    if (!_errorTypes.containsKey(F)) {
      InstanceController()
          .getByType<Logger>()
          .i('ErrorBucket: No error type registered for ${F.toString()}');

      registerErrorType<F, T>();
    }

    final StreamController<ErrorBucketItem<T>> streamController =
        _errorBucketStreamControllers[F]
            as StreamController<ErrorBucketItem<T>>;

    return streamController.stream;
  }

  void dispose() {
    _errorBucketStreamController.close();
    _errorBucketStreamControllers.values.forEach((element) {
      element.close();
    });
  }
}
