// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get setting => 'setting';

  @override
  String get home => 'home';

  @override
  String get darkmode => 'darkmode';

  @override
  String get weather => 'weather';

  @override
  String get welcomeMessage => 'Welcome to melos template!';

  @override
  String get useAsReference => 'Lets use this application as a reference!';

  @override
  String get usingRiverpod => 'I will be using Riverpod a lot';

  @override
  String get welcomeApp => 'Welcome to the App!';

  @override
  String get getWeatherInfo => 'Get to weather info (REST API)';

  @override
  String get temperature => 'Temperature';

  @override
  String get feelsLike => 'Feels like';

  @override
  String get windSpeed => 'Wind Speed';

  @override
  String get humidity => 'Humidity';

  @override
  String get pressure => 'Pressure';

  @override
  String get visibility => 'Visibility';
}
