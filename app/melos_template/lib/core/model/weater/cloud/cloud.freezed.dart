// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cloud.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Cloud _$CloudFromJson(Map<String, dynamic> json) {
  return _Cloud.fromJson(json);
}

/// @nodoc
mixin _$Cloud {
  int get all => throw _privateConstructorUsedError;

  /// Serializes this Cloud to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Cloud
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CloudCopyWith<Cloud> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CloudCopyWith<$Res> {
  factory $CloudCopyWith(Cloud value, $Res Function(Cloud) then) =
      _$CloudCopyWithImpl<$Res, Cloud>;
  @useResult
  $Res call({int all});
}

/// @nodoc
class _$CloudCopyWithImpl<$Res, $Val extends Cloud>
    implements $CloudCopyWith<$Res> {
  _$CloudCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Cloud
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? all = null,
  }) {
    return _then(_value.copyWith(
      all: null == all
          ? _value.all
          : all // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CloudImplCopyWith<$Res> implements $CloudCopyWith<$Res> {
  factory _$$CloudImplCopyWith(
          _$CloudImpl value, $Res Function(_$CloudImpl) then) =
      __$$CloudImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int all});
}

/// @nodoc
class __$$CloudImplCopyWithImpl<$Res>
    extends _$CloudCopyWithImpl<$Res, _$CloudImpl>
    implements _$$CloudImplCopyWith<$Res> {
  __$$CloudImplCopyWithImpl(
      _$CloudImpl _value, $Res Function(_$CloudImpl) _then)
      : super(_value, _then);

  /// Create a copy of Cloud
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? all = null,
  }) {
    return _then(_$CloudImpl(
      all: null == all
          ? _value.all
          : all // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CloudImpl implements _Cloud {
  const _$CloudImpl({required this.all});

  factory _$CloudImpl.fromJson(Map<String, dynamic> json) =>
      _$$CloudImplFromJson(json);

  @override
  final int all;

  @override
  String toString() {
    return 'Cloud(all: $all)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CloudImpl &&
            (identical(other.all, all) || other.all == all));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, all);

  /// Create a copy of Cloud
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CloudImplCopyWith<_$CloudImpl> get copyWith =>
      __$$CloudImplCopyWithImpl<_$CloudImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CloudImplToJson(
      this,
    );
  }
}

abstract class _Cloud implements Cloud {
  const factory _Cloud({required final int all}) = _$CloudImpl;

  factory _Cloud.fromJson(Map<String, dynamic> json) = _$CloudImpl.fromJson;

  @override
  int get all;

  /// Create a copy of Cloud
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CloudImplCopyWith<_$CloudImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
