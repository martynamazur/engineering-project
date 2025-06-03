// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clothes_category_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clothesCategoryRepositoryHash() =>
    r'a1505ee4a95723f74140ca2bccf6e2189ab0bfa7';

/// See also [clothesCategoryRepository].
@ProviderFor(clothesCategoryRepository)
final clothesCategoryRepositoryProvider =
    AutoDisposeProvider<ClothesCategoryRepository>.internal(
  clothesCategoryRepository,
  name: r'clothesCategoryRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$clothesCategoryRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ClothesCategoryRepositoryRef
    = AutoDisposeProviderRef<ClothesCategoryRepository>;
String _$getClothesCategoryHash() =>
    r'75b279f4975d55bdc1483bb6e600053186bc1803';

/// See also [getClothesCategory].
@ProviderFor(getClothesCategory)
final getClothesCategoryProvider =
    AutoDisposeFutureProvider<List<ClothesCategory>>.internal(
  getClothesCategory,
  name: r'getClothesCategoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getClothesCategoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetClothesCategoryRef
    = AutoDisposeFutureProviderRef<List<ClothesCategory>>;
String _$getCategoryClothingItemHash() =>
    r'f7277e734d2db82caae4c891e19e95f63eacb0ae';

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

/// See also [getCategoryClothingItem].
@ProviderFor(getCategoryClothingItem)
const getCategoryClothingItemProvider = GetCategoryClothingItemFamily();

/// See also [getCategoryClothingItem].
class GetCategoryClothingItemFamily
    extends Family<AsyncValue<List<ClothingItem>>> {
  /// See also [getCategoryClothingItem].
  const GetCategoryClothingItemFamily();

  /// See also [getCategoryClothingItem].
  GetCategoryClothingItemProvider call({
    required int categoryId,
  }) {
    return GetCategoryClothingItemProvider(
      categoryId: categoryId,
    );
  }

  @override
  GetCategoryClothingItemProvider getProviderOverride(
    covariant GetCategoryClothingItemProvider provider,
  ) {
    return call(
      categoryId: provider.categoryId,
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
  String? get name => r'getCategoryClothingItemProvider';
}

/// See also [getCategoryClothingItem].
class GetCategoryClothingItemProvider
    extends AutoDisposeFutureProvider<List<ClothingItem>> {
  /// See also [getCategoryClothingItem].
  GetCategoryClothingItemProvider({
    required int categoryId,
  }) : this._internal(
          (ref) => getCategoryClothingItem(
            ref as GetCategoryClothingItemRef,
            categoryId: categoryId,
          ),
          from: getCategoryClothingItemProvider,
          name: r'getCategoryClothingItemProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCategoryClothingItemHash,
          dependencies: GetCategoryClothingItemFamily._dependencies,
          allTransitiveDependencies:
              GetCategoryClothingItemFamily._allTransitiveDependencies,
          categoryId: categoryId,
        );

  GetCategoryClothingItemProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
  }) : super.internal();

  final int categoryId;

  @override
  Override overrideWith(
    FutureOr<List<ClothingItem>> Function(GetCategoryClothingItemRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCategoryClothingItemProvider._internal(
        (ref) => create(ref as GetCategoryClothingItemRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ClothingItem>> createElement() {
    return _GetCategoryClothingItemProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCategoryClothingItemProvider &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetCategoryClothingItemRef
    on AutoDisposeFutureProviderRef<List<ClothingItem>> {
  /// The parameter `categoryId` of this provider.
  int get categoryId;
}

class _GetCategoryClothingItemProviderElement
    extends AutoDisposeFutureProviderElement<List<ClothingItem>>
    with GetCategoryClothingItemRef {
  _GetCategoryClothingItemProviderElement(super.provider);

  @override
  int get categoryId => (origin as GetCategoryClothingItemProvider).categoryId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
