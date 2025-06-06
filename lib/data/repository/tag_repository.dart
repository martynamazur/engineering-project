import 'dart:developer' as developer;

import '../../main.dart';
import '../../model/tag.dart';
import '../../utils/log.dart';

class TagRepository {
  late final String _userId;

  TagRepository() {
    _initialize();
  }

  Future<void> _initialize() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception('User not logged in');
    }
    _userId = user.id;
  }


  Future<List<Tag>> getFullListOfTags() async {
    try {
      final response = await supabase.from('default_tags').select('*');
      final List<Tag> tags = response.map((json) => Tag.fromJson(json)).toList();
      return tags;

    } catch (e,stack) {
      logger.i('Error while getting full tag list: $e\n$stack');
      return [];
    }
  }


  Stream<List<Tag>> getUserTagsStream() {
      return supabase
          .from('user_tags')
          .stream(primaryKey: ['id'])
          .eq('id', _userId)
          .map((data) => data.map((json) => Tag.fromJson(json)).toList());
  }
}
