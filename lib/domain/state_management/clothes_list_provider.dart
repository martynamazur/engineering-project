import 'package:ootd/model/clothing_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'clothes_folder_provider.dart';

part 'clothes_list_provider.g.dart';

@riverpod
class ClothesListNotifier extends _$ClothesListNotifier {

  @override
  Future<List<ClothingItem>> build() async {
    final repository = ref.watch(clothesFolderRepositoryProvider);
    final closetFolderId = ref.watch(picketClosetFolderProvider);
    final closetFolder = await repository.getClosetFolder(closetFolderId);
    return closetFolder.clothingItems;
  }
}
