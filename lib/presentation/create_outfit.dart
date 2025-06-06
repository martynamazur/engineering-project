
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
import 'package:ootd/extensions/localization_extension.dart';
import 'package:ootd/navigation/app_router.dart';
import 'package:ootd/presentation/styles/headline_text.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import '../domain/state_management/outfit_list_notifier.dart';
import '../model/clothes_category.dart';
import '../model/result.dart';
import '../model/template.dart';
import '../domain/state_management/gallery_notifier.dart';

@RoutePage()
class CreateOutfitScreen extends ConsumerStatefulWidget {

  final int _templateId;
  const CreateOutfitScreen({@PathParam('templateId') required int templateId, super.key}) : _templateId = templateId;

  @override
  ConsumerState<CreateOutfitScreen> createState() => _CreateOutfitScreenState();
}

class _CreateOutfitScreenState extends ConsumerState<CreateOutfitScreen> {
  final ScreenshotController _screenshotController = ScreenshotController();
  Map<int, int> _selectedClothingItems = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {

      final categoryList = [
        ClothesCategory(id: 1, categoryName: context.loc.coat, imagePath: 'assets/category_icon/category_icon_test.png'),
        ClothesCategory(id: 2, categoryName: context.loc.top, imagePath: 'assets/category_icon/category_icon_test.png'),
        ClothesCategory(id: 3, categoryName: context.loc.bottom, imagePath: 'assets/category_icon/category_icon_test.png'),
        ClothesCategory(id: 4, categoryName: context.loc.dress, imagePath: 'assets/category_icon/category_icon_test.png'),
        ClothesCategory(id: 5, categoryName: context.loc.underwear, imagePath: 'assets/category_icon/category_icon_test.png'),
        ClothesCategory(id: 8, categoryName: context.loc.accessories, imagePath: 'assets/category_icon/category_icon_test.png'),
        ClothesCategory(id: 9, categoryName: context.loc.shoes, imagePath: 'assets/category_icon/category_icon_test.png'),
      ];

      ref.read(galleryProvider.notifier).setCategories(categoryList);
      final templateType = TemplateType.values[widget._templateId - 1];
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
                  const Icon(Icons.save_as),
                  Text(context.loc.save),
                ],
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Screenshot(
            controller: _screenshotController,
            child: Center(
              child: Column(
                children: [
                  if (selectedCategories.isEmpty)
                    _buildEmptyGallery()
                  else
                    for (var category in selectedCategories)
                      _buildCarouselSlider(category, ref)
                ],
              ),
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
              tooltip: category.categoryName,
              child: Icon(
                category.isSelected ? Icons.check_box : Icons.check_box_outline_blank,
              ),
            ),
            const SizedBox(width: 8),
            Image.asset(category.imagePath, width: 18, height: 18),
            const SizedBox(width: 8),
            Text(
              category.categoryName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]);
        }).toList(),
      ),
    );
  }

  Widget _buildEmptyGallery() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(context.loc.addNewPieces, style: headline)
      ],
    );
  }

  Widget _buildCarouselSlider(ClothesCategory category, WidgetRef ref) {
    final clothingItemsAsyncValue = ref.watch(getCategoryClothingItemProvider(categoryId:  category.id));

    return clothingItemsAsyncValue.when(
      data: (clothingItems) {
        if (clothingItems.isEmpty) {
          return Center(child: Text('${context.loc.noItemsFound}} ${category.categoryName}'));
        }
        if (!_selectedClothingItems.containsKey(category.id) && clothingItems.isNotEmpty) {
          _selectedClothingItems[category.id] = clothingItems.first.clothingItemId!;
        }


        return CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            onPageChanged: (index, reason){
              _selectedClothingItems[category.id] = clothingItems[index].clothingItemId!;
            }
          ),
          items: clothingItems.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Image.network(
                    item.itemPhoto,
                    fit: BoxFit.contain,
                    errorBuilder: (BuildContext context,_, StackTrace? stackTrace) {
                      return Text(context.loc.failedToLoadImage);
                    },
                  ),
                );
              },
            );
          }).toList(),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
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
      final messenger = ScaffoldMessenger.of(context);
      final Uint8List? image = await _screenshotController.capture();

      if (image != null) {
        final List<int> clothingItemIds = _selectedClothingItems.values.toList();

        final response = await ref.read(supabaseUtilsProvider).uploadImageAndReturnUrl(image);

        final Result result = await ref.watch(saveOutfitProvider(imageUrl:response,clothingItemId:clothingItemIds).future);

        if(result.success){
          messenger.showSnackBar(SnackBar(content: Text(context.loc.saveOutfitSuccess)));

          ref.invalidate(getOwnedOutfitsProvider);
          ref.invalidate(outfitListNotifierProvider);

          context.router.push(const CreatedOutfitSuccessfulRoute());
        }else{
          messenger.showSnackBar(SnackBar(content: Text(context.loc.saveOutfitFailure)));
        }
      }
    } catch (e) {
      print("Error capturing image: $e");
    }
  }
}

