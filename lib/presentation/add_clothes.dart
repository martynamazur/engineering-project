import 'dart:io';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ootd/extensions/localization_extension.dart';

import 'package:ootd/model/clothing_item.dart';
import 'package:ootd/presentation/styles/selectable_category_tile.dart';
import 'package:ootd/presentation/styles/selectable_season_tile.dart';

import '../domain/state_management/clothes_category_provider.dart';
import '../domain/state_management/clothes_folder_provider.dart';
import '../domain/state_management/clothes_provider.dart';
import '../domain/state_management/remove_bg_provider.dart';
import '../domain/state_management/season_provider.dart';
import '../domain/state_management/supabase_utils.dart';
import '../utils/log.dart';
import 'styles/headline_text.dart';

import 'package:linear_progress_bar/linear_progress_bar.dart';

@RoutePage()
class AddClothesScreen extends ConsumerStatefulWidget {
  const AddClothesScreen({super.key});

  @override
  ConsumerState createState() => _AddClothesState();
}

class _AddClothesState extends ConsumerState<AddClothesScreen> {
  late final PageController _pageController =PageController();
  late final ImagePicker _picker = ImagePicker();


  int _currentPage = 0;
  final int _lastPage = 3;
  XFile? _image;

  List<Season> _pickedSeasons = [];
  int? _pickedCategory;
  //int? pickedSeason;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              LinearProgressBar(
                  maxSteps: 3,
                  progressType: LinearProgressBar.progressTypeLinear,
                  currentStep: _currentPage,
                  progressColor: const Color(0xFFD1E64B),
                  backgroundColor: Colors.grey,
                  borderRadius: BorderRadius.circular(10)),
              Expanded(
                  child: PageView(
                    onPageChanged: (int page) {
                      setState(() => _currentPage = page);
                },
                controller: _pageController,
                children: [
                  _buildPickClothesFromGallery(),
                  _buildPickCategory(),
                  _buildPickSeason(),
                  _buildFinalize()
                ],
              )),
              if (_currentPage != _lastPage) _buildPageNavigation()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPickClothesFromGallery() {
    return Column(
      spacing: 20.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.loc.addPhoto, style: headline32),
        _buildImageView(),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
              onPressed: _pickImageFromGallery,
              child: Text(context.loc.choosePhoto)
          ),
        ),
      ],
    );
  }

  Widget _buildImageView() {
    return _image != null
        ? Image.file(
            File(_image!.path),
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          )
        : GestureDetector(
            onTap: _pickImageFromGallery,
            child: Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                    style: BorderStyle.solid
                  )
                ),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(context.loc.noImageSelected),
                    const Icon(Icons.add)
                  ],
                ))),
          );
  }

  Widget _buildPickCategory() {
    final categoryList = ref.watch(getClothesCategoryProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.loc.pickCategoryHeadline, style: headline32),
              const SizedBox(height: 8.0),
              categoryList.when(
                data: (categories) {
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: categories.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,
                    ),
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      //bool isSelected = _pickedCategory == category.id;

                      return SelectableCategoryTile(
                        categoryName: category.categoryName,
                        imagePath: category.imagePath,
                        isSelected: _pickedCategory == category.id,
                        onTap: () {
                          setState(() {
                            _pickedCategory = _pickedCategory == category.id ? null : category.id;
                            logger.i("Category : $_pickedCategory");
                          });
                        },
                      );
                    },
                  );
                },
                error: (e, st) => const Text('Ups, coś poszło nie tak.'),
                loading: () => const CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPickSeason() {
    final seasonList = ref.watch(seasonRepositoryProvider).getSeason();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 24.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.loc.seasonHeader, style: headline32),
          Text(context.loc.seasonSubheader, style: headline),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 6.0,
              mainAxisSpacing: 6.0,
            ),
            itemCount: seasonList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final season = seasonList[index];
              final seasonMap = {
                1: Season.winter,
                2: Season.spring,
                3: Season.summer,
                4: Season.autumn,
              };
              return SelectableSeasonTile(
                season: season,
                isSelected: _pickedSeasons.contains(seasonMap[season.id]),
                onTap: () {
                    final selectedSeason = seasonMap[season.id];
                    if (selectedSeason != null) {
                      setState(() {
                        if (_pickedSeasons.contains(selectedSeason)) {
                          _pickedSeasons.remove(selectedSeason);
                          print(_pickedSeasons.contains(season));
                        } else {
                          _pickedSeasons.add(selectedSeason);
                        }
                      });
                    }
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFinalize() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(context.loc.summary, style: headline32),
          Expanded(
            child: _image != null
                ? Image.file(
                    key: UniqueKey(),
                    File(_image!.path),
                    fit: BoxFit.cover,
                  )
                : Text(context.loc.noImageSelected),
          ),
          SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () async{
                    await _submitClothingItemForm();

                    setState(() {
                      _image = null;
                      _pickedCategory = null;
                      _pickedSeasons.clear();
                      _pageController.jumpToPage(0);
                    });
                  }, child: Text(context.loc.addAnother)
              )
          ),
          SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () async{
                    await _submitClothingItemForm();
                    context.router.maybePop();
                  },
                  child: Text(context.loc.finish)))
        ],
      ),
    );
  }

  Widget _buildPageNavigation() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
              onPressed: () {
                _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
              child: Text(context.loc.goBack)),
        ),
        const SizedBox(width: 12.0,),
        Expanded(
          child: OutlinedButton(
              onPressed: () {
                _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
              child: Text(context.loc.next)),
        )
      ],
    );
  }

  void _pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final file = File(image.path);
      final result = await ref.read(removePhotoBackgroundProvider(file).future);

      setState(() {
        _image = result != null ? XFile(result.path) : null;
      });

    }}

  Future<void> _submitClothingItemForm() async {
    final Uint8List? imageData = await _image?.readAsBytes();

    final imageUrl = await ref
        .read(supabaseUtilsProvider)
        .uploadImageAndReturnUrl(imageData!);


    final clothingItem = ClothingItem(
        itemPhoto: imageUrl,
        itemCategoryId: _pickedCategory,
        seasons: _pickedSeasons);

    await ref.read(clothesRepositoryProvider).addClothingItem(clothingItem);
    ref.refresh(folderListNotifierProvider);

  }
}
