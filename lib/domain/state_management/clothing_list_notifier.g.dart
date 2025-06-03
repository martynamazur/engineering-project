// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clothing_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clothingListNotifierHash() =>
    r'd24965c11868bf5b05e846a7e88413a384f88a77';

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

abstract class _$ClothingListNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<ClothingItem>> {
  late final int folderId;

  FutureOr<List<ClothingItem>> build(
    int folderId,
  );
}

/// See also [ClothingListNotifier].
@ProviderFor(ClothingListNotifier)
const clothingListNotifierProvider = ClothingListNotifierFamily();

/// See also [ClothingListNotifier].
class ClothingListNotifierFamily
    extends Family<AsyncValue<List<ClothingItem>>> {
  /// See also [ClothingListNotifier].
  const ClothingListNotifierFamily();

  /// See also [ClothingListNotifier].
  ClothingListNotifierProvider call(
    int folderId,
  ) {
    return ClothingListNotifierProvider(
      folderId,
    );
  }

  @override
  ClothingListNotifierProvider getProviderOverride(
    covariant ClothingListNotifierProvider provider,
  ) {
    return call(
      provider.folderId,
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
  String? get name => r'clothingListNotifierProvider';
}

/// See also [ClothingListNotifier].
class ClothingListNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ClothingListNotifier, List<ClothingItem>> {
  /// See also [ClothingListNotifier].
  ClothingListNotifierProvider(
    int folderId,
  ) : this._internal(
          () => ClothingListNotifier()..folderId = folderId,
          from: clothingListNotifierProvider,
          name: r'clothingListNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$clothingListNotifierHash,
          dependencies: ClothingListNotifierFamily._dependencies,
          allTransitiveDependencies:
              ClothingListNotifierFamily._allTransitiveDependencies,
          folderId: folderId,
        );

  ClothingListNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.folderId,
  }) : super.internal();

  final int folderId;

  @override
  FutureOr<List<ClothingItem>> runNotifierBuild(
    covariant ClothingListNotifier notifier,
  ) {
    return notifier.build(
      folderId,
    );
  }

  @override
  Override overrideWith(ClothingListNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ClothingListNotifierProvider._internal(
        () => create()..folderId = folderId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        folderId: folderId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ClothingListNotifier,
      List<ClothingItem>> createElement() {
    return _ClothingListNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ClothingListNotifierProvider && other.folderId == folderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, folderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ClothingListNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<List<ClothingItem>> {
  /// The parameter `folderId` of this provider.
  int get folderId;
}

class _ClothingListNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ClothingListNotifier,
        List<ClothingItem>> with ClothingListNotifierRef {
  _ClothingListNotifierProviderElement(super.provider);

  @override
  int get folderId => (origin as ClothingListNotifierProvider).folderId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
