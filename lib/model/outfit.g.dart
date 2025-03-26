// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outfit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OutfitImpl _$$OutfitImplFromJson(Map<String, dynamic> json) => _$OutfitImpl(
      id: (json['id'] as num).toInt(),
      imageUrl: json['image_url'] as String,
      season: json['season'] as String,
      clothingItemList: (json['useditemsids'] as List<dynamic>?)
          ?.map((e) => ClothingItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      userTags: (json['userTags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultTags: (json['defaultTags'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$OutfitImplToJson(_$OutfitImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_url': instance.imageUrl,
      'season': instance.season,
      'useditemsids': instance.clothingItemList,
      'userTags': instance.userTags,
      'defaultTags': instance.defaultTags,
    };
