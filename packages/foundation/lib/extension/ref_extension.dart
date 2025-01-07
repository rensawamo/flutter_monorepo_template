import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension RefExtension on Ref {
  CancelToken dioCancelToken() {
    final cancelToken = CancelToken();
    onDispose(() {
      if (!cancelToken.isCancelled) {
        cancelToken.cancel('Request was cancelled due to dispose.');
      }
    });
    return cancelToken;
  }
}
