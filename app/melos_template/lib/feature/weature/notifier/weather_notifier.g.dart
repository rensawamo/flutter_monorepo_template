// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weatherNotifierHash() => r'd1784ae3b8b904e8abe6e64664170562af64b093';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$WeatherNotifier
    extends BuildlessAutoDisposeAsyncNotifier<WeatherState> {
  late final String city;

  FutureOr<WeatherState> build(
    String city,
  );
}

/// See also [WeatherNotifier].
@ProviderFor(WeatherNotifier)
const weatherNotifierProvider = WeatherNotifierFamily();

/// See also [WeatherNotifier].
class WeatherNotifierFamily extends Family<AsyncValue<WeatherState>> {
  /// See also [WeatherNotifier].
  const WeatherNotifierFamily();

  /// See also [WeatherNotifier].
  WeatherNotifierProvider call(
    String city,
  ) {
    return WeatherNotifierProvider(
      city,
    );
  }

  @override
  WeatherNotifierProvider getProviderOverride(
    covariant WeatherNotifierProvider provider,
  ) {
    return call(
      provider.city,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'weatherNotifierProvider';
}

/// See also [WeatherNotifier].
class WeatherNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    WeatherNotifier, WeatherState> {
  /// See also [WeatherNotifier].
  WeatherNotifierProvider(
    String city,
  ) : this._internal(
          () => WeatherNotifier()..city = city,
          from: weatherNotifierProvider,
          name: r'weatherNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$weatherNotifierHash,
          dependencies: WeatherNotifierFamily._dependencies,
          allTransitiveDependencies:
              WeatherNotifierFamily._allTransitiveDependencies,
          city: city,
        );

  WeatherNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.city,
  }) : super.internal();

  final String city;

  @override
  FutureOr<WeatherState> runNotifierBuild(
    covariant WeatherNotifier notifier,
  ) {
    return notifier.build(
      city,
    );
  }

  @override
  Override overrideWith(WeatherNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: WeatherNotifierProvider._internal(
        () => create()..city = city,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        city: city,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<WeatherNotifier, WeatherState>
      createElement() {
    return _WeatherNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WeatherNotifierProvider && other.city == city;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, city.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WeatherNotifierRef on AutoDisposeAsyncNotifierProviderRef<WeatherState> {
  /// The parameter `city` of this provider.
  String get city;
}

class _WeatherNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<WeatherNotifier,
        WeatherState> with WeatherNotifierRef {
  _WeatherNotifierProviderElement(super.provider);

  @override
  String get city => (origin as WeatherNotifierProvider).city;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
