import 'package:ootd/extensions/localization_extension.dart';
import 'package:riverpod/riverpod.dart';

import '../../model/clothes_category.dart';
import '../../model/template.dart';

class GalleryNotifier extends StateNotifier<List<ClothesCategory>> {

  GalleryNotifier() : super([]);

  void setCategories(List<ClothesCategory> categories) {
    state = categories;
  }

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
