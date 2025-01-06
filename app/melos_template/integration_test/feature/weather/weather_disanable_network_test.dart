import 'package:core_foundation/foundation.dart';

import '../../common.dart';
import '../../shared/base.dart';
import '../../shared/common_operation.dart';
import '../../shared/permisson/native_operation.dart';

void main() {
  patrol(
    'counter state is the same after going to Home and switching apps',
    ($) async {
      await createApp($);
      await $.introSkip();

      await $.turnOffNetwork();

      await $.tapByText('Get to weather info (REST API)');

      await $.expectAppErrorDialogAndClose(AppError.networkError());
      await $.turnOnNetwork();
      await $.backPage();
      await $.tapByText('Get to weather info (REST API)');

      expect($('Details'), findsOneWidget);
    },
  );
}
