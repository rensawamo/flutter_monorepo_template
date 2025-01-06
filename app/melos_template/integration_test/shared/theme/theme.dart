import 'package:flutter/material.dart';

import '../../common.dart';

extension CommonOperations on PatrolIntegrationTester {
  Future<ThemeMode?> getThemeMode(Finder appFinder) async {
    final themeMode = tester.widget<MaterialApp>(appFinder).themeMode;
    return themeMode;
  }
}
