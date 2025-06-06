// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clothes_folder_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clothesFolderRepositoryHash() =>
    r'9e91bb60582f984f7bf447f93e1ab4cc779e496d';

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
    r'26c4a442dac5ccd402920ade666733ddb1ae4bf8';

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
String _$getClosetFolderHash() => r'a3c510ebfa82b8b25febebca26a9234aa5635091';

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
String _$getFolderHash() => r'5d750927f4a7de24dbfc861374be4ddf0d2ca22a';

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
    r'8f9362d3fe1ba289014a4453199735775158b855';

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
String _$deleteFolderHash() => r'14968095629cdd9cb77a0d2e9a18cdeb53718e77';

/// See also [deleteFolder].
@ProviderFor(deleteFolder)
const deleteFolderProvider = DeleteFolderFamily();

/// See also [deleteFolder].
class DeleteFolderFamily extends Family<AsyncValue<Result>> {
  /// See also [deleteFolder].
  const DeleteFolderFamily();

  /// See also [deleteFolder].
  DeleteFolderProvider call({
    required int folderId,
  }) {
    return DeleteFolderProvider(
      folderId: folderId,
    );
  }

  @override
  DeleteFolderProvider getProviderOverride(
    covariant DeleteFolderProvider provider,
  ) {
    return call(
      folderId: provider.folderId,
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
class DeleteFolderProvider extends AutoDisposeFutureProvider<Result> {
  /// See also [deleteFolder].
  DeleteFolderProvider({
    required int folderId,
  }) : this._internal(
          (ref) => deleteFolder(
            ref as DeleteFolderRef,
            folderId: folderId,
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
    FutureOr<Result> Function(DeleteFolderRef provider) create,
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
  AutoDisposeFutureProviderElement<Result> createElement() {
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

mixin DeleteFolderRef on AutoDisposeFutureProviderRef<Result> {
  /// The parameter `folderId` of this provider.
  int get folderId;
}

class _DeleteFolderProviderElement
    extends AutoDisposeFutureProviderElement<Result> with DeleteFolderRef {
  _DeleteFolderProviderElement(super.provider);

  @override
  int get folderId => (origin as DeleteFolderProvider).folderId;
}

String _$changeFolderNameHash() => r'580b6804086e96bfab5b830e97ba2ee97c45c999';

/// See also [changeFolderName].
@ProviderFor(changeFolderName)
const changeFolderNameProvider = ChangeFolderNameFamily();

/// See also [changeFolderName].
class ChangeFolderNameFamily extends Family<AsyncValue<Result>> {
  /// See also [changeFolderName].
  const ChangeFolderNameFamily();

  /// See also [changeFolderName].
  ChangeFolderNameProvider call({
    required String newFolderName,
    required int folderId,
  }) {
    return ChangeFolderNameProvider(
      newFolderName: newFolderName,
      folderId: folderId,
    );
  }

  @override
  ChangeFolderNameProvider getProviderOverride(
    covariant ChangeFolderNameProvider provider,
  ) {
    return call(
      newFolderName: provider.newFolderName,
      folderId: provider.folderId,
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
class ChangeFolderNameProvider extends AutoDisposeFutureProvider<Result> {
  /// See also [changeFolderName].
  ChangeFolderNameProvider({
    required String newFolderName,
    required int folderId,
  }) : this._internal(
          (ref) => changeFolderName(
            ref as ChangeFolderNameRef,
            newFolderName: newFolderName,
            folderId: folderId,
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
    FutureOr<Result> Function(ChangeFolderNameRef provider) create,
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
  AutoDisposeFutureProviderElement<Result> createElement() {
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

mixin ChangeFolderNameRef on AutoDisposeFutureProviderRef<Result> {
  /// The parameter `newFolderName` of this provider.
  String get newFolderName;

  /// The parameter `folderId` of this provider.
  int get folderId;
}

class _ChangeFolderNameProviderElement
    extends AutoDisposeFutureProviderElement<Result> with ChangeFolderNameRef {
  _ChangeFolderNameProviderElement(super.provider);

  @override
  String get newFolderName =>
      (origin as ChangeFolderNameProvider).newFolderName;
  @override
  int get folderId => (origin as ChangeFolderNameProvider).folderId;
}

String _$createNewFolderHash() => r'84f988bf74e527189c89db5d9b98e34b76f50716';

/// See also [createNewFolder].
@ProviderFor(createNewFolder)
const createNewFolderProvider = CreateNewFolderFamily();

/// See also [createNewFolder].
class CreateNewFolderFamily extends Family<AsyncValue<ClosetFolder>> {
  /// See also [createNewFolder].
  const CreateNewFolderFamily();

  /// See also [createNewFolder].
  CreateNewFolderProvider call({
    required String folderName,
  }) {
    return CreateNewFolderProvider(
      folderName: folderName,
    );
  }

  @override
  CreateNewFolderProvider getProviderOverride(
    covariant CreateNewFolderProvider provider,
  ) {
    return call(
      folderName: provider.folderName,
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
class CreateNewFolderProvider extends AutoDisposeFutureProvider<ClosetFolder> {
  /// See also [createNewFolder].
  CreateNewFolderProvider({
    required String folderName,
  }) : this._internal(
          (ref) => createNewFolder(
            ref as CreateNewFolderRef,
            folderName: folderName,
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
    FutureOr<ClosetFolder> Function(CreateNewFolderRef provider) create,
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
  AutoDisposeFutureProviderElement<ClosetFolder> createElement() {
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

mixin CreateNewFolderRef on AutoDisposeFutureProviderRef<ClosetFolder> {
  /// The parameter `folderName` of this provider.
  String get folderName;
}

class _CreateNewFolderProviderElement
    extends AutoDisposeFutureProviderElement<ClosetFolder>
    with CreateNewFolderRef {
  _CreateNewFolderProviderElement(super.provider);

  @override
  String get folderName => (origin as CreateNewFolderProvider).folderName;
}

String _$addClothesToFolderHash() =>
    r'2a26b4b5a46f291a6b5b429aea778afcef400007';

/// See also [addClothesToFolder].
@ProviderFor(addClothesToFolder)
const addClothesToFolderProvider = AddClothesToFolderFamily();

/// See also [addClothesToFolder].
class AddClothesToFolderFamily extends Family<AsyncValue<Result>> {
  /// See also [addClothesToFolder].
  const AddClothesToFolderFamily();

  /// See also [addClothesToFolder].
  AddClothesToFolderProvider call({
    required List<int> clothesId,
    required int folderId,
  }) {
    return AddClothesToFolderProvider(
      clothesId: clothesId,
      folderId: folderId,
    );
  }

  @override
  AddClothesToFolderProvider getProviderOverride(
    covariant AddClothesToFolderProvider provider,
  ) {
    return call(
      clothesId: provider.clothesId,
      folderId: provider.folderId,
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
class AddClothesToFolderProvider extends AutoDisposeFutureProvider<Result> {
  /// See also [addClothesToFolder].
  AddClothesToFolderProvider({
    required List<int> clothesId,
    required int folderId,
  }) : this._internal(
          (ref) => addClothesToFolder(
            ref as AddClothesToFolderRef,
            clothesId: clothesId,
            folderId: folderId,
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
    FutureOr<Result> Function(AddClothesToFolderRef provider) create,
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
  AutoDisposeFutureProviderElement<Result> createElement() {
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

mixin AddClothesToFolderRef on AutoDisposeFutureProviderRef<Result> {
  /// The parameter `clothesId` of this provider.
  List<int> get clothesId;

  /// The parameter `folderId` of this provider.
  int get folderId;
}

class _AddClothesToFolderProviderElement
    extends AutoDisposeFutureProviderElement<Result>
    with AddClothesToFolderRef {
  _AddClothesToFolderProviderElement(super.provider);

  @override
  List<int> get clothesId => (origin as AddClothesToFolderProvider).clothesId;
  @override
  int get folderId => (origin as AddClothesToFolderProvider).folderId;
}

String _$getAllClothesHash() => r'dfb65ef21eafcfc19e662308f6f947d3e9b53970';

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
String _$removeClothingItemFromFolderHash() =>
    r'deece50eb839cb9c3cc236c4a0b62c97eddfc14e';

/// See also [removeClothingItemFromFolder].
@ProviderFor(removeClothingItemFromFolder)
const removeClothingItemFromFolderProvider =
    RemoveClothingItemFromFolderFamily();

/// See also [removeClothingItemFromFolder].
class RemoveClothingItemFromFolderFamily extends Family<AsyncValue<Result>> {
  /// See also [removeClothingItemFromFolder].
  const RemoveClothingItemFromFolderFamily();

  /// See also [removeClothingItemFromFolder].
  RemoveClothingItemFromFolderProvider call({
    required int folderId,
    required int clothingItemId,
  }) {
    return RemoveClothingItemFromFolderProvider(
      folderId: folderId,
      clothingItemId: clothingItemId,
    );
  }

  @override
  RemoveClothingItemFromFolderProvider getProviderOverride(
    covariant RemoveClothingItemFromFolderProvider provider,
  ) {
    return call(
      folderId: provider.folderId,
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
  String? get name => r'removeClothingItemFromFolderProvider';
}

/// See also [removeClothingItemFromFolder].
class RemoveClothingItemFromFolderProvider
    extends AutoDisposeFutureProvider<Result> {
  /// See also [removeClothingItemFromFolder].
  RemoveClothingItemFromFolderProvider({
    required int folderId,
    required int clothingItemId,
  }) : this._internal(
          (ref) => removeClothingItemFromFolder(
            ref as RemoveClothingItemFromFolderRef,
            folderId: folderId,
            clothingItemId: clothingItemId,
          ),
          from: removeClothingItemFromFolderProvider,
          name: r'removeClothingItemFromFolderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$removeClothingItemFromFolderHash,
          dependencies: RemoveClothingItemFromFolderFamily._dependencies,
          allTransitiveDependencies:
              RemoveClothingItemFromFolderFamily._allTransitiveDependencies,
          folderId: folderId,
          clothingItemId: clothingItemId,
        );

  RemoveClothingItemFromFolderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.folderId,
    required this.clothingItemId,
  }) : super.internal();

  final int folderId;
  final int clothingItemId;

  @override
  Override overrideWith(
    FutureOr<Result> Function(RemoveClothingItemFromFolderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RemoveClothingItemFromFolderProvider._internal(
        (ref) => create(ref as RemoveClothingItemFromFolderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        folderId: folderId,
        clothingItemId: clothingItemId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Result> createElement() {
    return _RemoveClothingItemFromFolderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RemoveClothingItemFromFolderProvider &&
        other.folderId == folderId &&
        other.clothingItemId == clothingItemId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, folderId.hashCode);
    hash = _SystemHash.combine(hash, clothingItemId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RemoveClothingItemFromFolderRef on AutoDisposeFutureProviderRef<Result> {
  /// The parameter `folderId` of this provider.
  int get folderId;

  /// The parameter `clothingItemId` of this provider.
  int get clothingItemId;
}

class _RemoveClothingItemFromFolderProviderElement
    extends AutoDisposeFutureProviderElement<Result>
    with RemoveClothingItemFromFolderRef {
  _RemoveClothingItemFromFolderProviderElement(super.provider);

  @override
  int get folderId => (origin as RemoveClothingItemFromFolderProvider).folderId;
  @override
  int get clothingItemId =>
      (origin as RemoveClothingItemFromFolderProvider).clothingItemId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
