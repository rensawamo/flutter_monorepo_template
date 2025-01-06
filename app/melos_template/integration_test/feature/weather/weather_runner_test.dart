// void main() {
//   simulation_textfield_test.main();
//   descendant_test.main();
// }
import '../../common.dart';
import 'weather_invalid_city_test.dart' as weather_invalid_city_test;
import 'weather_test.dart' as weather_test;

void main() {
  group('Weather Tests', weather_test.main);
  group('Weather Invalid City Tests', weather_invalid_city_test.main);
}
