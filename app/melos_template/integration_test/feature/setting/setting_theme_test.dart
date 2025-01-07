import 'package:flutter/material.dart';

import '../../common.dart';
import '../../shared/base.dart';
import '../../shared/theme/theme.dart';

void main() {
  patrol(
    'setting theme mode test',
    ($) async {
      await createApp($);
      await $.introSkip();
      await $.tap(find.byType(Icons).first);
      await $.pumpAndSettle();
      await $.tap(find.byType(Switch));
      final appFinder = find.byType(MaterialApp).first;
      await $.pumpAndSettle();
      final themeMode = await $.getThemeMode(appFinder);
      expect(themeMode, ThemeMode.dark);
      await $.tap(find.byType(Switch));
      await $.pumpAndSettle();
      final themeMode2 = await $.getThemeMode(appFinder);
      expect(themeMode2, ThemeMode.light);
    },
  );
}
