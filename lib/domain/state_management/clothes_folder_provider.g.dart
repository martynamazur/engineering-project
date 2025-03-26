// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clothes_folder_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clothesFolderRepositoryHash() =>
    r'0a94382dda2c4cbe13603b2695754ce401283594';

/// See also [clothesFolderRepository].
@ProviderFor(clothesFolderRepository)
final clothesFolderRepositoryProvider =
    AutoDisposeProvider<ClothesFolderRepository>.internal(
  clothesFolderRepository,
  name: r'clothesFolderRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$clothesFolderRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ClothesFolderRepositoryRef
    = AutoDisposeProviderRef<ClothesFolderRepository>;
String _$folderListNotifierHash() =>
    r'4e721cb99fce69c8a457d6e6d6a293fdc6254f6a';

/// See also [folderListNotifier].
@ProviderFor(folderListNotifier)
final folderListNotifierProvider =
    AutoDisposeProvider<FolderListNotifier>.internal(
  folderListNotifier,
  name: r'folderListNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$folderListNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FolderListNotifierRef = AutoDisposeProviderRef<FolderListNotifier>;
String _$getClosetFolderHash() => r'c4d1deb7ae03a567405419bd306736cb26a91d81';

/// See also [getClosetFolder].
@ProviderFor(getClosetFolder)
final getClosetFolderProvider =
    AutoDisposeFutureProvider<List<ClosetFolder>>.internal(
  getClosetFolder,
  name: r'getClosetFolderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getClosetFolderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetClosetFolderRef = AutoDisposeFutureProviderRef<List<ClosetFolder>>;
String _$getFolderHash() => r'76928038dc386b02267a8a82056d1c65c86cb6a4';

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

/// See also [getFolder].
@ProviderFor(getFolder)
const getFolderProvider = GetFolderFamily();

/// See also [getFolder].
class GetFolderFamily extends Family<AsyncValue<ClosetFolder>> {
  /// See also [getFolder].
  const GetFolderFamily();

  /// See also [getFolder].
  GetFolderProvider call(
    int id,
  ) {
    return GetFolderProvider(
      id,
    );
  }

  @override
  GetFolderProvider getProviderOverride(
    covariant GetFolderProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'getFolderProvider';
}

/// See also [getFolder].
class GetFolderProvider extends AutoDisposeFutureProvider<ClosetFolder> {
  /// See also [getFolder].
  GetFolderProvider(
    int id,
  ) : this._internal(
          (ref) => getFolder(
            ref as GetFolderRef,
            id,
          ),
          from: getFolderProvider,
          name: r'getFolderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getFolderHash,
          dependencies: GetFolderFamily._dependencies,
          allTransitiveDependencies: GetFolderFamily._allTransitiveDependencies,
          id: id,
        );

  GetFolderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<ClosetFolder> Function(GetFolderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetFolderProvider._internal(
        (ref) => create(ref as GetFolderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ClosetFolder> createElement() {
    return _GetFolderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetFolderProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetFolderRef on AutoDisposeFutureProviderRef<ClosetFolder> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GetFolderProviderElement
    extends AutoDisposeFutureProviderElement<ClosetFolder> with GetFolderRef {
  _GetFolderProviderElement(super.provider);

  @override
  int get id => (origin as GetFolderProvider).id;
}

String _$clothesListNotifierHash() =>
    r'd3f7ae1c30ba4687e2286b2e3673cc17dab9c77e';

/// See also [clothesListNotifier].
@ProviderFor(clothesListNotifier)
final clothesListNotifierProvider =
    AutoDisposeProvider<ClothesListNotifier>.internal(
  clothesListNotifier,
  name: r'clothesListNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$clothesListNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ClothesListNotifierRef = AutoDisposeProviderRef<ClothesListNotifier>;
String _$deleteFolderHash() => r'a04b63c0fe14bbec345ff89b89c5a1b51e2201bd';

/// See also [deleteFolder].
@ProviderFor(deleteFolder)
const deleteFolderProvider = DeleteFolderFamily();

/// See also [deleteFolder].
class DeleteFolderFamily extends Family<AsyncValue<void>> {
  /// See also [deleteFolder].
  const DeleteFolderFamily();

  /// See also [deleteFolder].
  DeleteFolderProvider call(
    int folderId,
  ) {
    return DeleteFolderProvider(
      folderId,
    );
  }

  @override
  DeleteFolderProvider getProviderOverride(
    covariant DeleteFolderProvider provider,
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
  String? get name => r'deleteFolderProvider';
}

/// See also [deleteFolder].
class DeleteFolderProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteFolder].
  DeleteFolderProvider(
    int folderId,
  ) : this._internal(
          (ref) => deleteFolder(
            ref as DeleteFolderRef,
            folderId,
          ),
          from: deleteFolderProvider,
          name: r'deleteFolderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteFolderHash,
          dependencies: DeleteFolderFamily._dependencies,
          allTransitiveDependencies:
              DeleteFolderFamily._allTransitiveDependencies,
          folderId: folderId,
        );

  DeleteFolderProvider._internal(
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
  Override overrideWith(
    FutureOr<void> Function(DeleteFolderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteFolderProvider._internal(
        (ref) => create(ref as DeleteFolderRef),
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteFolderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteFolderProvider && other.folderId == folderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, folderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteFolderRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `folderId` of this provider.
  int get folderId;
}

class _DeleteFolderProviderElement
    extends AutoDisposeFutureProviderElement<void> with DeleteFolderRef {
  _DeleteFolderProviderElement(super.provider);

  @override
  int get folderId => (origin as DeleteFolderProvider).folderId;
}

String _$changeFolderNameHash() => r'd3c2c329f5194edd7b06f7c426085e3e4c2d2704';

/// See also [changeFolderName].
@ProviderFor(changeFolderName)
const changeFolderNameProvider = ChangeFolderNameFamily();

/// See also [changeFolderName].
class ChangeFolderNameFamily extends Family<AsyncValue<void>> {
  /// See also [changeFolderName].
  const ChangeFolderNameFamily();

  /// See also [changeFolderName].
  ChangeFolderNameProvider call(
    String newFolderName,
    int folderId,
  ) {
    return ChangeFolderNameProvider(
      newFolderName,
      folderId,
    );
  }

  @override
  ChangeFolderNameProvider getProviderOverride(
    covariant ChangeFolderNameProvider provider,
  ) {
    return call(
      provider.newFolderName,
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
  String? get name => r'changeFolderNameProvider';
}

/// See also [changeFolderName].
class ChangeFolderNameProvider extends AutoDisposeFutureProvider<void> {
  /// See also [changeFolderName].
  ChangeFolderNameProvider(
    String newFolderName,
    int folderId,
  ) : this._internal(
          (ref) => changeFolderName(
            ref as ChangeFolderNameRef,
            newFolderName,
            folderId,
          ),
          from: changeFolderNameProvider,
          name: r'changeFolderNameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$changeFolderNameHash,
          dependencies: ChangeFolderNameFamily._dependencies,
          allTransitiveDependencies:
              ChangeFolderNameFamily._allTransitiveDependencies,
          newFolderName: newFolderName,
          folderId: folderId,
        );

  ChangeFolderNameProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.newFolderName,
    required this.folderId,
  }) : super.internal();

  final String newFolderName;
  final int folderId;

  @override
  Override overrideWith(
    FutureOr<void> Function(ChangeFolderNameRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChangeFolderNameProvider._internal(
        (ref) => create(ref as ChangeFolderNameRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        newFolderName: newFolderName,
        folderId: folderId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ChangeFolderNameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChangeFolderNameProvider &&
        other.newFolderName == newFolderName &&
        other.folderId == folderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, newFolderName.hashCode);
    hash = _SystemHash.combine(hash, folderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChangeFolderNameRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `newFolderName` of this provider.
  String get newFolderName;

  /// The parameter `folderId` of this provider.
  int get folderId;
}

class _ChangeFolderNameProviderElement
    extends AutoDisposeFutureProviderElement<void> with ChangeFolderNameRef {
  _ChangeFolderNameProviderElement(super.provider);

  @override
  String get newFolderName =>
      (origin as ChangeFolderNameProvider).newFolderName;
  @override
  int get folderId => (origin as ChangeFolderNameProvider).folderId;
}

String _$createNewFolderHash() => r'b8e4856b7f5029a4c84963b6331e5431e3b3a46d';

/// See also [createNewFolder].
@ProviderFor(createNewFolder)
const createNewFolderProvider = CreateNewFolderFamily();

/// See also [createNewFolder].
class CreateNewFolderFamily extends Family<AsyncValue<void>> {
  /// See also [createNewFolder].
  const CreateNewFolderFamily();

  /// See also [createNewFolder].
  CreateNewFolderProvider call(
    String folderName,
  ) {
    return CreateNewFolderProvider(
      folderName,
    );
  }

  @override
  CreateNewFolderProvider getProviderOverride(
    covariant CreateNewFolderProvider provider,
  ) {
    return call(
      provider.folderName,
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
  String? get name => r'createNewFolderProvider';
}

/// See also [createNewFolder].
class CreateNewFolderProvider extends AutoDisposeFutureProvider<void> {
  /// See also [createNewFolder].
  CreateNewFolderProvider(
    String folderName,
  ) : this._internal(
          (ref) => createNewFolder(
            ref as CreateNewFolderRef,
            folderName,
          ),
          from: createNewFolderProvider,
          name: r'createNewFolderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createNewFolderHash,
          dependencies: CreateNewFolderFamily._dependencies,
          allTransitiveDependencies:
              CreateNewFolderFamily._allTransitiveDependencies,
          folderName: folderName,
        );

  CreateNewFolderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.folderName,
  }) : super.internal();

  final String folderName;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreateNewFolderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateNewFolderProvider._internal(
        (ref) => create(ref as CreateNewFolderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        folderName: folderName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CreateNewFolderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateNewFolderProvider && other.folderName == folderName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, folderName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateNewFolderRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `folderName` of this provider.
  String get folderName;
}

class _CreateNewFolderProviderElement
    extends AutoDisposeFutureProviderElement<void> with CreateNewFolderRef {
  _CreateNewFolderProviderElement(super.provider);

  @override
  String get folderName => (origin as CreateNewFolderProvider).folderName;
}

String _$addClothesToFolderHash() =>
    r'a3d9f175c2b715b7df35199475edebca4b5de28e';

/// See also [addClothesToFolder].
@ProviderFor(addClothesToFolder)
const addClothesToFolderProvider = AddClothesToFolderFamily();

/// See also [addClothesToFolder].
class AddClothesToFolderFamily extends Family<AsyncValue<void>> {
  /// See also [addClothesToFolder].
  const AddClothesToFolderFamily();

  /// See also [addClothesToFolder].
  AddClothesToFolderProvider call(
    List<int> clothesId,
    int folderId,
  ) {
    return AddClothesToFolderProvider(
      clothesId,
      folderId,
    );
  }

  @override
  AddClothesToFolderProvider getProviderOverride(
    covariant AddClothesToFolderProvider provider,
  ) {
    return call(
      provider.clothesId,
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
  String? get name => r'addClothesToFolderProvider';
}

/// See also [addClothesToFolder].
class AddClothesToFolderProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addClothesToFolder].
  AddClothesToFolderProvider(
    List<int> clothesId,
    int folderId,
  ) : this._internal(
          (ref) => addClothesToFolder(
            ref as AddClothesToFolderRef,
            clothesId,
            folderId,
          ),
          from: addClothesToFolderProvider,
          name: r'addClothesToFolderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addClothesToFolderHash,
          dependencies: AddClothesToFolderFamily._dependencies,
          allTransitiveDependencies:
              AddClothesToFolderFamily._allTransitiveDependencies,
          clothesId: clothesId,
          folderId: folderId,
        );

  AddClothesToFolderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.clothesId,
    required this.folderId,
  }) : super.internal();

  final List<int> clothesId;
  final int folderId;

  @override
  Override overrideWith(
    FutureOr<void> Function(AddClothesToFolderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddClothesToFolderProvider._internal(
        (ref) => create(ref as AddClothesToFolderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        clothesId: clothesId,
        folderId: folderId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AddClothesToFolderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddClothesToFolderProvider &&
        other.clothesId == clothesId &&
        other.folderId == folderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, clothesId.hashCode);
    hash = _SystemHash.combine(hash, folderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddClothesToFolderRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `clothesId` of this provider.
  List<int> get clothesId;

  /// The parameter `folderId` of this provider.
  int get folderId;
}

class _AddClothesToFolderProviderElement
    extends AutoDisposeFutureProviderElement<void> with AddClothesToFolderRef {
  _AddClothesToFolderProviderElement(super.provider);

  @override
  List<int> get clothesId => (origin as AddClothesToFolderProvider).clothesId;
  @override
  int get folderId => (origin as AddClothesToFolderProvider).folderId;
}

String _$getAllClothesHash() => r'f6367fa614b88c321588a5574118730d45eee32c';

/// See also [getAllClothes].
@ProviderFor(getAllClothes)
final getAllClothesProvider =
    AutoDisposeFutureProvider<List<ClothingItem>>.internal(
  getAllClothes,
  name: r'getAllClothesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAllClothesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAllClothesRef = AutoDisposeFutureProviderRef<List<ClothingItem>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
