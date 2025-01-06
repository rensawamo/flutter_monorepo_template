import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:melos_template/core/model/weater/weater_data/weather_data.dart';

part 'weature_state.freezed.dart';
part 'weature_state.g.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState({
    required WeatherData? weatherData,
  }) = _WeatherState;

  factory WeatherState.fromJson(Map<String, dynamic> json) =>
      _$WeatherStateFromJson(json);
}
