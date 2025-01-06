import 'package:flutter_test/flutter_test.dart';
import 'package:melos_template/main.dart' as app_main;
import 'package:patrol/patrol.dart';

export 'package:flutter_test/flutter_test.dart';
export 'package:patrol/patrol.dart';

const _nativeAutomatorConfig = NativeAutomatorConfig(
  findTimeout: Duration(seconds: 20),
);

Future<void> createApp(PatrolIntegrationTester $) async {
  await app_main.main();
  await $.pumpAndSettle();
}

void patrol(
  String description,
  Future<void> Function(PatrolIntegrationTester) callback, {
  bool? skip,
  List<String> tags = const [],
  NativeAutomatorConfig? nativeAutomatorConfig,
  LiveTestWidgetsFlutterBindingFramePolicy framePolicy =
      LiveTestWidgetsFlutterBindingFramePolicy.fadePointers,
}) {
  patrolTest(
    description,
    nativeAutomatorConfig: nativeAutomatorConfig ?? _nativeAutomatorConfig,
    framePolicy: framePolicy,
    skip: skip,
    callback,
    tags: tags,
  );
}
