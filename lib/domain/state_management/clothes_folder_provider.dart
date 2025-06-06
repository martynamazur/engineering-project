import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/domain/state_management/folder_list_notifier.dart';
import 'package:ootd/utils/debounce_cancelation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repository/clothes_folder_repository.dart';
import '../../model/closet_folder.dart';
import '../../model/clothing_item.dart';
import '../../model/result.dart';
import 'clothes_list_provider.dart';

part 'clothes_folder_provider.g.dart';

@riverpod
ClothesFolderRepository clothesFolderRepository(Ref ref) {
  return ClothesFolderRepository();
}

@riverpod
FolderListNotifier folderListNotifier(Ref ref) {
  return FolderListNotifier();
}

@riverpod
Future<List<ClosetFolder>> getClosetFolder(Ref ref) async {
  return ref.read(clothesFolderRepositoryProvider).getAllClosetFolder();
}

// podmienic na notfier
@riverpod
Future<ClosetFolder> getFolder(Ref ref, int id) async {
  return ref.read(clothesFolderRepositoryProvider).getClosetFolder(id);
}


@riverpod
ClothesListNotifier clothesListNotifier(Ref ref) {
  return ClothesListNotifier();
}



//find a solution latter
//i pass argumnet in the constructor
final picketClosetFolderProvider = StateProvider((ref) => 0);


@riverpod
Future<Result> deleteFolder(Ref ref, {required int folderId}) async {
  return ref.read(clothesFolderRepositoryProvider).deleteFolder(folderId);
}

@riverpod
Future<Result> changeFolderName(Ref ref,
    {required String newFolderName, required int folderId}) async {
  return ref.read(clothesFolderRepositoryProvider).changeFolderName(newFolderName, folderId);
}

@riverpod
Future<ClosetFolder> createNewFolder(Ref ref, {required String folderName}) async {
  final newFolder = await ref.read(clothesFolderRepositoryProvider).createFolder(folderName);
  return newFolder;

}

@riverpod
Future<Result> addClothesToFolder(Ref ref, {required List<int> clothesId,required int folderId}) async {
  return ref.read(clothesFolderRepositoryProvider).addClothesToFolder(clothesId, folderId);
}

@riverpod
Future<List<ClothingItem>> getAllClothes(Ref ref) async {
  return ref.read(clothesFolderRepositoryProvider).getAllOwnedClothes();
}

@riverpod
Future<Result> removeClothingItemFromFolder(Ref ref,
    {required int folderId, required int clothingItemId}) async {
  return ref.read(clothesFolderRepositoryProvider).removeClothingItemFromFolder(folderId,clothingItemId,);
}
