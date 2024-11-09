import 'package:ootd/main.dart';
import 'package:ootd/model/outfit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OutfitRepository {

  late final String _userId;

  OutfitRepository() {
    _initialize();
  }

  Future<void> _initialize() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception('User not logged in');
    }
    _userId = user.id;
  }

  Future<List<Outfit>> getOwnedOutfits() async {
    try {
      final response = await supabase.rpc(
          'get_outfits_by_user', params: {'p_user_id': _userId});
      final data = response as List<dynamic>;
      return data.map((item) => Outfit.fromJson(item)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<PostgrestResponse> saveOutfitToDatabase(String imageUrl, List<int> clothingItemId) async{

    try{
      final season = 'all';
      final response = await supabase.from('outfit').insert({
        'useditemsids':clothingItemId,
        'image_url' : imageUrl,
        'season': season,
        'user_uuid' :_userId
      });

      return response;

    } catch (e) {
      print(e);
      throw Exception('Failed to save outfit');
    }
  }

  Future<void> removeOutfit(int outfitId) async{
    try{
      await supabase.from('outfit').delete().eq('id', outfitId);

    }catch (e) {
      print(e);
      throw Exception('Failed to save outfit');
    }
  }

}