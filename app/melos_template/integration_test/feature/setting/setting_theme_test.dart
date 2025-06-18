import 'package:flutter/material.dart';

import '../../common.dart';
import '../../constans/widget.dart';
import '../../shared/base.dart';
import '../../shared/common_operation.dart';
import '../../shared/theme/theme.dart';

void main() {
  patrol(
    'setting theme mode test',
    ($) async {
      await createApp($);
      await $.introSkip();
      await $.tapWidget(find.byType(Icons).first);
      await $.tapWidget(switchWidget);
      final appFinder = find.byType(MaterialApp).first;
      final themeMode = await $.getThemeMode(appFinder);
      expect(themeMode, ThemeMode.dark);
      await $.tapWidget(switchWidget);
      final themeMode2 = await $.getThemeMode(appFinder);
      expect(themeMode2, ThemeMode.light);
    },
  );
}
