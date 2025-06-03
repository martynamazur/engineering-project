import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repository/clothes_repository.dart';
import '../../model/clothing_item.dart';



part 'clothes_provider.g.dart';

@riverpod
ClothesRepository clothesRepository(Ref ref) {
  return ClothesRepository();
}

@riverpod
Future<void> deleteClothingItem(Ref ref, {required int clothingItemId}) async {
  return ref.read(clothesRepositoryProvider).deleteClothingItem(clothingItemId);
}

@riverpod
Future<void> addNewClothingItem(Ref ref, {required ClothingItem newClothingItem}) async {
  return  ref.read(clothesRepositoryProvider).addClothingItem(newClothingItem);
}

@riverpod
Future<int> countClothes(Ref ref) async {
  return ref.read(clothesRepositoryProvider).countClothes();
}

@riverpod
Future<void> editClothingItem(Ref ref,
    {required int clothingItemId,required int newCategoryId,required List<Season> newSeasons}) async {
  return ref.read(clothesRepositoryProvider).editClothingItemInformation(clothingItemId, newCategoryId, newSeasons);
}