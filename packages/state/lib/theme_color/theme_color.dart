import 'package:core_di_provider/di_provider.dart';
import 'package:core_foundation/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_color.g.dart';

@riverpod
class ThemeColorNotifier extends _$ThemeColorNotifier {
  late final SharedPreferencesWithCache _prefWithCache;
  final AppSharedPreferenceKey _themeKey =
      AppSharedPreferenceKey.appThemeColorKey;

  @override
  ThemeMode build() {
    _prefWithCache = ref.read(sharedPreferencesWithCacheProvider);
    return loadTheme();
  }

  ThemeMode loadTheme() {
    final themeIndex =
        _prefWithCache.getInt(_themeKey.name) ?? ThemeMode.light.index;
    return ThemeMode.values[themeIndex];
  }

  void setTheme(ThemeMode themeMode) {
    state = themeMode;
    _prefWithCache.setInt(_themeKey.name, themeMode.index);
  }
}
