import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clothing_item.freezed.dart';
part 'clothing_item.g.dart';

enum Season {
  winter,
  spring,
  summer,
  autumn,
}

@freezed
class ClothingItem with _$ClothingItem {
  const factory ClothingItem({
    @JsonKey(name: 'clothing_item_id') int? clothingItemId,
    //@JsonKey(name: 'item_name') required String itemName,
    @JsonKey(name: 'item_photo') required String itemPhoto,
    @JsonKey(name: 'item_type') String? itemType,

    @JsonKey(name: 'item_category') String? itemCategory,
    @JsonKey(name: 'item_category_id') int? itemCategoryId,
    @JsonKey(name: 'item_season_id') int? itemSeason,
    @JsonKey(name: 'seasons') List<Season>? seasons,


  }) = _ClothingItem;

  factory ClothingItem.fromJson(Map<String, dynamic> json) =>
      _$ClothingItemFromJson(json);


}
