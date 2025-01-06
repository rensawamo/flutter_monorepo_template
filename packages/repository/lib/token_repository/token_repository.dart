import 'package:core_di_provider/di_provider.dart';
import 'package:core_foundation/foundation.dart';
import 'package:core_repository/token_repository/model/token.dart';
import 'package:core_utility/utility.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token_repository.g.dart';

@riverpod
class TokenRepository extends _$TokenRepository {
  late final FlutterSecureStorage _secureStorage;
  final _key = AppSecureStorageKey.appTokenRepositoryKey;

  @override
  Future<Token> build() async {
    _secureStorage = ref.read(secureStorageProvider);
    final token = await loadToken();
    return Token(accessToken: token);
  }

  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: _key.name, value: token);
    logger.d('token_repository saved');
    state = AsyncData(Token(accessToken: token));
  }

  Future<String> loadToken() async {
    final token = await _secureStorage.read(key: _key.name);
    logger.d('token_repository loaded');
    state = AsyncData(Token(accessToken: token ?? ''));

    return token ?? '';
  }

  Future<void> deleteToken() async {
    await _secureStorage.delete(key: _key.name);
    logger.d('token_repository deleted');
    state = const AsyncData(Token());
  }
}
