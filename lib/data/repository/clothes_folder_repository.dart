import 'package:ootd/main.dart';
import 'package:ootd/model/closet_folder.dart';
import 'package:ootd/model/clothing_item.dart';

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
    } catch (e) {
      print('Caught an error: $e');
      return [];
    }
  }

  //
  Future<List<ClothingItem>> _getClothingItemsForFolder(List<int> clothingItemIds) async {
    try {
      if (clothingItemIds.isEmpty) return [];

      final response = await supabase
          .from('clothingitem')
          .select()
          .inFilter('clothing_item_id', clothingItemIds);

      final List<dynamic> data = response as List<dynamic>;
      return data.map((json) => ClothingItem.fromJson(json)).toList();
    } catch (e) {
      print('Error: $e');
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
      final clothingItems =
          await _getClothingItemsForFolder(closetFolder.clothingItemIds);
      closetFolder = closetFolder.copyWith(clothingItems: clothingItems);

      print(closetFolder);
      print('udalo sie ${closetFolder.closetId}');
      return closetFolder;
    } catch (e) {
      print('Caught an error: $e');
      throw Exception('Failed to fetch the closet folder');
    }
  }

  //Managing CRUD
  Future<void> deleteFolder(int folderId) async {
    try {
      await supabase
          .from('closetfolder')
          .delete()
          .eq('closet_id', folderId)
          .eq('user_id', _userId);
    } catch (e) {
      print('Caught an error: $e');
      throw Exception('Coundt');
    }
  }

  Future<void> changeFolderName(String newFolderName, int folderId) async {
    try {
      await supabase
          .from('closetfolder')
          .update({'closet_name': newFolderName})
          .eq('closet_id', folderId)
          .eq('user_id', _userId);
    } catch (e) {
      print('Caught an error: $e');
      throw Exception('Coundt');
    }
  }

  Future<void> createFolder(String folderName) async{
    try{
      await supabase.from('closetfolder').insert({
        'user_id': _userId,
        'closet_name': folderName,
        'clothing_item_ids': []
      });

    }catch (e) {
      print('Caught an error: $e');
      throw Exception('Coundt');
    }
  }


  // na Backendzie scali dwie listy , tylko przekazuje parametry do funkcji
  Future<void> addClothesToFolder(List<int> clothesId, int folderId) async{

    try{
      await supabase.rpc('add_items_to_closetfolder', params: {
        'new_items': clothesId,
        'closet_id_input': folderId
      });
      print('Clothes have been added');
    }catch (e) {
      print('Caught an error: $e');
      throw Exception('Coundt');
    }
  }

  //wszystkie ciuchy jakie kiedykowleik dodano
  Future<List<ClothingItem>> getAllOwnedClothes() async {
    try {
      // Fetch the clothing item IDs from the database
      final response = await supabase
          .from('closetfolder')
          .select('clothing_item_ids')
          .eq('type', 'all')
          .eq('user_id', _userId)
          .single();

      // Extract the clothing_item_ids as a List<int>
      List<int> clothingItemIds = List<int>.from(response['clothing_item_ids'] ?? []);
      print("Ile jest id ${clothingItemIds.length}");
      return fetchClothingItems(clothingItemIds);

    } catch (e) {
      print('Caught an error: $e');
      return [];
    }
  }

  Future<List<ClothingItem>> fetchClothingItems(List<int> clothingItemIds) async {
    try {
      if (clothingItemIds.isEmpty) return [];

      // Pobranie danych z bazy
      final response = await supabase
          .from('clothingitem')
          .select()
          .inFilter('clothing_item_id', clothingItemIds);

      // Logowanie pełnej odpowiedzi dla debugowania
      print('Raw Response: $response');

      final List<dynamic> data = response as List<dynamic>;
      return data.map((json) => ClothingItem.fromJson(json)).toList();

    } catch (e) {
      print('Error fetching clothing items: $e');
      return [];
    }
  }


}
