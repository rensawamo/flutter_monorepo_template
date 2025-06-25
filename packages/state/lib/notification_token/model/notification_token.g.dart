// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationToken _$NotificationTokenFromJson(Map<String, dynamic> json) =>
    _NotificationToken(
      fcmToken: json['fcmToken'] as String?,
      apnsToken: json['apnsToken'] as String?,
    );

Map<String, dynamic> _$NotificationTokenToJson(_NotificationToken instance) =>
    <String, dynamic>{
      'fcmToken': instance.fcmToken,
      'apnsToken': instance.apnsToken,
    };
