import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repository/clothes_repository.dart';
import '../../model/clothing_item.dart';



part 'clothes_provider.g.dart';

@riverpod
ClothesRepository clothesRepository(ClothesRepositoryRef ref) {
  return ClothesRepository();
}

@riverpod
Future<void> deleteClothingItem(DeleteClothingItemRef ref, int clothingItemId) async {
  return ref.read(clothesRepositoryProvider).deleteClothingItem(clothingItemId);
}

@riverpod
Future<void> addNewClothingItem(AddNewClothingItemRef ref, ClothingItem newClothingItem) async {
  return  ref.read(clothesRepositoryProvider).addClothingItem(newClothingItem);

}