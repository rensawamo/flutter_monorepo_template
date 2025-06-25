// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PermissionState {
  bool get notification;
  bool get camera;

  /// Create a copy of PermissionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PermissionStateCopyWith<PermissionState> get copyWith =>
      _$PermissionStateCopyWithImpl<PermissionState>(
          this as PermissionState, _$identity);

  /// Serializes this PermissionState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PermissionState &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            (identical(other.camera, camera) || other.camera == camera));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, notification, camera);

  @override
  String toString() {
    return 'PermissionState(notification: $notification, camera: $camera)';
  }
}

/// @nodoc
abstract mixin class $PermissionStateCopyWith<$Res> {
  factory $PermissionStateCopyWith(
          PermissionState value, $Res Function(PermissionState) _then) =
      _$PermissionStateCopyWithImpl;
  @useResult
  $Res call({bool notification, bool camera});
}

/// @nodoc
class _$PermissionStateCopyWithImpl<$Res>
    implements $PermissionStateCopyWith<$Res> {
  _$PermissionStateCopyWithImpl(this._self, this._then);

  final PermissionState _self;
  final $Res Function(PermissionState) _then;

  /// Create a copy of PermissionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notification = null,
    Object? camera = null,
  }) {
    return _then(_self.copyWith(
      notification: null == notification
          ? _self.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as bool,
      camera: null == camera
          ? _self.camera
          : camera // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PermissionState implements PermissionState {
  const _PermissionState({this.notification = false, this.camera = false});
  factory _PermissionState.fromJson(Map<String, dynamic> json) =>
      _$PermissionStateFromJson(json);

  @override
  @JsonKey()
  final bool notification;
  @override
  @JsonKey()
  final bool camera;

  /// Create a copy of PermissionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PermissionStateCopyWith<_PermissionState> get copyWith =>
      __$PermissionStateCopyWithImpl<_PermissionState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PermissionStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PermissionState &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            (identical(other.camera, camera) || other.camera == camera));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, notification, camera);

  @override
  String toString() {
    return 'PermissionState(notification: $notification, camera: $camera)';
  }
}

/// @nodoc
abstract mixin class _$PermissionStateCopyWith<$Res>
    implements $PermissionStateCopyWith<$Res> {
  factory _$PermissionStateCopyWith(
          _PermissionState value, $Res Function(_PermissionState) _then) =
      __$PermissionStateCopyWithImpl;
  @override
  @useResult
  $Res call({bool notification, bool camera});
}

/// @nodoc
class __$PermissionStateCopyWithImpl<$Res>
    implements _$PermissionStateCopyWith<$Res> {
  __$PermissionStateCopyWithImpl(this._self, this._then);

  final _PermissionState _self;
  final $Res Function(_PermissionState) _then;

  /// Create a copy of PermissionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? notification = null,
    Object? camera = null,
  }) {
    return _then(_PermissionState(
      notification: null == notification
          ? _self.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as bool,
      camera: null == camera
          ? _self.camera
          : camera // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
