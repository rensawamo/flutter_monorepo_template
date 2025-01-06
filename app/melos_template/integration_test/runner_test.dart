import 'package:flutter_test/flutter_test.dart';

import 'feature/e2e_sample/e2e_sample_runner_test.dart'
    as e2e_sample_runner_test;
import 'feature/setting/setting_runner_test.dart' as setting_runner_test;
import 'feature/weather/weather_runner_test.dart' as weather_runner_test;

void main() {
  group('setting', setting_runner_test.main);
  group('Weather Tests', weather_runner_test.main);
  group('E2E Sample Tests', e2e_sample_runner_test.main);
}
