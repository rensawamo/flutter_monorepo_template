import 'package:core_foundation/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:melos_template/feature/weature/model/weature_state.dart';
import 'package:melos_template/feature/weature/ui/component/weather_detail_list.dart';
import 'package:melos_template/feature/weature/ui/component/weather_info_card.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({
    required this.state,
    super.key,
  });

  final WeatherState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: context.mediaQueryHeight * .05),
        Text(
          'Weather in ${state.weatherData!.name}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        WeatherInfoCard(
          iconCode: state.weatherData!.weather[0].icon,
          description: state.weatherData!.weather[0].description,
          temperature: state.weatherData!.main.temp - 273.15,
          feelsLike: state.weatherData!.main.feels_like - 273.15,
          windSpeed: state.weatherData!.wind.speed,
        ),
        const SizedBox(height: 20),
        Text(
          'Details',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 10),
        DetailList(
          humidity: state.weatherData!.main.humidity,
          pressure: state.weatherData!.main.pressure,
        ),
      ],
    );
  }
}
