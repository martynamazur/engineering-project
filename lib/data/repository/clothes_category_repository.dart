import 'package:ootd/main.dart';
import 'package:ootd/model/clothing_item.dart';

import '../../model/clothes_category.dart';
import '../../utils/log.dart';

class ClothesCategoryRepository {

  late final String _userId;

  ClothesCategoryRepository() {
    _initialize();
  }

  Future<void> _initialize() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception('User not logged in');
    }
    _userId = user.id;
  }

  Future<List<ClothesCategory>> getClothesCategory() async{
    try {
      final response = await supabase.from('categories').select('*');
      final List<ClothesCategory> clothesCategory = (response as List<dynamic>)
          .map((json) => ClothesCategory.fromJson(json))
          .toList();

      print(clothesCategory);
      return clothesCategory;
    } catch (e, stack) {
      logger.i('Error getClothesCategory: $e\n$stack');
      return [];
    }
  }

  Future<List<ClothingItem>> getAllClothingFromCategory(int categoryId) async {
    try {
      final response = await supabase.rpc(
        'get_clothing_items_by_category',
        params: {
          'user_uuid': _userId,
          'category_id': categoryId,
        },
      );

      final List<dynamic> data = response as List<dynamic>;
      final clothingItemList = data.map((json) => ClothingItem.fromJson(json)).toList();

      return clothingItemList;
    } catch (e, stack) {
      logger.i('Error getAllClothingFromCategory: $e\n$stack');
      return [];
    }
  }
}
