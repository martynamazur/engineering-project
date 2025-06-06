

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

@freezed
class Schedule with _$Schedule {
  const factory Schedule({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'schedule_date') required DateTime scheduleDate,
    @JsonKey(name: 'schedule_time') required String scheduleTime,


    @JsonKey(name: 'outfit_id') int? outfitId,
    @JsonKey(name: 'image_url') required String imageUrl

  }) = _Schedule;
  
  

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
}