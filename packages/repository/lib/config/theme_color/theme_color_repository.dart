import 'package:core_di_provider/di_provider.dart';
import 'package:core_foundation/enum/app_shared_preference_key.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_color_repository.g.dart';

@riverpod
class ThemeColorRepository extends _$ThemeColorRepository {
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
