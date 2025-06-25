// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationToken {
  String? get fcmToken;
  String? get apnsToken;

  /// Create a copy of NotificationToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationTokenCopyWith<NotificationToken> get copyWith =>
      _$NotificationTokenCopyWithImpl<NotificationToken>(
          this as NotificationToken, _$identity);

  /// Serializes this NotificationToken to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationToken &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.apnsToken, apnsToken) ||
                other.apnsToken == apnsToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fcmToken, apnsToken);

  @override
  String toString() {
    return 'NotificationToken(fcmToken: $fcmToken, apnsToken: $apnsToken)';
  }
}

/// @nodoc
abstract mixin class $NotificationTokenCopyWith<$Res> {
  factory $NotificationTokenCopyWith(
          NotificationToken value, $Res Function(NotificationToken) _then) =
      _$NotificationTokenCopyWithImpl;
  @useResult
  $Res call({String? fcmToken, String? apnsToken});
}

/// @nodoc
class _$NotificationTokenCopyWithImpl<$Res>
    implements $NotificationTokenCopyWith<$Res> {
  _$NotificationTokenCopyWithImpl(this._self, this._then);

  final NotificationToken _self;
  final $Res Function(NotificationToken) _then;

  /// Create a copy of NotificationToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fcmToken = freezed,
    Object? apnsToken = freezed,
  }) {
    return _then(_self.copyWith(
      fcmToken: freezed == fcmToken
          ? _self.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      apnsToken: freezed == apnsToken
          ? _self.apnsToken
          : apnsToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _NotificationToken implements NotificationToken {
  const _NotificationToken({required this.fcmToken, required this.apnsToken});
  factory _NotificationToken.fromJson(Map<String, dynamic> json) =>
      _$NotificationTokenFromJson(json);

  @override
  final String? fcmToken;
  @override
  final String? apnsToken;

  /// Create a copy of NotificationToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationTokenCopyWith<_NotificationToken> get copyWith =>
      __$NotificationTokenCopyWithImpl<_NotificationToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotificationTokenToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationToken &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.apnsToken, apnsToken) ||
                other.apnsToken == apnsToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fcmToken, apnsToken);

  @override
  String toString() {
    return 'NotificationToken(fcmToken: $fcmToken, apnsToken: $apnsToken)';
  }
}

/// @nodoc
abstract mixin class _$NotificationTokenCopyWith<$Res>
    implements $NotificationTokenCopyWith<$Res> {
  factory _$NotificationTokenCopyWith(
          _NotificationToken value, $Res Function(_NotificationToken) _then) =
      __$NotificationTokenCopyWithImpl;
  @override
  @useResult
  $Res call({String? fcmToken, String? apnsToken});
}

/// @nodoc
class __$NotificationTokenCopyWithImpl<$Res>
    implements _$NotificationTokenCopyWith<$Res> {
  __$NotificationTokenCopyWithImpl(this._self, this._then);

  final _NotificationToken _self;
  final $Res Function(_NotificationToken) _then;

  /// Create a copy of NotificationToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fcmToken = freezed,
    Object? apnsToken = freezed,
  }) {
    return _then(_NotificationToken(
      fcmToken: freezed == fcmToken
          ? _self.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      apnsToken: freezed == apnsToken
          ? _self.apnsToken
          : apnsToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
