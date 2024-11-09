// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tagRepositoryHash() => r'200ad85dab16807e6582d5a635fe7d1a2389a40e';

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
    r'7e1bf444e3e410495524066ae0f9c9291a290caf';

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
    r'2ff6d35850e1c35bb819d7ba8bd76178f13e1f9a';

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
