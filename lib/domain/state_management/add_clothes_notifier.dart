import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ClothesModel extends ChangeNotifier {
  int? _selectedCategoryId;
  XFile? _selectedImage;

  int? get selectedCategoryId => _selectedCategoryId;
  XFile? get selectedImage => _selectedImage;

  void selectCategory(int id) {
    _selectedCategoryId = id;
    notifyListeners();
  }

  void selectImage(XFile image) {
    _selectedImage = image;
    notifyListeners();
  }
}


final clothesModelProvider = ChangeNotifierProvider((ref) => ClothesModel());
