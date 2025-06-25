// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PermissionState _$PermissionStateFromJson(Map<String, dynamic> json) =>
    _PermissionState(
      notification: json['notification'] as bool? ?? false,
      camera: json['camera'] as bool? ?? false,
    );

Map<String, dynamic> _$PermissionStateToJson(_PermissionState instance) =>
    <String, dynamic>{
      'notification': instance.notification,
      'camera': instance.camera,
    };
