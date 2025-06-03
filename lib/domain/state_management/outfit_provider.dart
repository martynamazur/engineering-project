import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repository/outfit_repository.dart';
import '../../model/outfit.dart';


part 'outfit_provider.g.dart';

@riverpod
OutfitRepository outfitRepository (Ref ref) {
  return OutfitRepository();
}

@riverpod
Future<List<Outfit>> getOwnedOutfits(Ref ref) async {
  return ref.read(outfitRepositoryProvider).getOwnedOutfits();
}

@riverpod
Future<void> saveOutfit(Ref ref, String imageUrl, List<int> clothingItemId) async {
  await ref.read(outfitRepositoryProvider).saveOutfitToDatabase(imageUrl,clothingItemId);
}

@riverpod
Future<void> deleteOutfit(Ref ref, int outfitId) async {
  return ref.read(outfitRepositoryProvider).removeOutfit(outfitId);
}

@riverpod
Future<void> editOutfitInformationTags(Ref ref, List<String> updatedTags, int outfitId) async {
  return ref.read(outfitRepositoryProvider).editOutfitInformationTags(updatedTags,outfitId);
}

@riverpod
Future<void> editOutfitInformationSeason(Ref ref, String season, int outfitId) async {
  return ref.read(outfitRepositoryProvider).editOutfitInformationSeason(season,outfitId);
}

@riverpod
Future<Outfit> getOutfit(Ref ref, outfitId) async {
  return ref.read(outfitRepositoryProvider).getOutfit(outfitId);
}
