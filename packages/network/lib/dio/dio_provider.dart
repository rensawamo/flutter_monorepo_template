import 'package:core_network/interceptor/retry_intercepter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'dio_provider.g.dart';

@riverpod
Future<Dio> dio(
  Ref ref, {
  bool isRequireAuthenticate = true,
  bool roDisableRetry = false,
  Duration connectTimeout = const Duration(seconds: 7),
  Duration receiveTimeout = const Duration(seconds: 7),
  Duration sendTimeout = const Duration(seconds: 7),
}) async {
  // Example logger
  final talker = Talker();
  // if you need
  // final token = await ref.read(tokenNotifierProvider.future);

  final dio = Dio(
    BaseOptions(
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      extra: <String, dynamic>{
        'ro_disable_retry': roDisableRetry,
      },
      headers: <String, dynamic>{
        'Content-Type': 'application/json',
        // if (isRequireAuthenticate)
        // AppEndpoint.headerAuthorization: 'Bearer ${token.accessToken}',
      },
    ),
  );

  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printRequestHeaders: true,
        printResponseHeaders: true,
      ),
    ),
  );

  final retryInterceptor = RetryInterceptor(
    dio: dio,
    retries: 5,
  );
  dio.interceptors.add(retryInterceptor);

  return dio;
}
