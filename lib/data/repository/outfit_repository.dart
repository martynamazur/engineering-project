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
  
  Future<void> editOutfitInformation(List<String> tags, String season, int outfitId) async{
    try{
      supabase.from('outfit').update({'user_tags': tags}).eq('id', outfitId);
      supabase.from('outfit').update({'season': season}).eq('id', outfitId);
    }catch(e){
      print(e);
    }
  }

  Future<void> editOutfitInformationTags(List<String> tags, int outfitId) async{
    try{
      await supabase.from('outfit').update({'user_tags': tags}).eq('id', outfitId);

    }catch(e){
      print(e);
    }
  }

  Future<void> editOutfitInformationSeason(String season, int outfitId) async{
    try{
      await supabase.from('outfit').update({'season': season}).eq('id', outfitId);
    }catch(e){
      print(e);
    }
  }

  Future<Outfit> getOutfit(int outfitId) async {
    try {
      print('Jakie id $outfitId');
      // Fetch outfit data from Supabase
      final response = await supabase
          .from('outfit')
          .select()
          .eq('id', outfitId)
          .single() ;

      print('Response from Supabase: $response');


      return Outfit.fromJson(response);
    } catch (e) {
      print(e);
      throw Exception('Outfit not found');
    }
  }


}


