// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioHash() => r'86ee47876ccdd31b2529632681c7a8f40dbd49ba';

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

/// See also [dio].
@ProviderFor(dio)
const dioProvider = DioFamily();

/// See also [dio].
class DioFamily extends Family<AsyncValue<Dio>> {
  /// See also [dio].
  const DioFamily();

  /// See also [dio].
  DioProvider call({
    bool isRequireAuthenticate = true,
    bool roDisableRetry = false,
    Duration connectTimeout = const Duration(seconds: 7),
    Duration receiveTimeout = const Duration(seconds: 7),
    Duration sendTimeout = const Duration(seconds: 7),
  }) {
    return DioProvider(
      isRequireAuthenticate: isRequireAuthenticate,
      roDisableRetry: roDisableRetry,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
    );
  }

  @override
  DioProvider getProviderOverride(
    covariant DioProvider provider,
  ) {
    return call(
      isRequireAuthenticate: provider.isRequireAuthenticate,
      roDisableRetry: provider.roDisableRetry,
      connectTimeout: provider.connectTimeout,
      receiveTimeout: provider.receiveTimeout,
      sendTimeout: provider.sendTimeout,
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
  String? get name => r'dioProvider';
}

/// See also [dio].
class DioProvider extends AutoDisposeFutureProvider<Dio> {
  /// See also [dio].
  DioProvider({
    bool isRequireAuthenticate = true,
    bool roDisableRetry = false,
    Duration connectTimeout = const Duration(seconds: 7),
    Duration receiveTimeout = const Duration(seconds: 7),
    Duration sendTimeout = const Duration(seconds: 7),
  }) : this._internal(
          (ref) => dio(
            ref as DioRef,
            isRequireAuthenticate: isRequireAuthenticate,
            roDisableRetry: roDisableRetry,
            connectTimeout: connectTimeout,
            receiveTimeout: receiveTimeout,
            sendTimeout: sendTimeout,
          ),
          from: dioProvider,
          name: r'dioProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
          dependencies: DioFamily._dependencies,
          allTransitiveDependencies: DioFamily._allTransitiveDependencies,
          isRequireAuthenticate: isRequireAuthenticate,
          roDisableRetry: roDisableRetry,
          connectTimeout: connectTimeout,
          receiveTimeout: receiveTimeout,
          sendTimeout: sendTimeout,
        );

  DioProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.isRequireAuthenticate,
    required this.roDisableRetry,
    required this.connectTimeout,
    required this.receiveTimeout,
    required this.sendTimeout,
  }) : super.internal();

  final bool isRequireAuthenticate;
  final bool roDisableRetry;
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final Duration sendTimeout;

  @override
  Override overrideWith(
    FutureOr<Dio> Function(DioRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DioProvider._internal(
        (ref) => create(ref as DioRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        isRequireAuthenticate: isRequireAuthenticate,
        roDisableRetry: roDisableRetry,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        sendTimeout: sendTimeout,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Dio> createElement() {
    return _DioProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DioProvider &&
        other.isRequireAuthenticate == isRequireAuthenticate &&
        other.roDisableRetry == roDisableRetry &&
        other.connectTimeout == connectTimeout &&
        other.receiveTimeout == receiveTimeout &&
        other.sendTimeout == sendTimeout;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, isRequireAuthenticate.hashCode);
    hash = _SystemHash.combine(hash, roDisableRetry.hashCode);
    hash = _SystemHash.combine(hash, connectTimeout.hashCode);
    hash = _SystemHash.combine(hash, receiveTimeout.hashCode);
    hash = _SystemHash.combine(hash, sendTimeout.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DioRef on AutoDisposeFutureProviderRef<Dio> {
  /// The parameter `isRequireAuthenticate` of this provider.
  bool get isRequireAuthenticate;

  /// The parameter `roDisableRetry` of this provider.
  bool get roDisableRetry;

  /// The parameter `connectTimeout` of this provider.
  Duration get connectTimeout;

  /// The parameter `receiveTimeout` of this provider.
  Duration get receiveTimeout;

  /// The parameter `sendTimeout` of this provider.
  Duration get sendTimeout;
}

class _DioProviderElement extends AutoDisposeFutureProviderElement<Dio>
    with DioRef {
  _DioProviderElement(super.provider);

  @override
  bool get isRequireAuthenticate =>
      (origin as DioProvider).isRequireAuthenticate;
  @override
  bool get roDisableRetry => (origin as DioProvider).roDisableRetry;
  @override
  Duration get connectTimeout => (origin as DioProvider).connectTimeout;
  @override
  Duration get receiveTimeout => (origin as DioProvider).receiveTimeout;
  @override
  Duration get sendTimeout => (origin as DioProvider).sendTimeout;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
