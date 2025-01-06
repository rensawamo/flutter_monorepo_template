import 'package:flutter/material.dart';

import '../common.dart';

extension CommonOperations on PatrolIntegrationTester {
  Future<void> inputTextField(String text) async {
    final textFieldFinder = find.byType(TextField);
    expect(textFieldFinder, findsOneWidget);
    await enterText(textFieldFinder, text);
    await pumpAndSettle();
  }

  Future<void> tapByText(String text) async {
    await tap(find.text(text));
    await pumpAndSettle();
  }
}
