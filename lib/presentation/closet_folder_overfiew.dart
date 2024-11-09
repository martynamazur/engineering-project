import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:ootd/model/closet_folder.dart';
import 'package:ootd/navigation/app_router.dart';
import '../domain/state_management/clothes_folder_provider.dart';
import '../model/clothing_item.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

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
  @override
  Widget build(BuildContext context) {
    final closetFolder = ref.watch(getFolderProvider(widget.folderId));
    int? selectedValue;

    return Scaffold(
      body: SafeArea(
        child: closetFolder.when(
          data: (folder) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  AppBar(
                    title: Text(
                        '${folder.closetName}  (${folder.totalAmountOfClothes})'),
                    actions: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.filter_list_alt)),
                      DropdownButton(
                          icon: Icon(Icons.edit),
                          value: selectedValue,
                          items: [
                            DropdownMenuItem(value: 1, child: Text('Change folder name')),
                            DropdownMenuItem(value: 2, child: Text('Delete folder')),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value;
                            });

                            switch(value){
                              case 1:
                                showAlertDialogChangeFolderName();
                                break;
                              case 2:
                                showAlertDialog();
                            }

                          })
                    ],
                  ),
                  //_tags(),
                  _clothesGrid(folder.clothingItems)
                ],
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('Error: $error')),
        ),
      ),
    );
  }

  void showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure ?'),
          content: Text('This action will be permanent and cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () async{
                ref.read(deleteFolderProvider(widget.folderId));
                if(mounted){
                  context.router.pop();
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
            mainAxisSize: MainAxisSize.min, // Dostosowuje rozmiar kolumny do zawartości
            children: [
              Text('Please enter the new folder name:'),
              SizedBox(height: 10), // Dodaje trochę przestrzeni
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
                  ref.read(changeFolderNameProvider(_controller.text, widget.folderId));

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


  Widget _tags() {
    final List<String>? tags = [
      "Tag1",
      "Tag2",
      "Tag3",
      "Tag4",
      "Tag5",
      "Tag6"
    ]; // Example, might be pulled from DataList

    if (tags == null || tags.isEmpty) {
      return Center(
        child: Text("Brak tagów do wyświetlenia"),
      );
    }

    return Tags(
      itemCount: tags.length,
      horizontalScroll: true,
      itemBuilder: (int index) {
        final item = tags[index];
        return ItemTags(
          index: index,
          title: item,
          active: true,
          pressEnabled: false,
          textStyle: TextStyle(fontSize: 14),
          elevation: 5,
          borderRadius: BorderRadius.circular(8),
        );
      },
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
                        child: _buildClothingItemTile(clothingItem, context))));
          },
        ),
      ),
    );
  }

  Widget _buildClothingItemTile(
      ClothingItem clothingItem, BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigator.pushNamed(context, 'routeName');
        context.router
            .push(ClothingItemOverviewRoute(clothingItem: clothingItem));
      },
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
}
