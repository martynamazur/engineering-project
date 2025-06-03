import 'dart:async';

import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repository/tag_repository.dart';
import '../../main.dart';
import '../../model/tag.dart';

part 'tag_provider.g.dart';

@riverpod
TagRepository tagRepository(Ref ref) {
  return TagRepository();
}

@riverpod
Stream<List<Tag>> userTagsListStream(Ref ref) {
  return ref.watch(tagRepositoryProvider).getUserTagsStream();
}

@riverpod
Future<List<Tag>> getDefaultTagsList(Ref ref) async {
  final repository = ref.read(tagRepositoryProvider);
  try {
    return await repository.getFullListOfTags();
  } catch (e) {
    return [];
  }
}
