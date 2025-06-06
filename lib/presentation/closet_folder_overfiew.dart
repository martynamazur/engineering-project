import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/extensions/localization_extension.dart';
import 'package:ootd/navigation/app_router.dart';
import 'package:ootd/presentation/styles/headline_text.dart';
import '../domain/state_management/clothes_folder_provider.dart';
import '../domain/state_management/clothing_list_notifier.dart';
import '../model/clothing_item.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ootd/domain/state_management/folder_list_notifier.dart' as folderList;

import '../model/result.dart';

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
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    final closetFolder = ref.watch(getFolderProvider(widget.folderId));
    final clothingList = ref.watch(clothingListNotifierProvider(widget.folderId));


    return Scaffold(
      appBar: AppBar(
        title: closetFolder.when(
          data: (folder) {
            return Text('${folder.closetName} (${ folder.totalAmountOfClothes})');
          },
          loading: () => const Text('Loading...'),
          error: (error, _) => const Text('Error'),
        ),
        actions: _buildActionBar(),
      ),
      body: SafeArea(
        child: closetFolder.when(
          data: (folder) {
            return folder.clothingItems.isNotEmpty
                ? _buildClothesList(clothingList)
                : _buildEmptyCloset();
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('Error: $error')),
        ),
      ),
    );
  }

  List<Widget> _buildActionBar() {
    return [
      IconButton(
        onPressed: () {
          _openFilterDialog();
        },
        icon: Icon(_isSelected ? Icons.filter_list_off : Icons.filter_list_alt, color: _isSelected ? Colors.red :null),
      ),

      IconButton(
        onPressed: () => context.router.push(PickOwnedClothesRoute(folderId: widget.folderId)),
        icon: const Icon(Icons.add),
      ),
      SizedBox(
        width: 40,
        child: PopupMenuButton<int>(
          onSelected: (value) {
            switch (value) {
              case 1:
                showChangeFolderNameDialog();
                break;
              case 2:
                showDeleteFolderDialog();
                break;
            }
          },
          icon: const Icon(Icons.edit),
          itemBuilder: (BuildContext context) => [
            PopupMenuItem<int>(
              value: 1,
              child: Text(context.loc.changeFolderName),
            ),
            PopupMenuItem<int>(
              value: 2,
              child: Text(context.loc.deleteFolder),
            ),
          ],
        ),
      )

    ];
  }


  Widget _buildEmptyCloset() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => context.router.push(PickOwnedClothesRoute(folderId: widget.folderId)),
          child: Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.lightGreenAccent),
            child: const Icon(Icons.add),
          ),
        ),
        Center(child: Text(context.loc.emptyCloset, style: headline)),
      ],
    );
  }

  Widget _buildClothesList(AsyncValue<List<ClothingItem>> clothingItemsList) {
    return SingleChildScrollView(
      child: clothingItemsList.when(
        data: (data) => _clothesGrid(data),
        error: (Object error, StackTrace stackTrace) => Text('Error $error'),
        loading: () => const CircularProgressIndicator()
      )
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

  Widget _buildClothingItemTile(ClothingItem clothingItem, BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(ClothingItemOverviewRoute(clothingItem: clothingItem)),
      onLongPress: () => _showRemoveFromFolderDialog(clothingItem.clothingItemId!),
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
                    return Center(child: Text(context.loc.imageNotAvailable));
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

  void _showRemoveFromFolderDialog(int clothingItemId) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(context.loc.removeFromFolderTitle),
            content: Text(context.loc.removeFromFolderContent),
            actions: [
              TextButton(onPressed: () => context.router.maybePop(), child: Text(context.loc.cancel)),
              TextButton(
                  onPressed: () async {
                    final messenger =  ScaffoldMessenger.of(context);
                    final Result result = await ref.read(removeClothingItemFromFolderProvider(folderId:  widget.folderId, clothingItemId:  clothingItemId).future);
                    if(result.success){
                      messenger.showSnackBar(SnackBar(content: Text(context.loc.removeClothingSuccess)));
                      ref.invalidate(getFolderProvider(widget.folderId));
                      await ref.read(folderList.folderListNotifierProvider.notifier).removeClothingItemFromFolder(widget.folderId, clothingItemId);
                      ref.invalidate(folderList.folderListNotifierProvider);

                      if(mounted){
                        context.router.maybePop();
                      }
                    }else{
                      messenger.showSnackBar(SnackBar(content: Text(context.loc.removeClothingFailure)));
                    }
                  },
                  child: Text(context.loc.remove))
            ],
          );
        });
  }

  void showDeleteFolderDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.loc.areYouSure),
          content: Text(context.loc.deleteConfirmation),
          actions: [
            TextButton(
              onPressed: () async {
                final messenger =  ScaffoldMessenger.of(context);
                final navigator = Navigator.of(context);

                if (mounted) {
                  final Result result = await ref.read(deleteFolderProvider(folderId:  widget.folderId).future);
                  if(result.success){
                    messenger.showSnackBar(SnackBar(content: Text(context.loc.deleteFolderSuccess)));
                  }else{
                    messenger.showSnackBar(SnackBar(content: Text(context.loc.deleteFolderFailure)));
                  }

                  ref.invalidate(folderList.folderListNotifierProvider);
                  navigator.pop();
                  context.router.maybePop();
                }
              },
              child: Text(context.loc.delete),
            ),
          ],
        );
      },
    );
  }

  void showChangeFolderNameDialog() {
    final _controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.loc.changeFolderNameTitle),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(context.loc.enterNewFolderName),
              const SizedBox(height: 10),
              TextField(
                controller: _controller,
                decoration: InputDecoration(hintText:context.loc.folderNameHint),
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
                final messenger =  ScaffoldMessenger.of(context);
                final navigator = Navigator.of(context);
                if (_controller.text.isNotEmpty) {

                  final Result result = await ref.read(changeFolderNameProvider(newFolderName:  _controller.text, folderId:  widget.folderId).future);

                  if(result.success){
                    messenger.showSnackBar(SnackBar(content: Text(context.loc.changeSuccess)));
                    await ref.read(folderList.folderListNotifierProvider.notifier).updateFolderName(widget.folderId,_controller.text);
                    ref.invalidate(getFolderProvider(widget.folderId)); //odswiezac dane, pobieram cala liste ponownie
                    ref.invalidate(folderListNotifierProvider);//odswiezam home

                  }else{
                    messenger.showSnackBar(SnackBar(content: Text(context.loc.changeFailure)));
                  }
                }
                if (mounted) {
                  navigator.pop();
                }
              },
              child: Text(context.loc.change),
            ),
          ],
        );
      },
    );
  }

  void _openFilterDialog() {
    final availableCategories = [
      'Odzież wierzchnia',
      'Odzież górna',
      'Odzież dolna',
      'Sukienki i kombinezony',
      'Bielizna',
      'Akcesoria',
      'Obuwie'
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        minChildSize: 0.1,
        maxChildSize: 0.9,
        expand: true,
        builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            controller: scrollController,
            children: <Widget>[
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10.0,

                children: [
                TextButton(
                    onPressed: () => context.router.maybePop(),
                    child:  Row(
                      children: [
                        Text(context.loc.exit),
                        const Icon(Icons.fullscreen_exit)
                      ],
                    )
                ),
                Text(context.loc.selectCategory),
                TextButton(onPressed: () => ref.read(clothingListNotifierProvider(widget.folderId).notifier).resetFilters(),
                    child: Row(
                      children: [
                        Text(context.loc.clear),
                        const Icon(Icons.fullscreen_exit)
                      ],
                    )),
              ],),
              const SizedBox(height: 16.0),
              ...availableCategories.asMap().map((index, category) {
                return MapEntry(
                  index,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _isSelected = true;
                        });
                        ref.read(clothingListNotifierProvider(widget.folderId).notifier).filterByCategory(index+1);
                        context.router.maybePop();
                      },
                      child: Text(category),
                    ),
                  ),
                );
              }).values,
              // itd...
            ],
          ),
        ),
      ),
    );
  }

}
