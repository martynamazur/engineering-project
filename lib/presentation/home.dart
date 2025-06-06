import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/domain/state_management/clothes_provider.dart';
import 'package:ootd/extensions/localization_extension.dart';
import 'package:ootd/l10n/app_localizations.dart';
import 'package:ootd/model/clothing_item.dart';
import 'package:ootd/navigation/app_router.dart';

import 'package:ootd/domain/state_management/clothes_folder_provider.dart';
import 'package:ootd/domain/state_management/folder_list_notifier.dart' as folderList;
import 'package:ootd/presentation/styles/headline_text.dart';

import '../model/closet_folder.dart';

enum GridViewType {
  large,
  small,
}

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  GridViewType gridViewType = GridViewType.large;

@override
  Widget build(BuildContext context) {
    final folderListNotifier = ref.watch(folderList.folderListNotifierProvider);
    final isThereAnyClothes = ref.read(countClothesProvider).value;

  return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.closetHeader),
        actions: [
          IconButton(
            icon: Icon(gridViewType == GridViewType.large ? Icons.grid_view : Icons.view_module),
            onPressed: () {
              setState(() {
                gridViewType = gridViewType == GridViewType.large ? GridViewType.small : GridViewType.large;
              });
            },
          ),
          IconButton(onPressed: () => _showCreateNewFolderDialog(), icon: const Icon(Icons.add_box_rounded))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.refresh(folderList.folderListNotifierProvider);
        },

        child: folderListNotifier.when(
          data: (folders) => isThereAnyClothes != 0 ? _buildGridView(gridViewType, folders, ref) : _buildEmptyCloset(),
          error: (error, stackTrace) => Center(child: Text('Error: $error')),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  Widget _buildGridView(GridViewType gridViewType, List<ClosetFolder> folders, WidgetRef ref) {
    if (gridViewType == GridViewType.large) {
      return ListView.builder(
        itemCount: folders.length,
        itemBuilder: (context, index) => _buildLargeFolderItem(folders[index], context, ref),
      );
    } else {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 0.7,
        ),
        itemCount: folders.length,
        itemBuilder: (context, index) => _buildSmallFolderContent(folders[index], context),
      );
    }
  }

  Widget _buildLargeFolderItem(ClosetFolder folder, BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          context.router.push(ClosetFolderOverviewRoute(folderId: folder.closetId));
        },
        onLongPress: () {
          _showFolderDeletionDialog(folderId: folder.closetId);
          ref.read(deleteClothingItemProvider(clothingItemId:  folder.closetId));
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  flex: 1,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      childAspectRatio: 1,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      if(folder.clothingItems.isEmpty) return _buildAddItemPlaceholder();

                      if(index < folder.clothingItems.length){
                        final clothingItem = folder.clothingItems[index];
                        return _buildListItem(clothingItem:  clothingItem);
                      }else{
                        return _buildAddItemPlaceholder();
                      }

                    },
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  folder.closetName,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "(${folder.totalAmountOfClothes})",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSmallFolderContent(ClosetFolder folderC, BuildContext context) {
  final folder = folderC.clothingItems.take(4).toList();

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () => context.router.push(ClosetFolderOverviewRoute(folderId: folderC.closetId)),
      onLongPress: () => _showFolderDeletionDialog(folderId:folderC.closetId),
      child: Column(
        children: [
          if(folder.isEmpty)
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  context.loc.emptyFolder,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          else
            Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemCount: folder.length,
              itemBuilder: (context, index) {
                final clothingItem = folder[index];
                return _buildListItem(clothingItem: clothingItem);
              },
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
            Text(
            "(${folderC.totalAmountOfClothes})",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
            Text(
            "(${folderC.closetName})",
            softWrap: true,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}

  Container _buildListItem({required ClothingItem clothingItem}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            clothingItem.itemPhoto,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Center(child: Text(context.loc.imageNotAvailable));
            },
          ),

        ),
      ),
    );
  }

  Widget _buildEmptyCloset(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () =>  context.tabsRouter.setActiveIndex(2),
          child: Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.lightGreenAccent
            ),
            child: const Icon(Icons.add),
          ),
        ),
        Center(child: Text(context.loc.emptyCloset, style:  headline)),
      ],
    );
  }

  Widget _buildAddItemPlaceholder(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
        color: Colors.white70,
      ),
      child: const Icon(Icons.add, color: Colors.green),
    );

  }

  void _showFolderDeletionDialog(
      {required int folderId}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.loc.doYouWantToDelete),
          content: Text(context.loc.deleteConfirmation),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () => context.router.maybePop(),
                  child: Text(context.loc.cancel),
                ),
                TextButton(
                  onPressed: () {
                    ref.read(folderList.folderListNotifierProvider.notifier).removeFolder(folderId);
                    context.router.maybePop();
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.restore_from_trash),
                      Text(context.loc.delete),
                    ],
                  ),
                ),
              ],
            )

          ],
        );
      },
    );
  }

  void _showCreateNewFolderDialog() {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.loc.createNewFolderTitle),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(context.loc.enterNewFolderName),
              const SizedBox(height: 12.0),
              TextField(
                controller: controller,
                decoration: InputDecoration(hintText: context.loc.folderNameHint),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(context.loc.cancel),
            ),
            TextButton(
              onPressed: () async {
                if (controller.text.isNotEmpty) {
                  final newFolder = await ref.read(createNewFolderProvider(folderName:  controller.text).future);
                  await ref.read(folderList.folderListNotifierProvider.notifier).addFolder(newFolder);
                }
                Navigator.of(context).pop();

              },
              child: Text(context.loc.create),
            ),
          ],
        );
      },
    );
  }

}
