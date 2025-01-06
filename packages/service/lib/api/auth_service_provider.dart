import 'package:core_state/token/token.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service_provider.g.dart';

/// unimplemented
/// If you need it, implement it.

@riverpod
AuthService authService(Ref ref) {
  final tokenNotifier = ref.watch(tokenNotifierProvider.notifier);
  return AuthService(tokenNotifier);
}

class AuthService {
  AuthService(this.tokenNotifier);

  final TokenNotifier tokenNotifier;

  Future<String> fetchValidAccessToken() async {
    final token = await tokenNotifier.loadAccessToken();
    if (token.isEmpty || _isTokenExpired(token)) {
      return refreshToken();
    }
    return token;
  }

  Future<String> refreshToken() async {
    const newToken = 'new_dummy_access_token';
    await tokenNotifier.saveAccessToken(newToken);
    return newToken;
  }

  bool _isTokenExpired(String token) {
    return false;
  }
}
