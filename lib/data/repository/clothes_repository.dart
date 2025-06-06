import 'package:ootd/main.dart';

import '../../model/clothing_item.dart';
import '../../model/result.dart';
import '../../utils/log.dart';

class ClothesRepository {

  late final String _userId;

  ClothesRepository() {
    _initialize();
  }

  Future<void> _initialize() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception('User not logged in');
    }
    _userId = user.id;
  }

  Future<Result> addClothingItem(ClothingItem clothingItem) async {
    try{
      final response = await supabase.from('clothingitem').insert({
        'item_photo' : clothingItem.itemPhoto,
        'item_category_id': clothingItem.itemCategoryId,
        'seasons' :  clothingItem.seasons?.map((season) => season.toString().split('.').last).toList(),
      }).select().maybeSingle();

      if (response != null) {
        int clothingItemId = response['clothing_item_id'];
        await supabase.rpc('add_clothing_to_user',
            params: {
              '_user_id': _userId,
              '_clothing_id': clothingItemId
        });

        await supabase.rpc('add_clothing_to_all_folder', params: {
          'p_user_id': _userId,
          'p_clothing_item_id': clothingItemId,
        });
      }
      return Result.success();

    }catch (e,stack) {
      logger.i('Error  addClothingItem: $e\n$stack');
      return Result.failure('Akcja sie nie powiodla');
    }

  }

  Future<Result> deleteClothingItem(int clothingItemId) async{
    try{
      await supabase.from('clothingitem').delete().eq('clothing_item_id', clothingItemId);
      return Result.success();
    }catch (e,stack) {
      logger.i('Error  deleteClothingItem: $e\n$stack');
      return Result.failure('Somethign went wrong');
  }
}

  Future<int> countClothes() async{
    try{

      final response = await supabase
          .from('user_clothing_items')
          .select('clothing_item_ids')
          .eq('user_id', _userId)
          .maybeSingle();

      if(response == null){
        print('Liczba elementów: zero');
        return 0;
      }

      final clothingItemIds = response['clothing_item_ids'] as List?;
      final itemCount = clothingItemIds?.length ?? 0;
      print('Liczba elementów: $itemCount');
      return itemCount;

    }catch (e,stack) {
      logger.i('Error countClothes: $e\n$stack');
      throw Exception('Theres no clothes ');
    }
  }
  
  Future<Result> editClothingItemInformation(int clothingItemId, int newCategoryId, List<Season> newSeasons) async{
    try{
      await supabase.from('clothingitem').update({'item_category_id': newCategoryId, 'seasons':newSeasons}).eq('clothing_item_id', clothingItemId);
      return Result.success();
    }catch(e,stack){
      logger.i('Error editClothingItemInf: $e\n$stack');
      return Result.failure('Something went wrong');
    }
  }
}
