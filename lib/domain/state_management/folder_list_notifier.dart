import 'package:ootd/domain/state_management/clothes_folder_provider.dart';
import 'package:ootd/model/closet_folder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'folder_list_notifier.g.dart';

@Riverpod(keepAlive: true)
class FolderListNotifier extends _$FolderListNotifier {
  List<ClosetFolder> _originalList = [];

  @override
  FutureOr<List<ClosetFolder>> build() async {
    final folderList = await ref.read(getClosetFolderProvider.future);
    _originalList = folderList;
    return _originalList;
  }

  Future<void> addFolder(ClosetFolder newFolder) async {
    _originalList = [..._originalList, newFolder];
    state = AsyncData(_originalList);
  }


  Future<void> removeFolder(int folderId) async{
    _originalList = _originalList.where((folder) => folder.closetId != folderId).toList();
    state = AsyncData(_originalList);
    ref.read(deleteFolderProvider(folderId:  folderId));//z db
  }

  Future<void> removeClothingItemFromFolder(int folderId, int clothingItemId)async {
    // 2. Zaktualizuj lokalną listę
    final index = _originalList.indexWhere((folder) => folder.closetId == folderId);
    if (index != -1) {
      final folder = _originalList[index];

      // Usuń itemId z lokalnej listy
      final updatedIds = List<int>.from(folder.clothingItemIds)..remove(clothingItemId);

      // Stwórz nowy folder z aktualizowaną listą
      final updatedFolder = folder.copyWith(clothingItemIds: updatedIds);

      // Zaktualizuj oryginalną listę i stan
      _originalList[index] = updatedFolder;
      state = AsyncData(_originalList);
  }}

  Future<void> updateFolderName(int folderId, String newName) async {
    // Znajdź index folderu, który chcesz zaktualizować
    final index = _originalList.indexWhere((folder) => folder.closetId == folderId);

    if (index != -1) {
      // Utwórz nową instancję folderu z zmienioną nazwą
      final updatedFolder = _originalList[index].copyWith(closetName: newName);

      // Zaktualizuj oryginalną listę
      _originalList[index] = updatedFolder;

      // Uaktualnij stan
      state = AsyncData(_originalList);

      // Jeśli potrzebujesz, wywołaj provider do aktualizacji w bazie danych
      //await ref.read(updateFolderNameProvider(folderId, newName));
    }
  }

  Future<void> _fetchFolders() async {
    final folders = await ref.read(getClosetFolderProvider.future);
    state = AsyncValue.data(folders);
  }



  Future<void> refreshFolders() async {
    state = const AsyncValue.loading();
    await _fetchFolders();
  }


  }






