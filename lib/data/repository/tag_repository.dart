import 'package:supabase_flutter/supabase_flutter.dart';
import '../../main.dart';
import '../../model/tag.dart';

class TagRepository {
  late final String _userId;

  TagRepository() {
    final user = supabase.auth.currentUser;
    _userId = user!.id;
  }

  Future<List<Tag>> getFullListOfTags() async {
    try {
      final response = await supabase.from('default_tags').select('*');

      final List<Tag> tags = response.map((json) => Tag.fromJson(json)).toList();

      print(tags);
      return tags;
    } catch (e) {
      print(e);
      return [];
    }
  }


  Stream<List<Tag>> getUserTagsStream() {
    try {
      return supabase
          .from('user_tags')
          .stream(primaryKey: ['id'])
          .eq('id', _userId)
          .map((data) => data.map((json) => Tag.fromJson(json)).toList());
    } catch (e) {
      return Stream.value([]);

    }
  }
}
