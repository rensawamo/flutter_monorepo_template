// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weature_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeatherState _$WeatherStateFromJson(Map<String, dynamic> json) {
  return _WeatherState.fromJson(json);
}

/// @nodoc
mixin _$WeatherState {
  WeatherData? get weatherData => throw _privateConstructorUsedError;

  /// Serializes this WeatherState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherStateCopyWith<WeatherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
          WeatherState value, $Res Function(WeatherState) then) =
      _$WeatherStateCopyWithImpl<$Res, WeatherState>;
  @useResult
  $Res call({WeatherData? weatherData});

  $WeatherDataCopyWith<$Res>? get weatherData;
}

/// @nodoc
class _$WeatherStateCopyWithImpl<$Res, $Val extends WeatherState>
    implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherData = freezed,
  }) {
    return _then(_value.copyWith(
      weatherData: freezed == weatherData
          ? _value.weatherData
          : weatherData // ignore: cast_nullable_to_non_nullable
              as WeatherData?,
    ) as $Val);
  }

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherDataCopyWith<$Res>? get weatherData {
    if (_value.weatherData == null) {
      return null;
    }

    return $WeatherDataCopyWith<$Res>(_value.weatherData!, (value) {
      return _then(_value.copyWith(weatherData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherStateImplCopyWith<$Res>
    implements $WeatherStateCopyWith<$Res> {
  factory _$$WeatherStateImplCopyWith(
          _$WeatherStateImpl value, $Res Function(_$WeatherStateImpl) then) =
      __$$WeatherStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WeatherData? weatherData});

  @override
  $WeatherDataCopyWith<$Res>? get weatherData;
}

/// @nodoc
class __$$WeatherStateImplCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$WeatherStateImpl>
    implements _$$WeatherStateImplCopyWith<$Res> {
  __$$WeatherStateImplCopyWithImpl(
      _$WeatherStateImpl _value, $Res Function(_$WeatherStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherData = freezed,
  }) {
    return _then(_$WeatherStateImpl(
      weatherData: freezed == weatherData
          ? _value.weatherData
          : weatherData // ignore: cast_nullable_to_non_nullable
              as WeatherData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherStateImpl implements _WeatherState {
  const _$WeatherStateImpl({required this.weatherData});

  factory _$WeatherStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherStateImplFromJson(json);

  @override
  final WeatherData? weatherData;

  @override
  String toString() {
    return 'WeatherState(weatherData: $weatherData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherStateImpl &&
            (identical(other.weatherData, weatherData) ||
                other.weatherData == weatherData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, weatherData);

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherStateImplCopyWith<_$WeatherStateImpl> get copyWith =>
      __$$WeatherStateImplCopyWithImpl<_$WeatherStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherStateImplToJson(
      this,
    );
  }
}

abstract class _WeatherState implements WeatherState {
  const factory _WeatherState({required final WeatherData? weatherData}) =
      _$WeatherStateImpl;

  factory _WeatherState.fromJson(Map<String, dynamic> json) =
      _$WeatherStateImpl.fromJson;

  @override
  WeatherData? get weatherData;

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherStateImplCopyWith<_$WeatherStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
