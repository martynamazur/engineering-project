import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ootd/model/clothing_item.dart';
import 'package:ootd/model/tag.dart';

part 'outfit.freezed.dart';
part 'outfit.g.dart';

@freezed
class Outfit with _$Outfit {
  const factory Outfit({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'season') required String season,
    @JsonKey(name: 'useditemsids') List<ClothingItem>? clothingItemList,
    @JsonKey(name: 'userTags') List<Tag>? userTags,
    @JsonKey(name: 'defaultTags') List<Tag>? defaultTags,
}) = _Outfit;



  factory Outfit.fromJson(Map<String, dynamic> json) =>
      _$OutfitFromJson(json);
}