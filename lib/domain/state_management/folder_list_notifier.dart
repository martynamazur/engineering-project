import 'package:ootd/domain/state_management/clothes_folder_provider.dart';
import 'package:ootd/model/closet_folder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'folder_list_notifier.g.dart';

@riverpod
class FolderListNotifier extends _$FolderListNotifier {
  List<ClosetFolder> _originalList = [];

  @override
  FutureOr<List<ClosetFolder>> build() async {
    final folderList = await ref.read(getClosetFolderProvider.future);
    _originalList = folderList;
    return _originalList;
  }

  //on home screen
  Future<void> removeFolder(int folderId) async{
    _originalList = _originalList.where((folder) => folder.closetId != folderId).toList();
    state = AsyncData(_originalList);
    ref.read(deleteFolderProvider(folderId));//z db
  }

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
