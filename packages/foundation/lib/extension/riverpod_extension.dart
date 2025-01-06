import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension RefExtension on Ref {
  CancelToken cancelToken() {
    final token = CancelToken();
    onDispose(token.cancel);
    return token;
  }
}
