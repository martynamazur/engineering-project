import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/presentation/styles/selectable_category_tile.dart';

import '../../domain/state_management/clothes_category_provider.dart';
import '../../model/clothing_item.dart';
import 'headline_text.dart';



class PickCategoryWidget extends ConsumerStatefulWidget {
  final int? clothingItemCategoryId;
  final ValueChanged<int?> onCategoryChanged;

  PickCategoryWidget(
      this.clothingItemCategoryId,
      this.onCategoryChanged, {Key? key}) : super(key: key);

  @override
  ConsumerState<PickCategoryWidget> createState() => _PickCategoryWidgetState();
}

class _PickCategoryWidgetState extends ConsumerState<PickCategoryWidget> {
  int? _pickedCategory;

  @override
  void initState() {
    super.initState();
    _pickedCategory = widget.clothingItemCategoryId;
  }

  @override
  Widget build(BuildContext context) {
    final categoryList = ref.watch(getClothesCategoryProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: categoryList.when(
        data: (categories) {
          if (categories.isEmpty) {
            return const Center(child: Text("No categories available"));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pick category', style: headline32),
              SizedBox(height: 8.0),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Ilość kolumn
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.8, // Stosunek szerokości do wysokości komórek
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];

                  return SelectableCategoryTile(
                    categoryName: category.categoryName,
                    imagePath: category.imagePath,
                    isSelected: _pickedCategory == category.id,
                    onTap: () {
                      //
                      setState(() {
                        _pickedCategory = _pickedCategory == category.id ? null : category.id;
                        print("Category : $_pickedCategory");
                        widget.onCategoryChanged(_pickedCategory);
                      });
                    },
                  );
                },
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text("Error: $error")),
      ),
    );
  }

 
}

