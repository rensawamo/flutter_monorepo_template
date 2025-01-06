import '../../common.dart';
import '../../shared/base.dart';
import '../../shared/common_operation.dart';

void main() {
  patrol(
    'counter state is the same after going to Home and switching apps',
    ($) async {
      await createApp($);
      await $.introSkip();

      await $.tapByText('Get to weather info (REST API)');

      await $.inputTextField('invalid city name');

      await $.tapByText('Search');
    },
  );
}
