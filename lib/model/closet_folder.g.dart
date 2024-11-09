// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'closet_folder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClosetFolderImpl _$$ClosetFolderImplFromJson(Map<String, dynamic> json) =>
    _$ClosetFolderImpl(
      closetId: (json['closet_id'] as num).toInt(),
      closetName: json['closet_name'] as String,
      totalAmountOfClothes: (json['total_amount_of_clothes'] as num).toInt(),
      clothingItemIds: (json['clothing_item_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      clothingItems: (json['clothingItems'] as List<dynamic>?)
              ?.map((e) => ClothingItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ClosetFolderImplToJson(_$ClosetFolderImpl instance) =>
    <String, dynamic>{
      'closet_id': instance.closetId,
      'closet_name': instance.closetName,
      'total_amount_of_clothes': instance.totalAmountOfClothes,
      'clothing_item_ids': instance.clothingItemIds,
      'clothingItems': instance.clothingItems,
    };
