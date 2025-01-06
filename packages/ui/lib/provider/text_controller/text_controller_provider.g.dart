// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_controller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$textControllerHash() => r'30c182b45658cacdc7b606e19820a80e379f079e';

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

abstract class _$TextController
    extends BuildlessAutoDisposeNotifier<TextEditingController> {
  late final int num;

  TextEditingController build(
    int num,
  );
}

/// See also [TextController].
@ProviderFor(TextController)
const textControllerProvider = TextControllerFamily();

/// See also [TextController].
class TextControllerFamily extends Family<TextEditingController> {
  /// See also [TextController].
  const TextControllerFamily();

  /// See also [TextController].
  TextControllerProvider call(
    int num,
  ) {
    return TextControllerProvider(
      num,
    );
  }

  @override
  TextControllerProvider getProviderOverride(
    covariant TextControllerProvider provider,
  ) {
    return call(
      provider.num,
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
  String? get name => r'textControllerProvider';
}

/// See also [TextController].
class TextControllerProvider extends AutoDisposeNotifierProviderImpl<
    TextController, TextEditingController> {
  /// See also [TextController].
  TextControllerProvider(
    int num,
  ) : this._internal(
          () => TextController()..num = num,
          from: textControllerProvider,
          name: r'textControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$textControllerHash,
          dependencies: TextControllerFamily._dependencies,
          allTransitiveDependencies:
              TextControllerFamily._allTransitiveDependencies,
          num: num,
        );

  TextControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.num,
  }) : super.internal();

  final int num;

  @override
  TextEditingController runNotifierBuild(
    covariant TextController notifier,
  ) {
    return notifier.build(
      num,
    );
  }

  @override
  Override overrideWith(TextController Function() create) {
    return ProviderOverride(
      origin: this,
      override: TextControllerProvider._internal(
        () => create()..num = num,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        num: num,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<TextController, TextEditingController>
      createElement() {
    return _TextControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TextControllerProvider && other.num == num;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, num.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TextControllerRef
    on AutoDisposeNotifierProviderRef<TextEditingController> {
  /// The parameter `num` of this provider.
  int get num;
}

class _TextControllerProviderElement extends AutoDisposeNotifierProviderElement<
    TextController, TextEditingController> with TextControllerRef {
  _TextControllerProviderElement(super.provider);

  @override
  int get num => (origin as TextControllerProvider).num;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
