// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TagImpl _$$TagImplFromJson(Map<String, dynamic> json) => _$TagImpl(
      tagId: (json['id'] as num).toInt(),
      tagName: json['tag_name'] as String,
      tagImagePath: json['tag_image_path'] as String,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$TagImplToJson(_$TagImpl instance) => <String, dynamic>{
      'id': instance.tagId,
      'tag_name': instance.tagName,
      'tag_image_path': instance.tagImagePath,
      'isSelected': instance.isSelected,
    };
