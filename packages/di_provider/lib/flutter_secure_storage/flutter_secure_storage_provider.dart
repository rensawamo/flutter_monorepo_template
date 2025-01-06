import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flutter_secure_storage_provider.g.dart';

AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
      // sharedPreferencesName: '',
    );

@riverpod
FlutterSecureStorage secureStorage(Ref ref) {
  return FlutterSecureStorage(aOptions: _getAndroidOptions());
}
