import 'package:flutter/foundation.dart';
import 'package:ootd/domain/state_management/clothes_folder_provider.dart';
import 'package:ootd/model/clothing_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'clothing_list_notifier.g.dart';
@riverpod
class ClothingListNotifier extends _$ClothingListNotifier {
  late List<ClothingItem> clothingItemsOriginal;
  bool isSorted = false;

  @override
  Future<List<ClothingItem>> build(int folderId) async{
    final folder = await ref.read(getFolderProvider(folderId).future);
    clothingItemsOriginal = folder.clothingItems;
    return folder.clothingItems;
  }

  // state trzyma aktualną listę!
  void remove(int index){
    state = state.whenData((items){
      final updatedList = [...items];
      updatedList.removeAt(index);
      return updatedList;
    });
  }

  void filterByCategory(int category){
    state= state.whenData((items){
      final filteredList = clothingItemsOriginal.where((item) => item.itemCategoryId == category).toList();
      isSorted = true;
      return filteredList;
    });
  }

  void resetFilters(){
    state = AsyncValue.data(List.from(clothingItemsOriginal));
    isSorted = false;
  }

  int getItemCount() {
    return state.maybeWhen(
      data: (items) => items.length,
      orElse: () => 0,
    );
  }
}
