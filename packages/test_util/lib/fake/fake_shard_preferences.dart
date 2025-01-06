import 'package:shared_preferences/shared_preferences.dart';

class FakeSharedPreferences implements SharedPreferences {
  final Map<String, Object> _storage = {};

  @override
  Future<bool> setInt(String key, int value) async {
    _storage[key] = value;
    return true;
  }

  @override
  int? getInt(String key) {
    return _storage[key] as int?;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
