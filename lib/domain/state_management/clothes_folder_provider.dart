import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/domain/state_management/folder_list_notifier.dart';
import 'package:ootd/utils/debounce_cancelation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repository/clothes_folder_repository.dart';
import '../../model/closet_folder.dart';
import '../../model/clothing_item.dart';
import 'clothes_list_provider.dart';

part 'clothes_folder_provider.g.dart';

@riverpod
ClothesFolderRepository clothesFolderRepository(ClothesFolderRepositoryRef ref) {
  return ClothesFolderRepository();
}

@riverpod
FolderListNotifier folderListNotifier(FolderListNotifierRef ref) {
  return FolderListNotifier();
}

@riverpod
Future<List<ClosetFolder>> getClosetFolder(GetClosetFolderRef ref) async {
  return ref.read(clothesFolderRepositoryProvider).getAllClosetFolder();
}

// podmienic na notfier
@riverpod
Future<ClosetFolder> getFolder(GetFolderRef ref, int id) async {
  return ref.read(clothesFolderRepositoryProvider).getClosetFolder(id);
}


@riverpod
ClothesListNotifier clothesListNotifier (ClothesListNotifierRef ref) {
  return ClothesListNotifier();
}



//find a solution latter
//i pass argumnet in the constructor
final picketClosetFolderProvider = StateProvider((ref) => 0);


@riverpod
Future<void> deleteFolder(DeleteFolderRef ref, int folderId) async {
  return ref.read(clothesFolderRepositoryProvider).deleteFolder(folderId);
}

@riverpod
Future<void> changeFolderName(ChangeFolderNameRef ref,String newFolderName, int folderId) async {
  return ref.read(clothesFolderRepositoryProvider).changeFolderName(newFolderName, folderId);
}

@riverpod
Future<ClosetFolder> createNewFolder(CreateNewFolderRef ref, String folderName) async {
  final newFolder = await ref.read(clothesFolderRepositoryProvider).createFolder(folderName);
  return newFolder;

}

@riverpod
Future<void> addClothesToFolder(AddClothesToFolderRef ref, List<int> clothesId, int folderId) async {
  return ref.read(clothesFolderRepositoryProvider).addClothesToFolder(clothesId, folderId);
}

@riverpod
Future<List<ClothingItem>> getAllClothes(GetAllClothesRef ref) async {
  return ref.read(clothesFolderRepositoryProvider).getAllOwnedClothes();
}

@riverpod
Future<void> removeClothingItemFromFolder(RemoveClothingItemFromFolderRef ref, int folderId, int clothingItemId) async {
  return ref.read(clothesFolderRepositoryProvider).removeClothingItemFromFolder(folderId,clothingItemId,);
}
