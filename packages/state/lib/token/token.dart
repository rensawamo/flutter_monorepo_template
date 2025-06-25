import 'package:core_di_provider/di_provider.dart';
import 'package:core_foundation/foundation.dart';
import 'package:core_state/token/model/token.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token.g.dart';

@Riverpod(keepAlive: true)
class TokenNotifier extends _$TokenNotifier {
  late final FlutterSecureStorage _secureStorage;
  final AppSecureStorageKey _accessKey = AppSecureStorageKey.accessToken;
  final AppSecureStorageKey _refreshKey = AppSecureStorageKey.refreshToken;
  final AppSecureStorageKey _deviceKey = AppSecureStorageKey.deviceToken;

  @override
  Token build() {
    _secureStorage = ref.read(secureStorageProvider);

    return const Token();
  }

  Future<void> initState() async {
    final accessToken = await _secureStorage.read(key: _accessKey.name) ?? '';
    final refreshToken = await _secureStorage.read(key: _refreshKey.name) ?? '';
    final deviceToken = await _secureStorage.read(key: _deviceKey.name) ?? '';

    state = Token(
      accessToken: accessToken,
      refreshToken: refreshToken,
      deviceToken: deviceToken,
    );
  }

  Future<void> saveAccessToken(String token) async {
    await _secureStorage.write(key: _accessKey.name, value: token);

    state = state.copyWith(
      accessToken: token,
    );
  }

  Future<void> saveRefleshToken(String token) async {
    await _secureStorage.write(key: _refreshKey.name, value: token);
    state = state.copyWith(
      refreshToken: token,
    );
  }

  Future<void> saveDeviceToken(String token) async {
    await _secureStorage.write(key: _deviceKey.name, value: token);

    state = state.copyWith(
      deviceToken: token,
    );
  }
}
