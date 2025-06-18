import 'dart:async';
import 'dart:io';

import 'package:core_network/interceptor/default_retry_evaluator.dart';
import 'package:core_network/interceptor/retry_status.dart';
import 'package:core_utility/utility.dart';
import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  RetryInterceptor({
    required this.dio,
    required this.retries,
    this.retryDelays = const [
      // Max 5 retries
      Duration(milliseconds: 100 * 1 * 1),
      Duration(milliseconds: 100 * 2 * 2),
      Duration(milliseconds: 100 * 3 * 3),
      Duration(milliseconds: 100 * 4 * 4),
      Duration(milliseconds: 100 * 5 * 5),
    ],
    RetryEvaluator? retryEvaluator,
    this.ignoreRetryEvaluatorExceptions = false,
    this.retryableExtraStatuses = const {},
  }) : _retryEvaluator = retryEvaluator ??
            DefaultRetryEvaluator({
              ...defaultRetryableStatuses,
              ...retryableExtraStatuses,
            }).evaluate {
    if (retryEvaluator != null && retryableExtraStatuses.isNotEmpty) {
      throw ArgumentError(
        '[retryableExtraStatuses] can only be used if [retryEvaluator]'
            ' is not provided. '
            'Please set either [retryableExtraStatuses] or [retryEvaluator],'
            ' but not both.',
        'retryableExtraStatuses',
      );
    }

    if (retries < 0) {
      throw ArgumentError(
        '[retries] must be greater than or equal to 0.',
        'retries',
      );
    }
  }

  final Dio dio;
  final bool ignoreRetryEvaluatorExceptions;
  final List<Duration> retryDelays;
  final RetryEvaluator _retryEvaluator;
  final Set<int> retryableExtraStatuses;
  final int retries;

  static final FutureOr<bool> Function(DioException error, int attempt)
      defaultRetryEvaluator =
      DefaultRetryEvaluator(defaultRetryableStatuses).evaluate;

  Future<bool> _shouldRetry(DioException error, int attempt) async {
    try {
      return await _retryEvaluator(error, attempt);
    } catch (e) {
      logger.e('Exception in _retryEvaluator: $e');
      if (!ignoreRetryEvaluatorExceptions) {
        rethrow;
      }
    }
    return true;
  }

  Future<void> _authRetry(
    DioException err,
    ErrorInterceptorHandler handler,
    RequestOptions options,
  ) async {
    try {
      // update token logic
      final response = await dio.fetch<void>(err.requestOptions);
      handler.resolve(response);
    } on Exception catch (e) {
      logger.e(
        '[${err.requestOptions.path}]'
        ' Exception during token operation. Error: $e',
      );
      super.onError(err, handler);
    }
  }

  @override
  Future<dynamic> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.requestOptions.disableRetry) {
      return super.onError(err, handler);
    }
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      logger.w(
        '[${err.requestOptions.path}] Unauthorized error',
      );
      try {
        final authErrorOccurred = err.requestOptions._authErrorOccurred;
        if (authErrorOccurred) {
          logger.e(
            '[${err.requestOptions.path}]'
            'Already attempted token refresh, stopping retries.',
          );
          return super.onError(err, handler);
        } else {
          err.requestOptions._authErrorOccurred = true;
          return _authRetry(err, handler, err.requestOptions);
        }
      } on Exception catch (e) {
        logger.e(
          '[${err.requestOptions.path}] '
          'Exception during token operation. Error: $e',
        );
        err.requestOptions._authErrorOccurred = true;
        return super.onError(err, handler);
      }
    }
    final attempt = err.requestOptions._attempt + 1;
    err.requestOptions._attempt = attempt;
    logger.i(
      '[${err.requestOptions.path}] Attempt $attempt: Retrying '
      'request after error.',
    );

    final shouldRetry = attempt <= retries && await _shouldRetry(err, attempt);
    logger.i('shouldRetry: $shouldRetry');

    if (!shouldRetry) {
      return super.onError(err, handler);
    }

    final delay = getDelay(attempt);
    logger.w(
      '[${err.requestOptions.path}] Error during request, retrying... '
      '(Attempt: $attempt/$retries, '
      'Wait: ${delay.inMilliseconds} ms, Error: ${err.error ?? err})',
    );

    var requestOptions = err.requestOptions;
    if (requestOptions.data is FormData) {
      requestOptions = recreateOptions(err.requestOptions);
    }

    if (delay != Duration.zero) {
      await Future<void>.delayed(delay);
    }

    bool isRequestCancelled() =>
        err.requestOptions.cancelToken?.isCancelled ?? false;
    if (isRequestCancelled()) {
      logger.i(
        '[${err.requestOptions.path}] Request was cancelled, stopping retries.',
      );
      return super.onError(err, handler);
    }
    try {
      await dio
          .fetch<void>(requestOptions)
          .then((value) => handler.resolve(value));
    } on DioException catch (e) {
      super.onError(e, handler);
    }
  }

  Duration getDelay(int attempt) {
    if (retryDelays.isEmpty) return Duration.zero;
    return attempt - 1 < retryDelays.length
        ? retryDelays[attempt - 1]
        : retryDelays.last;
  }

  RequestOptions recreateOptions(RequestOptions options) {
    if (options.data is! FormData) {
      throw ArgumentError(
        'requestOptions.data is not FormData',
        'requestOptions',
      );
    }
    final formData = options.data as FormData;
    final newFormData = formData.clone();
    return options.copyWith(data: newFormData);
  }
}

const _kDisableRetryKey = 'ro_disable_retry';

extension RequestOptionsX on RequestOptions {
  static const _kAttemptKey = 'ro_attempt';

  static const _kauthErrorOccurredKey = 'ro_is_token_refreshed';

  bool get disableRetry => (extra[_kDisableRetryKey] as bool?) ?? false;
  set disableRetry(bool value) => extra[_kDisableRetryKey] = value;

  bool get isTokenRefresh => _authErrorOccurred;
  bool get _authErrorOccurred =>
      (extra[_kauthErrorOccurredKey] as bool?) ?? false;
  set _authErrorOccurred(bool value) => extra[_kauthErrorOccurredKey] = value;

  int get attempt => _attempt;
  int get _attempt => (extra[_kAttemptKey] as int?) ?? 0;
  set _attempt(int value) => extra[_kAttemptKey] = value;
}

extension OptionsX on Options {
  bool get disableRetry => (extra?[_kDisableRetryKey] as bool?) ?? false;

  set disableRetry(bool value) {
    extra = Map.of(extra ??= <String, dynamic>{});
    extra![_kDisableRetryKey] = value;
  }
}
