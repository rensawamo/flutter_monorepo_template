import 'package:core_foundation/extension/context_extension.dart';
import 'package:flutter/material.dart';

class WeatherInfoCard extends StatelessWidget {
  const WeatherInfoCard({
    required this.iconCode,
    required this.description,
    required this.temperature,
    required this.feelsLike,
    required this.windSpeed,
    super.key,
  });
  final String iconCode;
  final String description;
  final double temperature;
  final double feelsLike;
  final double windSpeed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          'http://openweathermap.org/img/wn/$iconCode@2x.png',
          height: context.mediaQueryHeight * .1,
          width: context.mediaQueryWidth * .1,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Temperature: ${temperature.toStringAsFixed(1)}°C',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'Feels like: ${feelsLike.toStringAsFixed(1)}°C',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'Wind Speed: ${windSpeed.toStringAsFixed(1)} m/s',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}
