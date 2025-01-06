import 'package:core_foundation/foundation.dart';
import 'package:flutter/material.dart';
import 'package:melos_template/core/foundation/constant/e2e_key.dart';

import '../common.dart';
import 'permisson/native_operation.dart';

extension CommonOperations on PatrolIntegrationTester {
  Future<void> introSkip() async {
    await turnOnNetwork();
    await tap(find.byKey(Key(E2eKey.introNextKey.name)));
    await pumpAndSettle();

    await tap(find.byKey(Key(E2eKey.introNextKey.name)));

    await waitUntilVisible(find.byKey(Key(E2eKey.introDoneKey.name)));
    await tap(find.byKey(Key(E2eKey.introDoneKey.name)));

    await pumpAndSettle();

    await grantNotificationPermission();
  }

  Future<void> expectAppErrorDialogAndClose(AppError error) async {
    final title = find.text(error.type.value);
    expect(title, findsOneWidget);
    await tap(find.text('close'));
    expect(title, findsNothing);
  }

  Future<void> backPage() async {
    await tap(find.byIcon(Icons.arrow_back_ios));
    await pumpAndSettle();
  }
}
