// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clothes_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClothesCategoryImpl _$$ClothesCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$ClothesCategoryImpl(
      id: (json['id'] as num).toInt(),
      categoryName: json['categoryname'] as String,
      imagePath: json['categoryicon'] as String,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$ClothesCategoryImplToJson(
        _$ClothesCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryname': instance.categoryName,
      'categoryicon': instance.imagePath,
      'isSelected': instance.isSelected,
    };
