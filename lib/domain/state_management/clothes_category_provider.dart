import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repository/clothes_category_repository.dart';
import '../../model/clothes_category.dart';
import '../../model/clothing_item.dart';


part 'clothes_category_provider.g.dart';

@riverpod
ClothesCategoryRepository clothesCategoryRepository (Ref ref) {
  return ClothesCategoryRepository();
}

@riverpod
Future<List<ClothesCategory>> getClothesCategory(Ref ref) async {
  return ref.watch(clothesCategoryRepositoryProvider).getClothesCategory();
}

@riverpod
Future<List<ClothingItem>> getCategoryClothingItem(Ref ref, {required int categoryId}) async {
  return ref.read(clothesCategoryRepositoryProvider).getAllClothingFromCategory(categoryId);
}