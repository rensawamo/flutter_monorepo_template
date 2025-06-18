import '../common.dart';
import '../constans/widget.dart';

extension CommonOperations on PatrolIntegrationTester {
  Future<void> inputTextField(String text) async {
    expect(textFormField, findsOneWidget);
    await enterText(textFormField, text);
    await pump();
    await tap(gestureDetector);
  }

  Future<void> findByText(String text) async {
    final finder = find.text(text);
    expect(finder, findsOneWidget);
    await pump();
  }

  Future<void> tapByText(String text) async {
    await tap(find.text(text));
    await pump();
  }

  Future<void> tapWidget(Finder finder) async {
    await tap(finder);
    await pump();
  }
}
