import '../../common.dart';

extension CommonOperations on PatrolIntegrationTester {
  Future<void> nativeTapByText(
    String androidText,
    String iosLabel,
  ) async {
    await native2.tap(
      NativeSelector(
        android: AndroidSelector(text: 'Allow'),
        ios: IOSSelector(label: 'Allow'),
      ),
    );
    await pumpAndSettle();
  }

  Future<void> turnOnNetwork() async {
    await native.enableCellular();
    await native.enableWifi();
    await pumpAndSettle();
  }

  Future<void> turnOffNetwork() async {
    await native.disableCellular();
    await native.disableWifi();
    await pumpAndSettle();
  }
}
