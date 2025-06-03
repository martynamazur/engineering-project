import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/extensions/localization_extension.dart';
import 'package:ootd/domain/state_management/clothes_folder_provider.dart';
import 'package:ootd/domain/state_management/folder_list_notifier.dart' as folderList;
import 'package:ootd/model/clothing_item.dart';

@RoutePage()
class PickOwnedClothesScreen extends ConsumerStatefulWidget {
  final int _folderId;
  const PickOwnedClothesScreen(this._folderId, {super.key});

  @override
  ConsumerState<PickOwnedClothesScreen> createState() => _PickOwnedClothesScreenState();
}

class _PickOwnedClothesScreenState extends ConsumerState<PickOwnedClothesScreen> {


  @override
  Widget build(BuildContext context) {
    final clothesList = ref.watch(getAllClothesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.pickClothesHeader),
      ),
      body: clothesList.when(
        data: (data) => data.isEmpty ? _buildEmpty() :_buildClothesList(data: data),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      )
    );
  }

  Padding _buildClothesList({required List<ClothingItem> data }) {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final outfit = data[index];
                return GestureDetector(
                  onTap: () async{
                    ref.read(addClothesToFolderProvider(clothesId: [outfit.clothingItemId!],folderId:  widget._folderId));
                    ref.invalidate(getFolderProvider(widget._folderId));

                    ref.invalidate(folderList.folderListNotifierProvider);
                    context.router.maybePop();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 5.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: outfit.itemPhoto,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          CircularProgressIndicator(value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                );
              },
            ),
          ),
        );
  }

  Center _buildEmpty() {
    return Center(
            child: Text(
              context.loc.youDoNotOwnClothesMessages,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
  }
}
