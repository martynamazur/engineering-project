// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clothing_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClothingItemImpl _$$ClothingItemImplFromJson(Map<String, dynamic> json) =>
    _$ClothingItemImpl(
      clothingItemId: (json['clothing_item_id'] as num?)?.toInt(),
      itemPhoto: json['item_photo'] as String,
      itemType: json['item_type'] as String?,
      itemCategory: json['item_category'] as String?,
      itemCategoryId: (json['item_category_id'] as num?)?.toInt(),
      itemSeason: (json['item_season_id'] as num?)?.toInt(),
      seasons: (json['seasons'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$SeasonEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$ClothingItemImplToJson(_$ClothingItemImpl instance) =>
    <String, dynamic>{
      'clothing_item_id': instance.clothingItemId,
      'item_photo': instance.itemPhoto,
      'item_type': instance.itemType,
      'item_category': instance.itemCategory,
      'item_category_id': instance.itemCategoryId,
      'item_season_id': instance.itemSeason,
      'seasons': instance.seasons?.map((e) => _$SeasonEnumMap[e]!).toList(),
    };

const _$SeasonEnumMap = {
  Season.winter: 'winter',
  Season.spring: 'spring',
  Season.summer: 'summer',
  Season.autumn: 'autumn',
};
