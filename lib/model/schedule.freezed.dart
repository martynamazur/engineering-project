// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return _Schedule.fromJson(json);
}

/// @nodoc
mixin _$Schedule {
  @JsonKey(name: 'schedule_id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'schedule_date')
  DateTime get scheduleDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'schedule_time')
  String get scheduleTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'outfit_id')
  int? get outfitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this Schedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScheduleCopyWith<Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleCopyWith<$Res> {
  factory $ScheduleCopyWith(Schedule value, $Res Function(Schedule) then) =
      _$ScheduleCopyWithImpl<$Res, Schedule>;
  @useResult
  $Res call(
      {@JsonKey(name: 'schedule_id') String? id,
      @JsonKey(name: 'schedule_date') DateTime scheduleDate,
      @JsonKey(name: 'schedule_time') String scheduleTime,
      @JsonKey(name: 'outfit_id') int? outfitId,
      @JsonKey(name: 'image_url') String imageUrl});
}

/// @nodoc
class _$ScheduleCopyWithImpl<$Res, $Val extends Schedule>
    implements $ScheduleCopyWith<$Res> {
  _$ScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? scheduleDate = null,
    Object? scheduleTime = null,
    Object? outfitId = freezed,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleDate: null == scheduleDate
          ? _value.scheduleDate
          : scheduleDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scheduleTime: null == scheduleTime
          ? _value.scheduleTime
          : scheduleTime // ignore: cast_nullable_to_non_nullable
              as String,
      outfitId: freezed == outfitId
          ? _value.outfitId
          : outfitId // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleImplCopyWith<$Res>
    implements $ScheduleCopyWith<$Res> {
  factory _$$ScheduleImplCopyWith(
          _$ScheduleImpl value, $Res Function(_$ScheduleImpl) then) =
      __$$ScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'schedule_id') String? id,
      @JsonKey(name: 'schedule_date') DateTime scheduleDate,
      @JsonKey(name: 'schedule_time') String scheduleTime,
      @JsonKey(name: 'outfit_id') int? outfitId,
      @JsonKey(name: 'image_url') String imageUrl});
}

/// @nodoc
class __$$ScheduleImplCopyWithImpl<$Res>
    extends _$ScheduleCopyWithImpl<$Res, _$ScheduleImpl>
    implements _$$ScheduleImplCopyWith<$Res> {
  __$$ScheduleImplCopyWithImpl(
      _$ScheduleImpl _value, $Res Function(_$ScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? scheduleDate = null,
    Object? scheduleTime = null,
    Object? outfitId = freezed,
    Object? imageUrl = null,
  }) {
    return _then(_$ScheduleImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleDate: null == scheduleDate
          ? _value.scheduleDate
          : scheduleDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scheduleTime: null == scheduleTime
          ? _value.scheduleTime
          : scheduleTime // ignore: cast_nullable_to_non_nullable
              as String,
      outfitId: freezed == outfitId
          ? _value.outfitId
          : outfitId // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleImpl with DiagnosticableTreeMixin implements _Schedule {
  const _$ScheduleImpl(
      {@JsonKey(name: 'schedule_id') this.id,
      @JsonKey(name: 'schedule_date') required this.scheduleDate,
      @JsonKey(name: 'schedule_time') required this.scheduleTime,
      @JsonKey(name: 'outfit_id') this.outfitId,
      @JsonKey(name: 'image_url') required this.imageUrl});

  factory _$ScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleImplFromJson(json);

  @override
  @JsonKey(name: 'schedule_id')
  final String? id;
  @override
  @JsonKey(name: 'schedule_date')
  final DateTime scheduleDate;
  @override
  @JsonKey(name: 'schedule_time')
  final String scheduleTime;
  @override
  @JsonKey(name: 'outfit_id')
  final int? outfitId;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Schedule(id: $id, scheduleDate: $scheduleDate, scheduleTime: $scheduleTime, outfitId: $outfitId, imageUrl: $imageUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Schedule'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('scheduleDate', scheduleDate))
      ..add(DiagnosticsProperty('scheduleTime', scheduleTime))
      ..add(DiagnosticsProperty('outfitId', outfitId))
      ..add(DiagnosticsProperty('imageUrl', imageUrl));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.scheduleDate, scheduleDate) ||
                other.scheduleDate == scheduleDate) &&
            (identical(other.scheduleTime, scheduleTime) ||
                other.scheduleTime == scheduleTime) &&
            (identical(other.outfitId, outfitId) ||
                other.outfitId == outfitId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, scheduleDate, scheduleTime, outfitId, imageUrl);

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleImplCopyWith<_$ScheduleImpl> get copyWith =>
      __$$ScheduleImplCopyWithImpl<_$ScheduleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleImplToJson(
      this,
    );
  }
}

abstract class _Schedule implements Schedule {
  const factory _Schedule(
          {@JsonKey(name: 'schedule_id') final String? id,
          @JsonKey(name: 'schedule_date') required final DateTime scheduleDate,
          @JsonKey(name: 'schedule_time') required final String scheduleTime,
          @JsonKey(name: 'outfit_id') final int? outfitId,
          @JsonKey(name: 'image_url') required final String imageUrl}) =
      _$ScheduleImpl;

  factory _Schedule.fromJson(Map<String, dynamic> json) =
      _$ScheduleImpl.fromJson;

  @override
  @JsonKey(name: 'schedule_id')
  String? get id;
  @override
  @JsonKey(name: 'schedule_date')
  DateTime get scheduleDate;
  @override
  @JsonKey(name: 'schedule_time')
  String get scheduleTime;
  @override
  @JsonKey(name: 'outfit_id')
  int? get outfitId;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduleImplCopyWith<_$ScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
