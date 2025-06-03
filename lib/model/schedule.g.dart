// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleImpl _$$ScheduleImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleImpl(
      id: json['schedule_id'] as String?,
      scheduleDate: DateTime.parse(json['schedule_date'] as String),
      scheduleTime: json['schedule_time'] as String,
      outfitId: (json['outfit_id'] as num?)?.toInt(),
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$$ScheduleImplToJson(_$ScheduleImpl instance) =>
    <String, dynamic>{
      'schedule_id': instance.id,
      'schedule_date': instance.scheduleDate.toIso8601String(),
      'schedule_time': instance.scheduleTime,
      'outfit_id': instance.outfitId,
      'image_url': instance.imageUrl,
    };
