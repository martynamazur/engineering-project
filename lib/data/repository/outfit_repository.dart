
import 'package:ootd/main.dart';
import 'package:ootd/model/outfit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../model/result.dart';
import '../../utils/log.dart';

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

  Future<Result> saveOutfitToDatabase(String imageUrl, List<int> clothingItemId) async{

    try{
      final season = 'all';
      await supabase.from('outfit').insert({
        'useditemsids':clothingItemId,
        'image_url' : imageUrl,
        'season': season,
        'user_uuid' :_userId
      });
      return Result.success();
    } catch (e, stack) {
      logger.i('Error saving ootd to db: $e\n$stack');
      return Result.failure('sth went wrong');
    }
  }

  Future<Result> removeOutfit(int outfitId) async{
    try{
      await supabase
          .from('outfit')
          .delete()
          .eq('id', outfitId);

      return Result.success();
    }catch (e, stack) {
      logger.i('Error removing ootd db: $e\n$stack');
      return Result.failure('sth went wrong');
    }
  }
  
  Future<Result> editOutfitInformation(List<String> tags, String season, int outfitId) async{
    try{
      supabase.from('outfit').update({'user_tags': tags}).eq('id', outfitId);
      supabase.from('outfit').update({'season': season}).eq('id', outfitId);
      return Result.success();
    }catch(e, stack){
      logger.i('Error editing ootd inf to db: $e\n$stack');

      return Result.failure('sth went wrong');
    }
  }

  Future<Result> editOutfitInformationTags(List<String> tags, int outfitId) async{
    try{
      await supabase
          .from('outfit')
          .update({'user_tags': tags})
          .eq('id', outfitId);

      return Result.success();
    }catch(e,stack){
      logger.i('Error editing ootd tags: $e\n$stack');
      return Result.failure('sth went wrong');
    }
  }

  Future<Result> editOutfitInformationSeason(String season, int outfitId) async{
    try{
      await supabase
          .from('outfit')
          .update({'season': season})
          .eq('id', outfitId);

      return Result.success();
    }catch(e,stack){
      logger.i('Error editing ootd season list: $e\n$stack');
      return Result.failure('sth went wrong');
    }
  }

  Future<Outfit?> getOutfit(int outfitId) async {
    try {
      final response = await supabase
          .from('outfit')
          .select()
          .eq('id', outfitId)
          .single() ;

      return Outfit.fromJson(response);
    } catch (e,stack) {
      logger.i('Error get outfit : $e\n$stack');
      return null;
    }
  }
}


