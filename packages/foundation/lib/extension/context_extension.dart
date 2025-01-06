import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  bool get isMacOS => Theme.of(this).platform == TargetPlatform.macOS;
  Brightness get platformBrightness => MediaQuery.platformBrightnessOf(this);

  double get appBarHeight => MediaQuery.paddingOf(this).top + kToolbarHeight;
  double get safeAreaBottom => MediaQuery.paddingOf(this).bottom;

  double get mediaQueryHeight => MediaQuery.sizeOf(this).height;
  double get mediaQueryWidth => MediaQuery.sizeOf(this).width;

  void hideKeyboard() {
    final currentScope = FocusScope.of(this);
    if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
