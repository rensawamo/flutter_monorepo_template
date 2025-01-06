// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PermissionStateModelImpl _$$PermissionStateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PermissionStateModelImpl(
      notification: json['notification'] as bool? ?? false,
      backgroundLocation: json['backgroundLocation'] as bool? ?? false,
    );

Map<String, dynamic> _$$PermissionStateModelImplToJson(
        _$PermissionStateModelImpl instance) =>
    <String, dynamic>{
      'notification': instance.notification,
      'backgroundLocation': instance.backgroundLocation,
    };
