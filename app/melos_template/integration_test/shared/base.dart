import 'package:flutter/material.dart';
import 'package:melos_template/core/foundation/constant/e2e_key.dart';

import '../common.dart';
import 'native_operation/native_operation.dart';

extension CommonOperations on PatrolIntegrationTester {
  Future<void> introSkip() async {
    await turnOnNetwork();
    await tap(find.byKey(Key(E2eKey.introNextKey.name)));
    await pumpAndSettle();

    await tap(find.byKey(Key(E2eKey.introDoneKey.name)));
    await pumpAndSettle();
  }

  Future<void> backPage() async {
    await tap(find.byIcon(Icons.arrow_back_ios));
    await pumpAndSettle();
  }
}
