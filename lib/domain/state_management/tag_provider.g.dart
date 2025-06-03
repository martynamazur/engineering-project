// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tagRepositoryHash() => r'ddb639249f7f7dd6c818f95fce09bf83e744d46e';

/// See also [tagRepository].
@ProviderFor(tagRepository)
final tagRepositoryProvider = AutoDisposeProvider<TagRepository>.internal(
  tagRepository,
  name: r'tagRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tagRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TagRepositoryRef = AutoDisposeProviderRef<TagRepository>;
String _$userTagsListStreamHash() =>
    r'1997851feacaa5129cb711eabce7b28da5710ce1';

/// See also [userTagsListStream].
@ProviderFor(userTagsListStream)
final userTagsListStreamProvider =
    AutoDisposeStreamProvider<List<Tag>>.internal(
  userTagsListStream,
  name: r'userTagsListStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userTagsListStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserTagsListStreamRef = AutoDisposeStreamProviderRef<List<Tag>>;
String _$getDefaultTagsListHash() =>
    r'761007bc2acc6870202f85e2def43797f7a1ef5c';

/// See also [getDefaultTagsList].
@ProviderFor(getDefaultTagsList)
final getDefaultTagsListProvider =
    AutoDisposeFutureProvider<List<Tag>>.internal(
  getDefaultTagsList,
  name: r'getDefaultTagsListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getDefaultTagsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetDefaultTagsListRef = AutoDisposeFutureProviderRef<List<Tag>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
