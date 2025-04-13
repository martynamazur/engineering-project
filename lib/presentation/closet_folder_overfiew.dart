import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:ootd/model/closet_folder.dart';
import 'package:ootd/navigation/app_router.dart';
import 'package:ootd/presentation/styles/empty_closet_widget.dart';
import 'package:ootd/presentation/styles/headline_text.dart';
import '../domain/state_management/clothes_folder_provider.dart';
import '../model/clothing_item.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ootd/domain/state_management/folder_list_notifier.dart' as folderList;

@RoutePage()
class ClosetFolderOverviewScreen extends ConsumerStatefulWidget {
  final int folderId;

  const ClosetFolderOverviewScreen(this.folderId, {super.key});

  @override
  ConsumerState<ClosetFolderOverviewScreen> createState() =>
      _ClosetFolderOverviewScreenState();
}

class _ClosetFolderOverviewScreenState
    extends ConsumerState<ClosetFolderOverviewScreen> {
  int? selectedValue;

  @override
  Widget build(BuildContext context) {
    final closetFolder = ref.watch(getFolderProvider(widget.folderId));

    return Scaffold(
      appBar: AppBar(
        title: closetFolder.when(
          data: (folder) =>
              Text('${folder.closetName} (${folder.totalAmountOfClothes})'),
          loading: () => const Text('Loading...'),
          error: (error, stackTrace) => const Text('Error'),
        ),
        actions: _folderActionBar(),
      ),
      body: SafeArea(
        child: closetFolder.when(
          data: (folder) {
            return folder.clothingItems.isNotEmpty
                ? _clothesList(folder)
                : _buildEmptyCloset();
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('Error: $error')),
        ),
      ),
    );
  }

  List<Widget> _folderActionBar() {
    return [
      IconButton(
        onPressed: () {
          // Obsługa filtrowania
        },
        icon: Icon(Icons.filter_list_alt),
      ),
      IconButton(
        onPressed: () => context.router
            .push(PickOwnedClothesRoute(folderId: widget.folderId)),
        icon: Icon(Icons.add),
      ),
      SizedBox(
        width: 40,
        child: PopupMenuButton<int>(
          onSelected: (value) {
            switch (value) {
              case 1:
                showAlertDialogChangeFolderName();
                break;
              case 2:
                showAlertDialogDeleteFolder();
                break;
            }
          },
          icon: Icon(Icons.edit),
          itemBuilder: (BuildContext context) => [
            PopupMenuItem<int>(
              value: 1,
              child: Text('Change folder name'),
            ),
            PopupMenuItem<int>(
              value: 2,
              child: Text('Delete folder'),
            ),
          ],
        ),
      )

    ];
  }

  void showAlertDialogDeleteFolder() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure?'),
          content: Text('This action will be permanent and cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () async {

                if (mounted) {
                  ref.read(deleteFolderProvider(widget.folderId));
                  ref.invalidate(folderList.folderListNotifierProvider);
                  Navigator.of(context).pop(); //zamkniecie dialogu

                  if (mounted) {
                    context.router.maybePop();//przejscie do poprzedniego ekranu
                  }
                }
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void showAlertDialogChangeFolderName() {
    final _controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Folder Name'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
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
                  ref.read(changeFolderNameProvider(
                      _controller.text, widget.folderId));



                  //ok zmienia sie w home screen
                  await ref.read(folderList.folderListNotifierProvider.notifier).updateFolderName(widget.folderId,_controller.text);

                  ref.invalidate(getFolderProvider(widget.folderId)); //odswiezac dane, pobieram cala liste ponownie
                  ref.invalidate(folderListNotifierProvider);//odswiezam home

                }
                if (mounted) {
                  Navigator.of(context).pop();
                }
              },
              child: Text('Change'),
            ),
          ],
        );
      },
    );
  }

  Widget _clothesList(ClosetFolder folder) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _clothesGrid(folder.clothingItems),
        ],
      ),
    );
  }

  Widget _clothesGrid(List<ClothingItem> clothingItems) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimationLimiter(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 12.0,
            childAspectRatio: 1,
          ),
          itemCount: clothingItems.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final clothingItem = clothingItems[index];
            return AnimationConfiguration.staggeredGrid(
              position: index,
              columnCount: 3,
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child: _buildClothingItemTile(clothingItem, context),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildClothingItemTile(
      ClothingItem clothingItem, BuildContext context) {
    return GestureDetector(
      onTap: () => context.router
          .push(ClothingItemOverviewRoute(clothingItem: clothingItem)),
      onLongPress: () => _removeFromFolderDialog(clothingItem.clothingItemId!),
      child: Container(
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
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  clothingItem.itemPhoto,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Text('Image not available'));
                  },
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  void _removeFromFolderDialog(int clothingItemId) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Remove from the folder'),
            content:
                Text('This action will be permanent and cannot be undone.'),
            actions: [
              TextButton(onPressed: () => context.router.maybePop(), child: Text('Cancel')),
              TextButton(
                  onPressed: () async {
                    ref.read(removeClothingItemFromFolderProvider(widget.folderId, clothingItemId));
                    ref.invalidate(getFolderProvider(widget.folderId));
                    await ref.read(folderList.folderListNotifierProvider.notifier).removeClothingItemFromFolder(widget.folderId, clothingItemId);
                    ref.invalidate(folderList.folderListNotifierProvider);
                    if(mounted){
                      context.router.maybePop();
                    }

                  },
                  child: Text('Remove'))
            ],
          );
        });
  }

  Widget _buildEmptyCloset() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => context.router
              .push(PickOwnedClothesRoute(folderId: widget.folderId)),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.lightGreenAccent),
            child: Icon(Icons.add),
          ),
        ),
        Center(child: Text("Empty closet", style: headline)),
      ],
    );
  }

  Widget _tags() {
    final tags = ["Tag1", "Tag2", "Tag3"];
    return Tags(
      itemCount: tags.length,
      horizontalScroll: true,
      itemBuilder: (int index) {
        final item = tags[index];
        return ItemTags(
          index: index,
          title: item,
          active: true,
          textStyle: TextStyle(fontSize: 14),
          elevation: 5,
          borderRadius: BorderRadius.circular(8),
        );
      },
    );
  }
}
