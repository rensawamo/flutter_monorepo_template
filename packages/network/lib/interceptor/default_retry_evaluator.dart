import 'dart:async';

import 'package:dio/dio.dart';

typedef RetryEvaluator = FutureOr<bool> Function(
  DioException error,
  int attempt,
);

class DefaultRetryEvaluator {
  DefaultRetryEvaluator(this._retryStatuses);

  final Set<int> _retryStatuses;
  int currentAttempt = 0;

  FutureOr<bool> evaluate(DioException error, int attempt) {
    bool shouldRetry;
    if (error.type == DioExceptionType.badResponse) {
      final statusCode = error.response?.statusCode;
      if (statusCode != null) {
        shouldRetry = isRetryable(statusCode);
      } else {
        shouldRetry = true;
      }
    } else {
      shouldRetry = error.type != DioExceptionType.cancel &&
          error.type != DioExceptionType.connectionError &&
          error.error is! FormatException;
    }
    currentAttempt = attempt;
    return shouldRetry;
  }

  bool isRetryable(int statusCode) => _retryStatuses.contains(statusCode);
}
