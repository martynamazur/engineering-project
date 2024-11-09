import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/model/clothing_item.dart';
import 'package:ootd/navigation/app_router.dart';

import 'package:ootd/domain/state_management/clothes_folder_provider.dart';
import 'package:ootd/domain/state_management/folder_list_notifier.dart' as folderList;

import '../model/closet_folder.dart';

final gridViewTypeProvider = StateProvider<GridViewType>((ref) => GridViewType.large);

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
@override
  Widget build(BuildContext context) {
    final gridViewType = ref.watch(gridViewTypeProvider);
    final folderListNotifier = ref.watch(folderList.folderListNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Szafa'),
        actions: [
          IconButton(
            icon: Icon(gridViewType == GridViewType.large ? Icons.grid_view : Icons.view_module),
            onPressed: () {
              ref.read(gridViewTypeProvider.notifier).state = gridViewType == GridViewType.large
                  ? GridViewType.small
                  : GridViewType.large;
            },
          ),
          IconButton(onPressed: () {
            _createNewFolderDialog();

          }, icon: const Icon(Icons.add_box_rounded))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.refresh(folderList.folderListNotifierProvider);
        },

        child: folderListNotifier.when(
          data: (folders) => _buildGridView(gridViewType, folders, ref),
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
          _confirmFolderDeletion(folder.closetId);
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
                      final clothingItem = folder.clothingItems[index];
                      return _buildListItem(clothingItem);
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
  final folder = folderC.clothingItems.take(4).toList();//biore 4 zdjecia do wsywietelnia folderu

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () => context.router.push(ClosetFolderOverviewRoute(folderId: folderC.closetId)),
      onLongPress: () => _confirmFolderDeletion(folderC.closetId),
      child: Column( // aby na dole umiesc tekst
        children: [
          //tu buduje jak wewnatrz wyglada grid ze zdjeciami elementu

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
              child: const Center(
                child: Text(
                  'Folder jest pusty',
                  style: TextStyle(
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
                return _buildListItem(clothingItem);
              },
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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

  Container _buildListItem(ClothingItem clothingItem) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.blue,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Expanded(
            child: Image.network(
              clothingItem.itemPhoto,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(child: Text('Image not available'));
              },
            ),
          ),

      ),
    );
  }

  void _confirmFolderDeletion(int folderId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Do you want to delete ?'),
          content: Text('This action will be permanent and cannot be undone.'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    context.router.maybePop();
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    ref.read(folderList.folderListNotifierProvider.notifier).removeFolder(folderId);
                    context.router.maybePop();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.restore_from_trash),
                      Text('Delete'),
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

  void _createNewFolderDialog() {
    final _controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create a new folder'),
          content: Column(
            mainAxisSize: MainAxisSize.min, // Dostosowuje rozmiar kolumny do zawartości
            children: [
              Text('Please enter the new folder name:'),
              SizedBox(height: 10),
              TextField(
                controller: _controller,
                decoration: InputDecoration(hintText: 'Folder Name'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                if (_controller.text.isNotEmpty) {
                  ref.read(createNewFolderProvider(_controller.text));
                  ref.invalidate(folderList.folderListNotifierProvider);
                }
                if (mounted) {
                  Navigator.of(context).pop();
                }
              },
              child: Text('Create'),
            ),
          ],
        );
      },
    );
  }
}
