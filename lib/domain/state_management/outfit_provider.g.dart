// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outfit_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$outfitRepositoryHash() => r'c0363bd466b52e9c54bea335f0057985563b5790';

/// See also [outfitRepository].
@ProviderFor(outfitRepository)
final outfitRepositoryProvider = AutoDisposeProvider<OutfitRepository>.internal(
  outfitRepository,
  name: r'outfitRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$outfitRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef OutfitRepositoryRef = AutoDisposeProviderRef<OutfitRepository>;
String _$getOwnedOutfitsHash() => r'2bc61e3aaef7ef59f7ee694b734d18c608360344';

/// See also [getOwnedOutfits].
@ProviderFor(getOwnedOutfits)
final getOwnedOutfitsProvider =
    AutoDisposeFutureProvider<List<Outfit>>.internal(
  getOwnedOutfits,
  name: r'getOwnedOutfitsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getOwnedOutfitsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetOwnedOutfitsRef = AutoDisposeFutureProviderRef<List<Outfit>>;
String _$saveOutfitHash() => r'c88f1018e46a054214310c052fa7017504f27716';

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

/// See also [saveOutfit].
@ProviderFor(saveOutfit)
const saveOutfitProvider = SaveOutfitFamily();

/// See also [saveOutfit].
class SaveOutfitFamily extends Family<AsyncValue<void>> {
  /// See also [saveOutfit].
  const SaveOutfitFamily();

  /// See also [saveOutfit].
  SaveOutfitProvider call(
    String imageUrl,
    List<int> clothingItemId,
  ) {
    return SaveOutfitProvider(
      imageUrl,
      clothingItemId,
    );
  }

  @override
  SaveOutfitProvider getProviderOverride(
    covariant SaveOutfitProvider provider,
  ) {
    return call(
      provider.imageUrl,
      provider.clothingItemId,
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
  String? get name => r'saveOutfitProvider';
}

/// See also [saveOutfit].
class SaveOutfitProvider extends AutoDisposeFutureProvider<void> {
  /// See also [saveOutfit].
  SaveOutfitProvider(
    String imageUrl,
    List<int> clothingItemId,
  ) : this._internal(
          (ref) => saveOutfit(
            ref as SaveOutfitRef,
            imageUrl,
            clothingItemId,
          ),
          from: saveOutfitProvider,
          name: r'saveOutfitProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveOutfitHash,
          dependencies: SaveOutfitFamily._dependencies,
          allTransitiveDependencies:
              SaveOutfitFamily._allTransitiveDependencies,
          imageUrl: imageUrl,
          clothingItemId: clothingItemId,
        );

  SaveOutfitProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.imageUrl,
    required this.clothingItemId,
  }) : super.internal();

  final String imageUrl;
  final List<int> clothingItemId;

  @override
  Override overrideWith(
    FutureOr<void> Function(SaveOutfitRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveOutfitProvider._internal(
        (ref) => create(ref as SaveOutfitRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        imageUrl: imageUrl,
        clothingItemId: clothingItemId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SaveOutfitProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveOutfitProvider &&
        other.imageUrl == imageUrl &&
        other.clothingItemId == clothingItemId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, imageUrl.hashCode);
    hash = _SystemHash.combine(hash, clothingItemId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SaveOutfitRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `imageUrl` of this provider.
  String get imageUrl;

  /// The parameter `clothingItemId` of this provider.
  List<int> get clothingItemId;
}

class _SaveOutfitProviderElement extends AutoDisposeFutureProviderElement<void>
    with SaveOutfitRef {
  _SaveOutfitProviderElement(super.provider);

  @override
  String get imageUrl => (origin as SaveOutfitProvider).imageUrl;
  @override
  List<int> get clothingItemId => (origin as SaveOutfitProvider).clothingItemId;
}

String _$deleteOutfitHash() => r'455636b58f2972f1ac2127b67680eaec4d12da22';

/// See also [deleteOutfit].
@ProviderFor(deleteOutfit)
const deleteOutfitProvider = DeleteOutfitFamily();

/// See also [deleteOutfit].
class DeleteOutfitFamily extends Family<AsyncValue<void>> {
  /// See also [deleteOutfit].
  const DeleteOutfitFamily();

  /// See also [deleteOutfit].
  DeleteOutfitProvider call(
    int outfitId,
  ) {
    return DeleteOutfitProvider(
      outfitId,
    );
  }

  @override
  DeleteOutfitProvider getProviderOverride(
    covariant DeleteOutfitProvider provider,
  ) {
    return call(
      provider.outfitId,
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
  String? get name => r'deleteOutfitProvider';
}

/// See also [deleteOutfit].
class DeleteOutfitProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteOutfit].
  DeleteOutfitProvider(
    int outfitId,
  ) : this._internal(
          (ref) => deleteOutfit(
            ref as DeleteOutfitRef,
            outfitId,
          ),
          from: deleteOutfitProvider,
          name: r'deleteOutfitProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteOutfitHash,
          dependencies: DeleteOutfitFamily._dependencies,
          allTransitiveDependencies:
              DeleteOutfitFamily._allTransitiveDependencies,
          outfitId: outfitId,
        );

  DeleteOutfitProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.outfitId,
  }) : super.internal();

  final int outfitId;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteOutfitRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteOutfitProvider._internal(
        (ref) => create(ref as DeleteOutfitRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        outfitId: outfitId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteOutfitProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteOutfitProvider && other.outfitId == outfitId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, outfitId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteOutfitRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `outfitId` of this provider.
  int get outfitId;
}

class _DeleteOutfitProviderElement
    extends AutoDisposeFutureProviderElement<void> with DeleteOutfitRef {
  _DeleteOutfitProviderElement(super.provider);

  @override
  int get outfitId => (origin as DeleteOutfitProvider).outfitId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
