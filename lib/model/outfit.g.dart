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
          ?.map((e) => (e as num).toInt())
          .toList(),
      userTags: (json['user_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      defaultTags: (json['default_tags_id'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$OutfitImplToJson(_$OutfitImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_url': instance.imageUrl,
      'season': instance.season,
      'useditemsids': instance.clothingItemList,
      'user_tags': instance.userTags,
      'default_tags_id': instance.defaultTags,
    };
