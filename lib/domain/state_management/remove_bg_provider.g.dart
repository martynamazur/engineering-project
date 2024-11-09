// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_bg_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioHash() => r'88003a0ccbd9943d36be3d0e6f7f819daa31daeb';

/// See also [dio].
@ProviderFor(dio)
final dioProvider = AutoDisposeProvider<Dio>.internal(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DioRef = AutoDisposeProviderRef<Dio>;
String _$removeBgRepositoryHash() =>
    r'b37c65984c5a696e94c3a46d5eb486ca98a79cbf';

/// See also [removeBgRepository].
@ProviderFor(removeBgRepository)
final removeBgRepositoryProvider =
    AutoDisposeProvider<RemoveBgRepository>.internal(
  removeBgRepository,
  name: r'removeBgRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$removeBgRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RemoveBgRepositoryRef = AutoDisposeProviderRef<RemoveBgRepository>;
String _$removePhotoBackgroundHash() =>
    r'309211f8df6cee9fb884c2af3e00acdfb58c9afc';

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

/// See also [removePhotoBackground].
@ProviderFor(removePhotoBackground)
const removePhotoBackgroundProvider = RemovePhotoBackgroundFamily();

/// See also [removePhotoBackground].
class RemovePhotoBackgroundFamily extends Family<AsyncValue<File?>> {
  /// See also [removePhotoBackground].
  const RemovePhotoBackgroundFamily();

  /// See also [removePhotoBackground].
  RemovePhotoBackgroundProvider call(
    File image,
  ) {
    return RemovePhotoBackgroundProvider(
      image,
    );
  }

  @override
  RemovePhotoBackgroundProvider getProviderOverride(
    covariant RemovePhotoBackgroundProvider provider,
  ) {
    return call(
      provider.image,
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
  String? get name => r'removePhotoBackgroundProvider';
}

/// See also [removePhotoBackground].
class RemovePhotoBackgroundProvider extends AutoDisposeFutureProvider<File?> {
  /// See also [removePhotoBackground].
  RemovePhotoBackgroundProvider(
    File image,
  ) : this._internal(
          (ref) => removePhotoBackground(
            ref as RemovePhotoBackgroundRef,
            image,
          ),
          from: removePhotoBackgroundProvider,
          name: r'removePhotoBackgroundProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$removePhotoBackgroundHash,
          dependencies: RemovePhotoBackgroundFamily._dependencies,
          allTransitiveDependencies:
              RemovePhotoBackgroundFamily._allTransitiveDependencies,
          image: image,
        );

  RemovePhotoBackgroundProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.image,
  }) : super.internal();

  final File image;

  @override
  Override overrideWith(
    FutureOr<File?> Function(RemovePhotoBackgroundRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RemovePhotoBackgroundProvider._internal(
        (ref) => create(ref as RemovePhotoBackgroundRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        image: image,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<File?> createElement() {
    return _RemovePhotoBackgroundProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RemovePhotoBackgroundProvider && other.image == image;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, image.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RemovePhotoBackgroundRef on AutoDisposeFutureProviderRef<File?> {
  /// The parameter `image` of this provider.
  File get image;
}

class _RemovePhotoBackgroundProviderElement
    extends AutoDisposeFutureProviderElement<File?>
    with RemovePhotoBackgroundRef {
  _RemovePhotoBackgroundProviderElement(super.provider);

  @override
  File get image => (origin as RemovePhotoBackgroundProvider).image;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
