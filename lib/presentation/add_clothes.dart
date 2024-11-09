import 'dart:io';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ootd/domain/state_management/category_provider.dart';

import 'package:ootd/model/clothing_item.dart';
import 'package:ootd/navigation/app_router.dart';
import 'package:ootd/presentation/styles/selectable_category_tile.dart';
import 'package:ootd/presentation/styles/selectable_season_tile.dart';

import '../domain/state_management/clothes_category_provider.dart';
import '../domain/state_management/clothes_provider.dart';
import '../domain/state_management/remove_bg_provider.dart';
import '../domain/state_management/season_provider.dart';
import '../domain/state_management/supabase_utils.dart';
import 'styles/headline_text.dart';

import 'package:linear_progress_bar/linear_progress_bar.dart';

@RoutePage()
class AddClothesScreen extends ConsumerStatefulWidget {
  const AddClothesScreen({super.key});

  @override
  ConsumerState createState() => _AddClothesState();
}

class _AddClothesState extends ConsumerState<AddClothesScreen> {
  late final PageController _pageController;
  late final ImagePicker _picker;
  final int _lastPage = 3;
  int _currentPage = 0;
  XFile? _image;

  List<Season> _pickedSeasons = [];
  int? _pickedCategory;
  int? pickedSeason;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _picker = ImagePicker();
  }

  @override
  void dispose() {
    _currentPage = 0;
    _image = null;
    _pickedSeasons.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            LinearProgressBar(
                maxSteps: 3,
                progressType: LinearProgressBar.progressTypeLinear,
                currentStep: _currentPage,
                progressColor: Color(0xFFD1E64B),
                backgroundColor: Colors.grey,
                borderRadius: BorderRadius.circular(10)),
            Expanded(
                child: PageView(
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              controller: _pageController,
              children: [
                _pickClothesFromGallery(),
                _pickCategory(),
                _pickSeason(),
                _finalize()
              ],
            )),
            if (_currentPage != _lastPage) _navigation()
          ],
        ),
      ),
    );
  }

  Widget _pickClothesFromGallery() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Add photo', style: headline32),
          SizedBox(height: 20),
          _buildImageView(),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                onPressed: _pickImageFromGallery, child: Text('Choose photo')),
          ),
          SizedBox(height: 20),
        ],
      ),
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
                  children: [Text('No image selected'), Icon(Icons.add)],
                ))),
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
    }
  }

  Widget _pickCategory() {
    final categoryList = ref.watch(getClothesCategoryProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pick category', style: headline32),
              SizedBox(height: 8.0),
              categoryList.when(
                data: (categories) {
                  return GridView.builder(
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
                      bool isSelected = _pickedCategory == category.id;

                      return SelectableCategoryTile(
                        categoryName: category.categoryName,
                        imagePath: category.imagePath,
                        isSelected: isSelected,
                        onTap: () {
                          setState(() {
                            isSelected = !isSelected;
                          });

                          _pickedCategory = category.id;
                          print(_pickedCategory);
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

  Widget _pickSeason() {
    final seasonList = ref.watch(seasonRepositoryProvider).getSeason();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Season', style: headline32),
          Text('Pick appropriate seasons ', style: headline),
          SizedBox(height: 24),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 6.0,
              mainAxisSpacing: 6.0,
            ),
            itemCount: seasonList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final season = seasonList[index];
              bool isSelected = _pickedSeasons.contains(season);
              return SelectableSeasonTile(
                season: season,
                isSelected: isSelected,
                onTap: () {
                    final seasonMap = {
                      1: Season.winter,
                      2: Season.spring,
                      3: Season.summer,
                      4: Season.autumn,
                    };

                    final selectedSeason = seasonMap[season.id];

                    if (selectedSeason != null) {
                      setState(() {
                        if (_pickedSeasons.contains(selectedSeason)) {
                          _pickedSeasons.remove(selectedSeason);
                          isSelected =  false;
                        } else {
                          _pickedSeasons.add(selectedSeason);
                          isSelected = true;
                        }
                      });
                    }

                    print('Wybrane sezony: $_pickedSeasons');

                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _finalize() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Summary', style: headline32),
          Expanded(
            child: _image != null
                ? Image.file(
                    File(_image!.path),
                    fit: BoxFit.cover,
                  )
                : Text('No image selected'),
          ),
          SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {}, child: Text('Add another one'))),
          SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {
                    saveClothingItemToDatabase();
                    AutoTabsRouter.of(context).setActiveIndex(1);
                    dispose();
                  },
                  child: Text('Finish')))
        ],
      ),
    );
  }

  Future<void> saveClothingItemToDatabase() async {
    final Uint8List? imageData = await _image?.readAsBytes();

    final selectedCategoryId = ref.watch(selectedCategoryProvider);
    final imageUrl = await ref
        .read(supabaseUtilsProvider)
        .uploadImageAndReturnUrl(imageData!);

    final clothingItem = ClothingItem(
        itemPhoto: imageUrl,
        itemSeason: 1,
        itemCategoryId: selectedCategoryId,
        seasons: _pickedSeasons);

    ref.read(clothesRepositoryProvider).addClothingItem(clothingItem);
  }

  Widget _navigation() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
              onPressed: () {
                _pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
              child: Text('Cofnij')),
        ),
        SizedBox(width: 12.0,),
        Expanded(
          child: OutlinedButton(
              onPressed: () {
                _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
              child: Text('Dalej')),
        )
      ],
    );
  }
}
