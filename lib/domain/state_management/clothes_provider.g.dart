// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clothes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clothesRepositoryHash() => r'48b2c60791ffd3f3691a8c48158c10c223644b87';

/// See also [clothesRepository].
@ProviderFor(clothesRepository)
final clothesRepositoryProvider =
    AutoDisposeProvider<ClothesRepository>.internal(
  clothesRepository,
  name: r'clothesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$clothesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ClothesRepositoryRef = AutoDisposeProviderRef<ClothesRepository>;
String _$deleteClothingItemHash() =>
    r'98b780e3aaabe7395684ce713dbb4ceec85172ba';

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

/// See also [deleteClothingItem].
@ProviderFor(deleteClothingItem)
const deleteClothingItemProvider = DeleteClothingItemFamily();

/// See also [deleteClothingItem].
class DeleteClothingItemFamily extends Family<AsyncValue<void>> {
  /// See also [deleteClothingItem].
  const DeleteClothingItemFamily();

  /// See also [deleteClothingItem].
  DeleteClothingItemProvider call(
    int clothingItemId,
  ) {
    return DeleteClothingItemProvider(
      clothingItemId,
    );
  }

  @override
  DeleteClothingItemProvider getProviderOverride(
    covariant DeleteClothingItemProvider provider,
  ) {
    return call(
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
  String? get name => r'deleteClothingItemProvider';
}

/// See also [deleteClothingItem].
class DeleteClothingItemProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteClothingItem].
  DeleteClothingItemProvider(
    int clothingItemId,
  ) : this._internal(
          (ref) => deleteClothingItem(
            ref as DeleteClothingItemRef,
            clothingItemId,
          ),
          from: deleteClothingItemProvider,
          name: r'deleteClothingItemProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteClothingItemHash,
          dependencies: DeleteClothingItemFamily._dependencies,
          allTransitiveDependencies:
              DeleteClothingItemFamily._allTransitiveDependencies,
          clothingItemId: clothingItemId,
        );

  DeleteClothingItemProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.clothingItemId,
  }) : super.internal();

  final int clothingItemId;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteClothingItemRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteClothingItemProvider._internal(
        (ref) => create(ref as DeleteClothingItemRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        clothingItemId: clothingItemId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteClothingItemProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteClothingItemProvider &&
        other.clothingItemId == clothingItemId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, clothingItemId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteClothingItemRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `clothingItemId` of this provider.
  int get clothingItemId;
}

class _DeleteClothingItemProviderElement
    extends AutoDisposeFutureProviderElement<void> with DeleteClothingItemRef {
  _DeleteClothingItemProviderElement(super.provider);

  @override
  int get clothingItemId =>
      (origin as DeleteClothingItemProvider).clothingItemId;
}

String _$addNewClothingItemHash() =>
    r'bcff0686dbb3b86ef2e13691e55cfaa67b1f955c';

/// See also [addNewClothingItem].
@ProviderFor(addNewClothingItem)
const addNewClothingItemProvider = AddNewClothingItemFamily();

/// See also [addNewClothingItem].
class AddNewClothingItemFamily extends Family<AsyncValue<void>> {
  /// See also [addNewClothingItem].
  const AddNewClothingItemFamily();

  /// See also [addNewClothingItem].
  AddNewClothingItemProvider call(
    ClothingItem newClothingItem,
  ) {
    return AddNewClothingItemProvider(
      newClothingItem,
    );
  }

  @override
  AddNewClothingItemProvider getProviderOverride(
    covariant AddNewClothingItemProvider provider,
  ) {
    return call(
      provider.newClothingItem,
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
  String? get name => r'addNewClothingItemProvider';
}

/// See also [addNewClothingItem].
class AddNewClothingItemProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addNewClothingItem].
  AddNewClothingItemProvider(
    ClothingItem newClothingItem,
  ) : this._internal(
          (ref) => addNewClothingItem(
            ref as AddNewClothingItemRef,
            newClothingItem,
          ),
          from: addNewClothingItemProvider,
          name: r'addNewClothingItemProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addNewClothingItemHash,
          dependencies: AddNewClothingItemFamily._dependencies,
          allTransitiveDependencies:
              AddNewClothingItemFamily._allTransitiveDependencies,
          newClothingItem: newClothingItem,
        );

  AddNewClothingItemProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.newClothingItem,
  }) : super.internal();

  final ClothingItem newClothingItem;

  @override
  Override overrideWith(
    FutureOr<void> Function(AddNewClothingItemRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddNewClothingItemProvider._internal(
        (ref) => create(ref as AddNewClothingItemRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        newClothingItem: newClothingItem,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AddNewClothingItemProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddNewClothingItemProvider &&
        other.newClothingItem == newClothingItem;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, newClothingItem.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddNewClothingItemRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `newClothingItem` of this provider.
  ClothingItem get newClothingItem;
}

class _AddNewClothingItemProviderElement
    extends AutoDisposeFutureProviderElement<void> with AddNewClothingItemRef {
  _AddNewClothingItemProviderElement(super.provider);

  @override
  ClothingItem get newClothingItem =>
      (origin as AddNewClothingItemProvider).newClothingItem;
}

String _$countClothesHash() => r'77996419fedccf2f76139d3eae435f35b25d2b2c';

/// See also [countClothes].
@ProviderFor(countClothes)
final countClothesProvider = AutoDisposeFutureProvider<int>.internal(
  countClothes,
  name: r'countClothesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$countClothesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CountClothesRef = AutoDisposeFutureProviderRef<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
