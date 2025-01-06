import 'package:melos_template/feature/weature/model/weature_state.dart';
import 'package:melos_template/feature/weature/repository/weather_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_notifier.g.dart';

@riverpod
class WeatherNotifier extends _$WeatherNotifier {
  Future<WeatherState> _fetchWeatherData(String city) async {
    final repository = await ref.read(weatherRepositoryProvider.future);

    return repository.getWeather(city);
  }

  @override
  Future<WeatherState> build(String city) async {
    return _fetchWeatherData(city);
  }
}
