import 'package:flutter/material.dart';
import 'package:melos_template/core/foundation/constant/e2e_key.dart';

import '../common.dart';
import 'native_operation/native_operation.dart';

extension CommonOperations on PatrolIntegrationTester {
  Future<void> introSkip() async {
    await turnOnNetwork();
    // ex) Use Key
    await tap(find.byKey(K.introNextKey));
    await pump();

    await tap(find.byKey(K.introDoneKey));
    await pump();
  }

  Future<void> backPage() async {
    await tap(find.byIcon(Icons.arrow_back_ios));
    await pump();
  }
}
