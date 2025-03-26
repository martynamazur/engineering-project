import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repository/outfit_repository.dart';
import '../../model/outfit.dart';


part 'outfit_provider.g.dart';

@riverpod
OutfitRepository outfitRepository (OutfitRepositoryRef ref) {
  return OutfitRepository() ;
}

@riverpod
Future<List<Outfit>> getOwnedOutfits(GetOwnedOutfitsRef ref) async {
  return ref.read(outfitRepositoryProvider).getOwnedOutfits();
}

@riverpod
Future<void> saveOutfit(SaveOutfitRef ref, String imageUrl, List<int> clothingItemId) async {
  await ref.read(outfitRepositoryProvider).saveOutfitToDatabase(imageUrl,clothingItemId);
}

@riverpod
Future<void> deleteOutfit(DeleteOutfitRef ref, int outfitId) async {
  return ref.read(outfitRepositoryProvider).removeOutfit(outfitId);
}

