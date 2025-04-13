
import 'dart:io';
import 'dart:typed_data';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ootd/domain/state_management/clothes_category_provider.dart';
import 'package:ootd/domain/state_management/outfit_provider.dart';
import 'package:ootd/domain/state_management/supabase_utils.dart';
import 'package:ootd/navigation/app_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import '../model/clothes_category.dart';
import '../model/template.dart';
import 'gallery_notifier.dart';

@RoutePage()
class CreateOutfitScreen extends ConsumerStatefulWidget {

  final int templateId;
  const CreateOutfitScreen({@PathParam('templateId') required this.templateId, super.key});

  @override
  ConsumerState<CreateOutfitScreen> createState() => _CreateOutfitScreenState();
}

class _CreateOutfitScreenState extends ConsumerState<CreateOutfitScreen> {
  final ScreenshotController screenshotController = ScreenshotController();
  Map<int, int> selectedClothingItems = {};
  @override
  void initState() {
    super.initState();

    // Inicjalizacja po zbudowaniu widgetu
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final templateType = TemplateType.values[widget.templateId - 1];
      final template = templates.firstWhere((t) => t.type == templateType);
      ref.read(galleryProvider.notifier).initializeFromTemplate(template);
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(galleryProvider);
    final selectedCategories = categories.where((category) => category.isSelected).toList();
    List<int> clothingItemId = [];

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => saveOutfit(clothingItemId),
              child: Row(
                children: [
                  Icon(Icons.save_as),
                  Text('Save'),
                ],
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Screenshot(
            controller: screenshotController,
            child: Column(
              children: [
                if (selectedCategories.isEmpty)
                  _emptyGallery()
                else
                  for (var category in selectedCategories)
                    _carouselSlider(category, ref)

              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        key: GlobalKey<ExpandableFabState>(),
        type: ExpandableFabType.up,
        childrenAnimation: ExpandableFabAnimation.none,
        distance: 70,
        overlayStyle: ExpandableFabOverlayStyle(
          color: Colors.white.withOpacity(0.9),
        ),
        children: categories.map((category) {
          return Row(mainAxisSize: MainAxisSize.min, children: [
            FloatingActionButton.small(
              onPressed: () {
                ref.read(galleryProvider.notifier).toggleCategory(category.id);
              },
              child: Icon(
                category.isSelected ? Icons.check_box : Icons.check_box_outline_blank,
              ),
              tooltip: category.categoryName,
            ),
            SizedBox(width: 8),
            Image.asset(category.imagePath, width: 18, height: 18),
            SizedBox(width: 8),
            Text(
              category.categoryName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]);
        }).toList(),
      ),
    );
  }

  Widget _emptyGallery() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Zacznij dodawac poszczegolne częsci')
      ],
    );
  }

  Widget _carouselSlider(ClothesCategory category, WidgetRef ref) {
    final clothingItemsAsyncValue = ref.watch(getCategoryClothingItemProvider(category.id));

    return clothingItemsAsyncValue.when(
      data: (clothingItems) {
        if (clothingItems.isEmpty) {
          return Center(child: Text('No items found for ${category.categoryName}'));
        }


        if (!selectedClothingItems.containsKey(category.id) && clothingItems.isNotEmpty) {
          selectedClothingItems[category.id] = clothingItems.first.clothingItemId!;
          print('$selectedClothingItems itemki default');
        }


        return CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            onPageChanged: (index, reason){
              selectedClothingItems[category.id] = clothingItems[index].clothingItemId!;
              print('$selectedClothingItems itemki');
            }
          ),
          items: clothingItems.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Image.network(
                    item.itemPhoto,
                    fit: BoxFit.contain,
                    errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                      return Text('Failed to load image');
                    },
                  ),
                );
              },
            );
          }).toList(),
        );
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }

  Future<String> getImagePath(Uint8List image ) async {
    final directory = await getTemporaryDirectory();
    final imagePath = '${directory.path}/outfit_image.jpg';
    final file = File(imagePath);
    await file.writeAsBytes(image);
    return imagePath;
    }

  void saveOutfit(List<int> clothingItemId) async {
    try {
      final Uint8List? image = await screenshotController.capture();
      if (image != null) {

        final List<int> clothingItemIds = selectedClothingItems.values.toList();
        final response = await ref.read(supabaseUtilsProvider).uploadImageAndReturnUrl(image);
        final result = ref.watch(saveOutfitProvider(response,clothingItemIds));
        print('Obiekt $result');

        context.router.push(CreatedOutiftSucesfullRoute());


      }
    } catch (e) {
      print("Error capturing image: $e");
    }
  }

  Widget _errorDialog(){
    return AlertDialog(title: Text('Try again'));
  }


}

