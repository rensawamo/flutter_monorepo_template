// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PermissionStateImpl _$$PermissionStateImplFromJson(
        Map<String, dynamic> json) =>
    _$PermissionStateImpl(
      notification: json['notification'] as bool? ?? false,
      camera: json['camera'] as bool? ?? false,
    );

Map<String, dynamic> _$$PermissionStateImplToJson(
        _$PermissionStateImpl instance) =>
    <String, dynamic>{
      'notification': instance.notification,
      'camera': instance.camera,
    };
