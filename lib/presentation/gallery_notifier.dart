import 'package:riverpod/riverpod.dart';

import '../model/clothes_category.dart';
import '../model/template.dart';
// Ensure this import points to where your ClothesCategory class is defined

class GalleryNotifier extends StateNotifier<List<ClothesCategory>> {

  GalleryNotifier() : super([
    ClothesCategory(id: 1,
        categoryName: 'Top',
        imagePath: 'assets/category_icon/category_icon_test.png'),
    ClothesCategory(id: 2,
        categoryName: 'Bottom',
        imagePath: 'assets/category_icon/category_icon_test.png'),
    ClothesCategory(id: 3,
        categoryName: 'Accessories',
        imagePath: 'assets/category_icon/category_icon_test.png'),
    ClothesCategory(id: 4,
        categoryName: 'Top',
        imagePath: 'assets/category_icon/category_icon_test.png'),
    ClothesCategory(id: 5,
        categoryName: 'Bottom',
        imagePath: 'assets/category_icon/category_icon_test.png'),
    ClothesCategory(id: 6,
        categoryName: 'Accessories',
        imagePath: 'assets/category_icon/category_icon_test.png'),
    ClothesCategory(id: 7,
        categoryName: 'Accessories',
        imagePath: 'assets/category_icon/category_icon_test.png'),
    ClothesCategory(id: 8,
        categoryName: 'Top',
        imagePath: 'assets/category_icon/category_icon_test.png'),
    ClothesCategory(id: 9,
        categoryName: 'Bottom',
        imagePath: 'assets/category_icon/category_icon_test.png'),
    ClothesCategory(id: 10,
        categoryName: 'Accessories',
        imagePath: 'assets/category_icon/category_icon_test.png')
    ,
  ]);

  void initializeFromTemplate(Template template) {
    state = state.map((category) {
      final isSelected = template.values.contains(category.id);
      return category.copyWith(isSelected: isSelected);
    }).toList();
  }

  void toggleCategory(int id) {
    state = state.map((category) {
      if (category.id == id) {
        return category.copyWith(isSelected: !category.isSelected);
      }
      return category;
    }).toList();
  }

}
final galleryProvider = StateNotifierProvider<GalleryNotifier, List<ClothesCategory>>(
      (ref) => GalleryNotifier(),
);
