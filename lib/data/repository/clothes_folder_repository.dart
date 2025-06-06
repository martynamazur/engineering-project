import 'package:ootd/main.dart';
import 'package:ootd/model/closet_folder.dart';
import 'package:ootd/model/clothing_item.dart';

import '../../model/result.dart';
import '../../utils/log.dart';

class ClothesFolderRepository {
  late final String _userId;

  ClothesFolderRepository() {
    _initialize();
  }

  Future<void> _initialize() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception('User not logged in');
    }
    _userId = user.id;
  }

  //Fetching all Folders for folder list page
  Future<List<ClosetFolder>> getAllClosetFolder() async {
    try {
      final response = await supabase
          .from('closetfolder')
          .select('*')
          .eq('user_id', _userId);

      final closetFolders =
          response.map((json) => ClosetFolder.fromJson(json)).toList();

      for (int i = 0; i < closetFolders.length; i++) {
        final folder = closetFolders[i];
        final clothingItems =
            await _getClothingItemsForFolder(folder.clothingItemIds);
        closetFolders[i] = folder.copyWith(clothingItems: clothingItems);
      }

      return closetFolders;
    } catch (e, stack) {
      logger.i('Error egetAllClosetFolder: $e\n$stack');
      return [];
    }
  }

  //
  Future<List<ClothingItem>> _getClothingItemsForFolder(
      List<int> clothingItemIds) async {
    try {
      if (clothingItemIds.isEmpty) return [];

      final response = await supabase
          .from('clothingitem')
          .select()
          .inFilter('clothing_item_id', clothingItemIds);

      final List<dynamic> data = response as List<dynamic>;
      return data.map((json) => ClothingItem.fromJson(json)).toList();
    } catch (e, stack) {
      logger.i('Error getClothingItemsForFolder: $e\n$stack');
      return [];
    }
  }

  //Fetching certain folder with their content
  Future<ClosetFolder> getClosetFolder(int id) async {
    try {
      final response = await supabase
          .from('closetfolder')
          .select('*')
          .eq('user_id', _userId)
          .eq('closet_id', id)
          .single();

      ClosetFolder closetFolder = ClosetFolder.fromJson(response);
      final clothingItems = await _getClothingItemsForFolder(closetFolder.clothingItemIds);
      closetFolder = closetFolder.copyWith(clothingItems: clothingItems);

      return closetFolder;
    } catch (e,stack) {
      logger.i('Error get clsoet fodler : $e\n$stack');
      throw Exception('Failed to fetch the closet folder');
    }
  }


  Future<Result> deleteFolder(int folderId) async {
    try {
      await supabase
          .from('closetfolder')
          .delete()
          .eq('closet_id', folderId)
          .eq('user_id', _userId);
      return Result.success();
    } catch (e,stack) {
      logger.i('Error delete folder: $e\n$stack');
      return Result.failure('Something went wrong');
    }
  }

  Future<Result> changeFolderName(String newFolderName, int folderId) async {
    try {
      await supabase
          .from('closetfolder')
          .update({'closet_name': newFolderName})
          .eq('closet_id', folderId)
          .eq('user_id', _userId);
      return Result.success();
    } catch (e,stack) {
      logger.i('Error changeFolderName: $e\n$stack');
      return Result.failure('Somethign went wrong');
    }
  }

  Future<ClosetFolder> createFolder(String folderName) async {
    try {
      final response = await supabase
          .from('closetfolder')
          .insert({
            'user_id': _userId,
            'closet_name': folderName,
            'type': 'normal',
            'total_amount_of_clothes': 0
          })
          .select()
          .single();
      return ClosetFolder.fromJson(response);
    } catch (e, stack) {
      logger.i('Error createFolder: $e\n$stack');
      throw Exception('Coundt');
    }
  }

  Future<Result> addClothesToFolder(List<int> clothesId, int folderId) async {
    try {
      await supabase.rpc('add_items_to_closetfolder',
          params: {'new_items': clothesId, 'closet_id_input': folderId});
      return Result.success();
    } catch (e, stack) {
      logger.i('Error addClothesToFolder: $e\n$stack');
      return Result.failure('Something went wrong');
    }
  }

  Future<List<ClothingItem>> getAllOwnedClothes() async {
    try {
      final response = await supabase
          .from('closetfolder')
          .select('clothing_item_ids')
          .eq('type', 'all')
          .eq('user_id', _userId)
          .single();

      List<int> clothingItemIds =
          List<int>.from(response['clothing_item_ids'] ?? []);
      print("Ile jest id ${clothingItemIds.length}");
      return fetchClothingItems(clothingItemIds);
    } catch (e, stack) {
      logger.i('Error getAllOwnedClothes: $e\n$stack');
      return [];
    }
  }

  Future<List<ClothingItem>> fetchClothingItems(List<int> clothingItemIds) async {
    try {
      if (clothingItemIds.isEmpty) return [];

      final response = await supabase
          .from('clothingitem')
          .select()
          .inFilter('clothing_item_id', clothingItemIds);


      final List<dynamic> data = response as List<dynamic>;
      return data.map((json) => ClothingItem.fromJson(json)).toList();
    } catch (e, stack) {
      logger.i('Error fetching clothing item: $e\n$stack');
      return [];
    }
  }

  Future<Result> removeClothingItemFromFolder(int folderId, int clothingItemId) async {
    try {
      await supabase.rpc('remove_item_from_closetfolder_array',
          params: {'folder_id': folderId, 'item_id': clothingItemId});
      return Result.success();
    } catch (e,stack) {
      logger.i('Error removeClothingItemFromFolder: $e\n$stack');
      return Result.failure('Something went wrong');
    }
  }
}
