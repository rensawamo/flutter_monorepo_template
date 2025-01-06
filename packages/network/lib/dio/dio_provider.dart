import 'package:core_foundation/foundation.dart';
import 'package:core_network/interceptor/retry_intercepter.dart';
import 'package:core_repository/repository.dart';
import 'package:core_service/service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'dio_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Dio> dio(
  Ref ref, {
  bool isRequireAuthenticate = true,
  bool roDisableRetry = false,
  Duration connectTimeout = const Duration(seconds: 7),
  Duration receiveTimeout = const Duration(seconds: 7),
  Duration sendTimeout = const Duration(seconds: 7),
}) async {
  final talker = Talker();
  final token = await ref.read(tokenRepositoryProvider.future);

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
        if (isRequireAuthenticate)
          AppEndpoint.headerAuthorization: 'Bearer ${token.accessToken}',
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
    authService: ref.read(authServiceProvider),
  );
  dio.interceptors.add(retryInterceptor);

  return dio;
}
