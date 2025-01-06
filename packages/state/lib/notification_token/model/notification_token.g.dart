// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationTokenImpl _$$NotificationTokenImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationTokenImpl(
      fcmToken: json['fcmToken'] as String?,
      apnsToken: json['apnsToken'] as String?,
    );

Map<String, dynamic> _$$NotificationTokenImplToJson(
        _$NotificationTokenImpl instance) =>
    <String, dynamic>{
      'fcmToken': instance.fcmToken,
      'apnsToken': instance.apnsToken,
    };
