import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:melos_template/core/network/api_client/weather_api_client.dart';
import 'package:melos_template/feature/weature/model/weature_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_repository.g.dart';

@riverpod
Future<WeatherRepository> weatherRepository(Ref ref) async {
  final apiClient = await ref.read(weatherApiClientProvider.future);
  return WeatherRepository(apiClient);
}

class WeatherRepository {
  WeatherRepository(this.apiClient);
  final WeatherApiClient apiClient;

  Future<WeatherState> getWeather(String city) async {
    final cityName = city.isEmpty ? 'Tokyo' : city;
    final data = await apiClient.getCurrentWeather(
      cityName,
      dotenv.get('OPEN_WEATHER_API_KEY'),
    );

    return WeatherState(weatherData: data);
  }
}
