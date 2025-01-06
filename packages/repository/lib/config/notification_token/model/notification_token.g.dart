// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationTokenModelImpl _$$NotificationTokenModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationTokenModelImpl(
      fcmToken: json['fcmToken'] as String?,
      apnsToken: json['apnsToken'] as String?,
    );

Map<String, dynamic> _$$NotificationTokenModelImplToJson(
        _$NotificationTokenModelImpl instance) =>
    <String, dynamic>{
      'fcmToken': instance.fcmToken,
      'apnsToken': instance.apnsToken,
    };
