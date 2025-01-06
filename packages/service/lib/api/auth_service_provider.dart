import 'package:core_repository/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service_provider.g.dart';

@riverpod
AuthService authService(Ref ref) {
  final tokenRepository = ref.watch(tokenRepositoryProvider.notifier);
  return AuthService(tokenRepository);
}

class AuthService {
  AuthService(this.tokenRepository);

  final TokenRepository tokenRepository;

  Future<String> getAccessToken() async {
    final token = await tokenRepository.loadToken();
    if (token.isEmpty || _isTokenExpired(token)) {
      return refreshToken();
    }
    return token;
  }

  /// Refresh token
  Future<String> refreshToken() async {
    const newToken = 'new_dummy_access_token';
    await tokenRepository.saveToken(newToken);
    return newToken;
  }

  /// トークンの有効期限を検証
  bool _isTokenExpired(String token) {
    // JWT の有効期限をチェックするロジックを追加
    // 必要ならトークンを解析して、有効期限の過去判定を行う
    return false;
  }
}
