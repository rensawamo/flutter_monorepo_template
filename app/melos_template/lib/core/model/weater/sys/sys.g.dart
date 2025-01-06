// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SysImpl _$$SysImplFromJson(Map<String, dynamic> json) => _$SysImpl(
      country: json['country'] as String,
      sunrise: (json['sunrise'] as num).toInt(),
      sunset: (json['sunset'] as num).toInt(),
    );

Map<String, dynamic> _$$SysImplToJson(_$SysImpl instance) => <String, dynamic>{
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
