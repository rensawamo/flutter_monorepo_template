import '../../common.dart';
import '../../shared/base.dart';
import '../../shared/common_operation.dart';

void main() {
  patrol(
    'counter state is the same after going to Home and switching apps',
    ($) async {
      await createApp($);

      await $.introSkip();

      await $.tapByText('E2E Sample');

      await $.tapByText('Simulateion TextField Page');

      await $.inputTextField('Hello');

      await $.tapByText('Submit');

      expect(find.text('Submitted Text: Hello'), findsOneWidget);
    },
  );
}
