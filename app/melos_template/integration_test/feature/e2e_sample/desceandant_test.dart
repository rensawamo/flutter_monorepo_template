import 'package:flutter/material.dart';

import '../../common.dart';
import '../../shared/base.dart';
import '../../shared/common_operation.dart';

void main() {
  patrol(
    'Test if the counter status is updated correctly',
    ($) async {
      await createApp($);
      await $.introSkip();

      await $.tapByText('E2E Sample');
      await $.tapByText('Descendant Page');

      final parentFinder = find.byType(Column);
      await $.tap(
        find.descendant(
          of: parentFinder,
          matching: find.widgetWithText(ElevatedButton, '+'),
        ),
      );
      expect($('Counter: 1'), findsOneWidget);
      await $.tap(
        find.descendant(
          of: parentFinder,
          matching: find.widgetWithText(ElevatedButton, '-'),
        ),
      );
      expect($('Counter: 0'), findsOneWidget);
    },
  );
}
