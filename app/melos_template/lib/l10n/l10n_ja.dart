import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get setting => '設定';

  @override
  String get home => 'ホーム';

  @override
  String get darkmode => 'ダークモード';

  @override
  String get weather => '天気';

  @override
  String get welcomeMessage => 'melos template へようこそ！';

  @override
  String get useAsReference => 'このアプリケーションを参考にしましょう！';

  @override
  String get usingRiverpod => 'Riverpodを使用します!';

  @override
  String get welcomeApp => 'アプリへようこそ！';

  @override
  String get getWeatherInfo => '天気情報を取得しましょう (REST API)';

  @override
  String get temperature => '気温';

  @override
  String get feelsLike => '体感温度';

  @override
  String get windSpeed => '風速';

  @override
  String get humidity => '湿度';

  @override
  String get pressure => '気圧';

  @override
  String get visibility => '視界';
}
