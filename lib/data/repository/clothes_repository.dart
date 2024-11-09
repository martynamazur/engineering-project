import 'package:ootd/main.dart';

import '../../model/clothing_item.dart';

class ClothesRepository {

  Future<void> addClothingItem(ClothingItem clothingItem) async {
    try{

      final userId = supabase.auth.currentUser?.id; // Get the current user's ID
      if (userId == null) {
        throw Exception('User is not authenticated.');
      }

      // Set the session variable
      await supabase.rpc('set_current_user_id', params: {'user_id': userId});

      await supabase.from('clothingitem').insert({
        'item_photo' : clothingItem.itemPhoto,
        'seasons' :  clothingItem.seasons?.map((season) => season.toString().split('.').last).toList(),

      });

    }catch (e) {
      print('Caught an error: $e');
      throw Exception('cannot add clothing item to databse');
    }

  }

  Future<void> deleteClothingItem(int clothingItemId) async{
    try{
      print('id usuwanego elementu $clothingItemId');
      await supabase.from('clothingitem').delete().eq('clothing_item_id', clothingItemId);

    }catch (e) {
      print('Caught an error: $e');
      throw Exception('Coundt');
  }
}
}
