import 'package:core_di_provider/di_provider.dart';
import 'package:core_foundation/foundation.dart';
import 'package:core_state/token/model/token.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token.g.dart';

@Riverpod(keepAlive: true)
class TokenNotifier extends _$TokenNotifier {
  late final FlutterSecureStorage _secureStorage;
  final _accessKey = AppSecureStorageKey.accessToken;
  final _refreshKey = AppSecureStorageKey.refreshToken;
  final _deviceKey = AppSecureStorageKey.deviceToken;

  @override
  Future<Token> build() async {
    _secureStorage = ref.read(secureStorageProvider);
    final accessToken = await loadAccessToken();
    final refreshToken = await loadRefleshToken();
    final deviceToken = await loadDeviceToken();
    return Token(
      accessToken: accessToken,
      refreshToken: refreshToken,
      deviceToken: deviceToken,
    );
  }

  Future<void> saveAccessToken(String token) async {
    await _secureStorage.write(key: _accessKey.name, value: token);

    final currentData = state.valueOrNull;
    state = AsyncData(
      Token(
        accessToken: token,
        refreshToken: currentData?.refreshToken ?? '',
        deviceToken: currentData?.deviceToken ?? '',
      ),
    );
  }

  Future<void> saveRefleshToken(String token) async {
    await _secureStorage.write(key: _refreshKey.name, value: token);
    final currentData = state.valueOrNull;
    state = AsyncData(
      Token(
        accessToken: currentData?.accessToken ?? '',
        refreshToken: token,
        deviceToken: currentData?.deviceToken ?? '',
      ),
    );
  }

  Future<void> saveDeviceToken(String token) async {
    await _secureStorage.write(key: _deviceKey.name, value: token);
    final currentData = state.valueOrNull;
    state = AsyncData(
      Token(
        accessToken: currentData?.accessToken ?? '',
        refreshToken: currentData?.refreshToken ?? '',
        deviceToken: token,
      ),
    );
  }

  Future<String> loadAccessToken() async {
    final token = await _secureStorage.read(key: _accessKey.name);
    return token ?? 'test access token';
  }

  Future<String> loadRefleshToken() async {
    final token = await _secureStorage.read(key: _refreshKey.name);
    return token ?? 'test refresh token';
  }

  Future<String> loadDeviceToken() async {
    final token = await _secureStorage.read(key: _deviceKey.name);
    return token ?? 'test device token';
  }
}
