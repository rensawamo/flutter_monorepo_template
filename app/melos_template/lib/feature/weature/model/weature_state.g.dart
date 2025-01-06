// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weature_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherStateImpl _$$WeatherStateImplFromJson(Map<String, dynamic> json) =>
    _$WeatherStateImpl(
      weatherData: json['weatherData'] == null
          ? null
          : WeatherData.fromJson(json['weatherData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WeatherStateImplToJson(_$WeatherStateImpl instance) =>
    <String, dynamic>{
      'weatherData': instance.weatherData,
    };
