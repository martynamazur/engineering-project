// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outfit_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$outfitRepositoryHash() => r'98ca028b965d925e8fb4af25fbf74651842be8a8';

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
String _$getOwnedOutfitsHash() => r'2b1065c0d5a0803bead3c13ce60e5b2a88e683f5';

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
String _$saveOutfitHash() => r'98d7bcce95376be649c7f3fa37566795e05b6fe2';

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
class SaveOutfitFamily extends Family<AsyncValue<Result>> {
  /// See also [saveOutfit].
  const SaveOutfitFamily();

  /// See also [saveOutfit].
  SaveOutfitProvider call({
    required String imageUrl,
    required List<int> clothingItemId,
  }) {
    return SaveOutfitProvider(
      imageUrl: imageUrl,
      clothingItemId: clothingItemId,
    );
  }

  @override
  SaveOutfitProvider getProviderOverride(
    covariant SaveOutfitProvider provider,
  ) {
    return call(
      imageUrl: provider.imageUrl,
      clothingItemId: provider.clothingItemId,
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
class SaveOutfitProvider extends AutoDisposeFutureProvider<Result> {
  /// See also [saveOutfit].
  SaveOutfitProvider({
    required String imageUrl,
    required List<int> clothingItemId,
  }) : this._internal(
          (ref) => saveOutfit(
            ref as SaveOutfitRef,
            imageUrl: imageUrl,
            clothingItemId: clothingItemId,
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
    FutureOr<Result> Function(SaveOutfitRef provider) create,
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
  AutoDisposeFutureProviderElement<Result> createElement() {
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

mixin SaveOutfitRef on AutoDisposeFutureProviderRef<Result> {
  /// The parameter `imageUrl` of this provider.
  String get imageUrl;

  /// The parameter `clothingItemId` of this provider.
  List<int> get clothingItemId;
}

class _SaveOutfitProviderElement
    extends AutoDisposeFutureProviderElement<Result> with SaveOutfitRef {
  _SaveOutfitProviderElement(super.provider);

  @override
  String get imageUrl => (origin as SaveOutfitProvider).imageUrl;
  @override
  List<int> get clothingItemId => (origin as SaveOutfitProvider).clothingItemId;
}

String _$deleteOutfitHash() => r'cc9eb754aed5d8803dc2fd683410300ea264e417';

/// See also [deleteOutfit].
@ProviderFor(deleteOutfit)
const deleteOutfitProvider = DeleteOutfitFamily();

/// See also [deleteOutfit].
class DeleteOutfitFamily extends Family<AsyncValue<Result>> {
  /// See also [deleteOutfit].
  const DeleteOutfitFamily();

  /// See also [deleteOutfit].
  DeleteOutfitProvider call({
    required int outfitId,
  }) {
    return DeleteOutfitProvider(
      outfitId: outfitId,
    );
  }

  @override
  DeleteOutfitProvider getProviderOverride(
    covariant DeleteOutfitProvider provider,
  ) {
    return call(
      outfitId: provider.outfitId,
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
class DeleteOutfitProvider extends AutoDisposeFutureProvider<Result> {
  /// See also [deleteOutfit].
  DeleteOutfitProvider({
    required int outfitId,
  }) : this._internal(
          (ref) => deleteOutfit(
            ref as DeleteOutfitRef,
            outfitId: outfitId,
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
    FutureOr<Result> Function(DeleteOutfitRef provider) create,
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
  AutoDisposeFutureProviderElement<Result> createElement() {
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

mixin DeleteOutfitRef on AutoDisposeFutureProviderRef<Result> {
  /// The parameter `outfitId` of this provider.
  int get outfitId;
}

class _DeleteOutfitProviderElement
    extends AutoDisposeFutureProviderElement<Result> with DeleteOutfitRef {
  _DeleteOutfitProviderElement(super.provider);

  @override
  int get outfitId => (origin as DeleteOutfitProvider).outfitId;
}

String _$editOutfitInformationTagsHash() =>
    r'e282164d71cd3fb0b03f3f90b6f39a4b64c82aca';

/// See also [editOutfitInformationTags].
@ProviderFor(editOutfitInformationTags)
const editOutfitInformationTagsProvider = EditOutfitInformationTagsFamily();

/// See also [editOutfitInformationTags].
class EditOutfitInformationTagsFamily extends Family<AsyncValue<Result>> {
  /// See also [editOutfitInformationTags].
  const EditOutfitInformationTagsFamily();

  /// See also [editOutfitInformationTags].
  EditOutfitInformationTagsProvider call(
    List<String> updatedTags,
    int outfitId,
  ) {
    return EditOutfitInformationTagsProvider(
      updatedTags,
      outfitId,
    );
  }

  @override
  EditOutfitInformationTagsProvider getProviderOverride(
    covariant EditOutfitInformationTagsProvider provider,
  ) {
    return call(
      provider.updatedTags,
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
  String? get name => r'editOutfitInformationTagsProvider';
}

/// See also [editOutfitInformationTags].
class EditOutfitInformationTagsProvider
    extends AutoDisposeFutureProvider<Result> {
  /// See also [editOutfitInformationTags].
  EditOutfitInformationTagsProvider(
    List<String> updatedTags,
    int outfitId,
  ) : this._internal(
          (ref) => editOutfitInformationTags(
            ref as EditOutfitInformationTagsRef,
            updatedTags,
            outfitId,
          ),
          from: editOutfitInformationTagsProvider,
          name: r'editOutfitInformationTagsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editOutfitInformationTagsHash,
          dependencies: EditOutfitInformationTagsFamily._dependencies,
          allTransitiveDependencies:
              EditOutfitInformationTagsFamily._allTransitiveDependencies,
          updatedTags: updatedTags,
          outfitId: outfitId,
        );

  EditOutfitInformationTagsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.updatedTags,
    required this.outfitId,
  }) : super.internal();

  final List<String> updatedTags;
  final int outfitId;

  @override
  Override overrideWith(
    FutureOr<Result> Function(EditOutfitInformationTagsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EditOutfitInformationTagsProvider._internal(
        (ref) => create(ref as EditOutfitInformationTagsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        updatedTags: updatedTags,
        outfitId: outfitId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Result> createElement() {
    return _EditOutfitInformationTagsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EditOutfitInformationTagsProvider &&
        other.updatedTags == updatedTags &&
        other.outfitId == outfitId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, updatedTags.hashCode);
    hash = _SystemHash.combine(hash, outfitId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EditOutfitInformationTagsRef on AutoDisposeFutureProviderRef<Result> {
  /// The parameter `updatedTags` of this provider.
  List<String> get updatedTags;

  /// The parameter `outfitId` of this provider.
  int get outfitId;
}

class _EditOutfitInformationTagsProviderElement
    extends AutoDisposeFutureProviderElement<Result>
    with EditOutfitInformationTagsRef {
  _EditOutfitInformationTagsProviderElement(super.provider);

  @override
  List<String> get updatedTags =>
      (origin as EditOutfitInformationTagsProvider).updatedTags;
  @override
  int get outfitId => (origin as EditOutfitInformationTagsProvider).outfitId;
}

String _$editOutfitInformationSeasonHash() =>
    r'a1e2aac5de91775d22c6a8b86d2dbc92c6b5636d';

/// See also [editOutfitInformationSeason].
@ProviderFor(editOutfitInformationSeason)
const editOutfitInformationSeasonProvider = EditOutfitInformationSeasonFamily();

/// See also [editOutfitInformationSeason].
class EditOutfitInformationSeasonFamily extends Family<AsyncValue<Result>> {
  /// See also [editOutfitInformationSeason].
  const EditOutfitInformationSeasonFamily();

  /// See also [editOutfitInformationSeason].
  EditOutfitInformationSeasonProvider call(
    String season,
    int outfitId,
  ) {
    return EditOutfitInformationSeasonProvider(
      season,
      outfitId,
    );
  }

  @override
  EditOutfitInformationSeasonProvider getProviderOverride(
    covariant EditOutfitInformationSeasonProvider provider,
  ) {
    return call(
      provider.season,
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
  String? get name => r'editOutfitInformationSeasonProvider';
}

/// See also [editOutfitInformationSeason].
class EditOutfitInformationSeasonProvider
    extends AutoDisposeFutureProvider<Result> {
  /// See also [editOutfitInformationSeason].
  EditOutfitInformationSeasonProvider(
    String season,
    int outfitId,
  ) : this._internal(
          (ref) => editOutfitInformationSeason(
            ref as EditOutfitInformationSeasonRef,
            season,
            outfitId,
          ),
          from: editOutfitInformationSeasonProvider,
          name: r'editOutfitInformationSeasonProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editOutfitInformationSeasonHash,
          dependencies: EditOutfitInformationSeasonFamily._dependencies,
          allTransitiveDependencies:
              EditOutfitInformationSeasonFamily._allTransitiveDependencies,
          season: season,
          outfitId: outfitId,
        );

  EditOutfitInformationSeasonProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.season,
    required this.outfitId,
  }) : super.internal();

  final String season;
  final int outfitId;

  @override
  Override overrideWith(
    FutureOr<Result> Function(EditOutfitInformationSeasonRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EditOutfitInformationSeasonProvider._internal(
        (ref) => create(ref as EditOutfitInformationSeasonRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        season: season,
        outfitId: outfitId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Result> createElement() {
    return _EditOutfitInformationSeasonProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EditOutfitInformationSeasonProvider &&
        other.season == season &&
        other.outfitId == outfitId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, season.hashCode);
    hash = _SystemHash.combine(hash, outfitId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EditOutfitInformationSeasonRef on AutoDisposeFutureProviderRef<Result> {
  /// The parameter `season` of this provider.
  String get season;

  /// The parameter `outfitId` of this provider.
  int get outfitId;
}

class _EditOutfitInformationSeasonProviderElement
    extends AutoDisposeFutureProviderElement<Result>
    with EditOutfitInformationSeasonRef {
  _EditOutfitInformationSeasonProviderElement(super.provider);

  @override
  String get season => (origin as EditOutfitInformationSeasonProvider).season;
  @override
  int get outfitId => (origin as EditOutfitInformationSeasonProvider).outfitId;
}

String _$getOutfitHash() => r'c9f35f1a38ad62e2743d3da3a54c1fc849490170';

/// See also [getOutfit].
@ProviderFor(getOutfit)
const getOutfitProvider = GetOutfitFamily();

/// See also [getOutfit].
class GetOutfitFamily extends Family<AsyncValue<Outfit?>> {
  /// See also [getOutfit].
  const GetOutfitFamily();

  /// See also [getOutfit].
  GetOutfitProvider call(
    dynamic outfitId,
  ) {
    return GetOutfitProvider(
      outfitId,
    );
  }

  @override
  GetOutfitProvider getProviderOverride(
    covariant GetOutfitProvider provider,
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
  String? get name => r'getOutfitProvider';
}

/// See also [getOutfit].
class GetOutfitProvider extends AutoDisposeFutureProvider<Outfit?> {
  /// See also [getOutfit].
  GetOutfitProvider(
    dynamic outfitId,
  ) : this._internal(
          (ref) => getOutfit(
            ref as GetOutfitRef,
            outfitId,
          ),
          from: getOutfitProvider,
          name: r'getOutfitProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getOutfitHash,
          dependencies: GetOutfitFamily._dependencies,
          allTransitiveDependencies: GetOutfitFamily._allTransitiveDependencies,
          outfitId: outfitId,
        );

  GetOutfitProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.outfitId,
  }) : super.internal();

  final dynamic outfitId;

  @override
  Override overrideWith(
    FutureOr<Outfit?> Function(GetOutfitRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetOutfitProvider._internal(
        (ref) => create(ref as GetOutfitRef),
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
  AutoDisposeFutureProviderElement<Outfit?> createElement() {
    return _GetOutfitProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetOutfitProvider && other.outfitId == outfitId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, outfitId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetOutfitRef on AutoDisposeFutureProviderRef<Outfit?> {
  /// The parameter `outfitId` of this provider.
  dynamic get outfitId;
}

class _GetOutfitProviderElement
    extends AutoDisposeFutureProviderElement<Outfit?> with GetOutfitRef {
  _GetOutfitProviderElement(super.provider);

  @override
  dynamic get outfitId => (origin as GetOutfitProvider).outfitId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
