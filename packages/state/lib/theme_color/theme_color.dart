import 'package:core_di_provider/di_provider.dart';
import 'package:core_foundation/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_color.g.dart';

@riverpod
class ThemeColorNotifier extends _$ThemeColorNotifier {
  late final SharedPreferences _sharedPreferences;
  final _themeKey = AppSharedPreferenceKey.appThemeColorKey;

  @override
  ThemeMode build() {
    _sharedPreferences = ref.read(sharedPreferencesProvider);
    loadTheme();
    return state;
  }

  void loadTheme() {
    final themeIndex =
        _sharedPreferences.getInt(_themeKey.name) ?? ThemeMode.light.index;
    state = ThemeMode.values[themeIndex];
  }

  void setTheme(ThemeMode themeMode) {
    state = themeMode;
    _sharedPreferences.setInt(_themeKey.name, themeMode.index);
  }
}
