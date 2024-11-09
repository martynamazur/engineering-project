
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clothes_category.freezed.dart';
part 'clothes_category.g.dart';

@freezed
class ClothesCategory with _$ClothesCategory {
  const factory ClothesCategory({
    required int id,
    @JsonKey(name: 'categoryname') required String categoryName,
    @JsonKey(name: 'categoryicon') required String imagePath,
    @Default(false) bool isSelected,

  }) = _ClothesCategory;



  factory ClothesCategory.fromJson(Map<String, dynamic> json) =>
      _$ClothesCategoryFromJson(json);
}