enum AppSecureStorageKey {
  accessToken('accessToken'),
  refreshToken('refreshToken'),
  deviceToken('deviceToken');

  const AppSecureStorageKey(this.value);
  final String value;
}
