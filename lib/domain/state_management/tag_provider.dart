import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repository/tag_repository.dart';
import '../../main.dart';
import '../../model/tag.dart';

part 'tag_provider.g.dart';

@riverpod
TagRepository tagRepository(TagRepositoryRef ref) {
  return TagRepository();
}

@riverpod
Stream<List<Tag>> userTagsListStream(UserTagsListStreamRef ref) {
  return ref.watch(tagRepositoryProvider).getUserTagsStream();
}

@riverpod
Future<List<Tag>> getDefaultTagsList(GetDefaultTagsListRef ref) async {
  final repository = ref.read(tagRepositoryProvider);
  try {
    return await repository.getFullListOfTags();
  } catch (e) {
    return [];
  }
}
